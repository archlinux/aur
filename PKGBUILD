# Maintainer: Shiro836
# waydroid-nvidia-bin — Waydroid with full NVIDIA GPU acceleration:
# guest renders Vulkan/GL through Mesa Venus over a unix socket into the
# host's proprietary NVIDIA driver (see the repo README for architecture).
#
# Ships:
#  - patched waydroid (python, built from source here — provides/conflicts
#    waydroid; the patch makes the config generator emit our bind-mounts so
#    they survive `waydroid upgrade`, and adds suspend_action=none)
#  - host Venus renderer (virgl_test_server + virgl_render_server), CI-built
#  - guest driver stack (Venus vulkan HAL, gralloc backend — CI-built;
#    hwcomposer, ANGLE, surfaceflinger — prebuilt until their CI provisioning
#    lands, see packaging/aur/PREREQS.md)
#
# Every CI-built asset carries a SLSA provenance attestation:
#   gh attestation verify <file> --repo Shiro836/waydroid-nvidia

pkgname=waydroid-nvidia-bin
pkgver=0.1.0rc2
pkgrel=1
_tag=v0.1.0-rc2
_waydroid_sha=a33a5c0b31d89d6ce687381104b30aff4dd2d330
pkgdesc="Waydroid with NVIDIA GPU acceleration (Mesa Venus over vtest socket; needs the nvidia-open kernel modules)"
arch=('x86_64')
url="https://github.com/Shiro836/waydroid-nvidia"
license=('GPL-3.0-or-later')
depends=(
  # waydroid runtime (matches extra/waydroid)
  'lxc' 'python' 'python-gbinder>=1.3.0' 'python-gobject' 'nftables' 'dnsmasq'
  'gtk3' 'python-dbus' 'pulse-native-provider'
  # host Venus renderer
  'libepoxy' 'libdrm' 'mesa' 'libx11' 'expat' 'vulkan-icd-loader'
)
optdepends=(
  'nvidia-utils: the NVIDIA proprietary Vulkan driver this stack targets'
  'python-pyclip: clipboard manager support'
)
provides=('waydroid')
conflicts=('waydroid')
# keep binaries byte-identical to the attested release assets (and host strip
# on bionic ELFs is not trustworthy)
options=('!strip' '!debug')
install=waydroid-nvidia.install
source=(
  "waydroid-nvidia-${_tag#v}.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
  "waydroid-$_waydroid_sha.tar.gz::https://github.com/waydroid/waydroid/archive/$_waydroid_sha.tar.gz"
  "$url/releases/download/$_tag/waydroid-nvidia-host-x86_64-$_tag.tar.zst"
  "$url/releases/download/$_tag/waydroid-nvidia-guest-android-x86_64-$_tag.tar.zst"
  "$url/releases/download/$_tag/waydroid-nvidia-guest-prebuilts-$_tag.tar.zst"
  'wd-venus.service'
  'waydroid-venus.tmpfiles'
  'waydroid-nvidia-setup'
)
# The release tarballs are flat — extract them into named dirs in prepare().
noextract=(
  "waydroid-nvidia-host-x86_64-$_tag.tar.zst"
  "waydroid-nvidia-guest-android-x86_64-$_tag.tar.zst"
  "waydroid-nvidia-guest-prebuilts-$_tag.tar.zst"
)
sha256sums=('4c5f07da29567a295058bc344d6c03d6d43f7694fafcfe527210b3dc26c3958c'
            'e7817beac7e26f7d54b2d9f49c847dab8e137c92e403825829e7abbd0b63c411'
            '88d741816b3a4565aebe02afc242eb83c53748b72dbe5dc6a530f9468260672e'
            'fbb81d10f86a64332f957ccb25d198689664a38e5220a6b3dfeda4edc6be18c8'
            'd83dc2fdc2b6892bbc6537b88a38d0e98b824bd29fa72ae87fbc12f2d53188ae'
            '4bc083ac6fc8d0d0fd31546f5abd9912ca1304571d5a6c9ee42351b1e745193f'
            '501db3b266f8a49f643d4054ba948ba40fcefe0fee1f3647bff955184acf533e'
            'dd9e51f09eec6de3b8687a49d013ddbcdff6d26ded8b6b4169f6c2ad43924d01')

prepare() {
  cd "waydroid-$_waydroid_sha"
  patch -p1 < "$srcdir/waydroid-nvidia-${_tag#v}/patches/waydroid/0001-nvidia-integration.patch"
  cd "$srcdir"
  mkdir -p host guest
  bsdtar -C host  -xf "waydroid-nvidia-host-x86_64-$_tag.tar.zst"
  bsdtar -C guest -xf "waydroid-nvidia-guest-android-x86_64-$_tag.tar.zst"
  bsdtar -C guest -xf "waydroid-nvidia-guest-prebuilts-$_tag.tar.zst"
}

package() {
  # 1. patched waydroid (same layout as extra/waydroid)
  make -C "waydroid-$_waydroid_sha" install DESTDIR="$pkgdir" USE_NFTABLES=1

  # 2. host Venus renderer (private libdir; unit sets LD_LIBRARY_PATH)
  install -Dm755 host/virgl_test_server host/virgl_render_server \
    -t "$pkgdir/usr/lib/waydroid-nvidia"
  install -Dm755 host/libvirglrenderer.so.1 -t "$pkgdir/usr/lib/waydroid-nvidia"

  # 3. guest stack (waydroid-nvidia-setup copies these into /var/lib/waydroid)
  install -Dm644 guest/*.so -t "$pkgdir/usr/lib/waydroid-nvidia/guest"
  [ -f guest/surfaceflinger ] && \
    install -Dm755 guest/surfaceflinger -t "$pkgdir/usr/lib/waydroid-nvidia/guest"

  # 4. host integration
  install -Dm644 wd-venus.service "$pkgdir/usr/lib/systemd/user/wd-venus.service"
  install -Dm644 waydroid-venus.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/waydroid-venus.conf"
  install -Dm755 waydroid-nvidia-setup "$pkgdir/usr/bin/waydroid-nvidia-setup"
}

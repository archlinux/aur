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
pkgver=0.1.2
pkgrel=1
_tag=v0.1.2
_waydroid_sha=a33a5c0b31d89d6ce687381104b30aff4dd2d330
pkgdesc="Waydroid with NVIDIA GPU acceleration (Mesa Venus over vtest socket; needs the nvidia-open kernel modules)"
arch=('x86_64')
url="https://github.com/Shiro836/waydroid-nvidia"
license=('GPL-3.0-or-later')
depends=(
  # waydroid runtime (matches extra/waydroid)
  'lxc' 'python' 'python-gbinder>=1.3.0' 'python-gobject' 'nftables' 'dnsmasq'
  'gtk3' 'python-dbus' 'pulse-native-provider'
  'binutils' # readelf validates guest ABI and SONAME before setup installs it
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
  'waydroid-nvidia.rules'
)
# Release guest tarballs preserve Android-relative paths. Both extract into the
# same guest tree, but own disjoint paths (Mesa/gralloc vs ANGLE/HWC/SF).
noextract=(
  "waydroid-nvidia-host-x86_64-$_tag.tar.zst"
  "waydroid-nvidia-guest-android-x86_64-$_tag.tar.zst"
  "waydroid-nvidia-guest-prebuilts-$_tag.tar.zst"
)
sha256sums=('6fa52429ba2dc9c569fea7c339fe8b096c9127e725d40696ccf96f9924d41f3d'
            'e7817beac7e26f7d54b2d9f49c847dab8e137c92e403825829e7abbd0b63c411'
            '6372d4f78ff4e9442e32a60d9b1ead11f238124f5acd57a92bbb4fd74c9d61e8'
            'c0a6ee7a69c6bc6075f7197d6c3cc2e213bf1b061b032f20da6f7441f8704574'
            '61899f56c203b750d41f7c141a1ee264cb68241748cc9cda512ed45f2997cbd1'
            '4bc083ac6fc8d0d0fd31546f5abd9912ca1304571d5a6c9ee42351b1e745193f'
            '501db3b266f8a49f643d4054ba948ba40fcefe0fee1f3647bff955184acf533e'
            'd56c2b9a8cb9ac2f4afd1afaebfa877171e78ad25fc666d5a46da5cc67db2083'
            'cdceadba519c3e6dada147c1a628ca64bf7f49993f84f50cc9a52da57963c9fe')

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

  # 3. guest stack, preserving the Android-relative lib/lib64 split. Keep this
  # allowlist explicit so a malformed release cannot silently flatten or mix
  # ELF32 and ELF64 libraries with identical names.
  local rel
  local guest_libs=(
    vendor/lib/hw/vulkan.virtio.so
    vendor/lib/egl/libEGL_angle.so
    vendor/lib/egl/libGLESv1_CM_angle.so
    vendor/lib/egl/libGLESv2_angle.so
    vendor/lib64/hw/vulkan.virtio.so
    vendor/lib64/egl/libEGL_angle.so
    vendor/lib64/egl/libGLESv1_CM_angle.so
    vendor/lib64/egl/libGLESv2_angle.so
    vendor/lib64/libgbm_mesa_wrapper.so
    vendor/lib64/hw/hwcomposer.waydroid.so
  )
  for rel in "${guest_libs[@]}"; do
    if [[ ! -f "guest/$rel" ]]; then
      printf 'waydroid-nvidia-bin: required guest payload missing: %s\n' "$rel" >&2
      return 1
    fi
    install -Dm644 "guest/$rel" "$pkgdir/usr/lib/waydroid-nvidia/guest/$rel"
  done
  [[ -f guest/system/bin/surfaceflinger ]] || {
    printf 'waydroid-nvidia-bin: required guest payload missing: system/bin/surfaceflinger\n' >&2
    return 1
  }
  install -Dm755 guest/system/bin/surfaceflinger \
    "$pkgdir/usr/lib/waydroid-nvidia/guest/system/bin/surfaceflinger"

  # 4. host integration
  install -Dm644 wd-venus.service "$pkgdir/usr/lib/systemd/user/wd-venus.service"
  install -Dm644 waydroid-venus.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/waydroid-venus.conf"
  install -Dm755 waydroid-nvidia-setup "$pkgdir/usr/bin/waydroid-nvidia-setup"
  # udmabuf access for the seated user (wd-venus CPU-mappable gralloc buffers)
  install -Dm644 waydroid-nvidia.rules "$pkgdir/usr/lib/udev/rules.d/70-waydroid-nvidia.rules"
}

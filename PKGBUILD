# Maintainer: cagedbird043 <cagedbird043@gmail.com>
# waydroid-a17-nvidia-bin — Waydroid for Android 17 (WayDroid-ATV LineageOS 24.0) on NVIDIA GPUs.
#
# Ships the host side of waydroid-nvidia (Shiro836/waydroid-nvidia v0.2.0-rc10) with the patches of
# https://github.com/cagedbird043/waydroid-a17-nvidia (A17 vendor support, KernelSU seccomp, hwcomposer
# clipboard, host folder sharing, the rc11 video and NVK fixes, NVENC encoders), the nvidia-prolapse vendor image
# built from that repository (NVK + ANGLE, NVDEC, NVENC, freeform cards, host IME), the native bundle it was built
# against (dual-queue NVK, Rust RM with the rc11 video decoder and the NVENC encoder, Codec2 service built against
# Android 17) and a KWin script that reopens cards where they were closed.
# The Android system image is not included: waydroid-nvidia-setup downloads it (see post_install).

pkgname=waydroid-a17-nvidia-bin
pkgver=20261025.2
pkgrel=1
_tag=a17-20261025-2
_wn_sha=29ffa3a237b0d79a751748bd9bb82c50dd577808      # waydroid-nvidia v0.2.0-rc10 release notes commit
_wn_tag=v0.2.0-rc10
_waydroid_sha=a33a5c0b31d89d6ce687381104b30aff4dd2d330
pkgdesc="Waydroid for Android 17 (WayDroid-ATV) with NVIDIA acceleration: NVK + ANGLE vendor image, freeform cards, host IME and clipboard"
arch=('x86_64')
url="https://github.com/cagedbird043/waydroid-a17-nvidia"
license=('GPL-3.0-or-later' 'Apache-2.0' 'MIT')
depends=(
  # waydroid runtime (matches extra/waydroid)
  'lxc' 'python' 'python-gbinder>=1.3.0' 'python-gobject' 'nftables' 'dnsmasq'
  'gtk3' 'python-dbus' 'pulse-native-provider'
  'binutils'   # readelf: the setup checks guest ABI and SONAMEs
  'e2fsprogs'  # debugfs: the release gate reads the bionic runtime from system.img
  'util-linux' # unshare (gate), mount idmap (shared folders)
  # host Venus renderer (venus driver mode)
  'libepoxy' 'libdrm' 'mesa' 'libx11' 'expat' 'vulkan-icd-loader'
)
makedepends=('zstd' 'git')   # git apply: the waydroid-nvidia patches carry binary test streams
optdepends=(
  'nvidia-open: the NVIDIA open kernel module the vendor image runs on'
  'kernelsu-dkms: root in the container (see the repository kernelsu/README.md)'
)
provides=('waydroid')
conflicts=('waydroid' 'waydroid-nvidia-bin')
options=('!strip' '!debug')
install=waydroid-a17-nvidia.install
_wn_rel=https://github.com/Shiro836/waydroid-nvidia/releases/download/$_wn_tag
_rel=$url/releases/download/$_tag
source=(
  "waydroid-nvidia-$_wn_sha.tar.gz::https://github.com/Shiro836/waydroid-nvidia/archive/$_wn_sha.tar.gz"
  "waydroid-a17-nvidia-$_tag.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
  "waydroid-$_waydroid_sha.tar.gz::https://github.com/waydroid/waydroid/archive/$_waydroid_sha.tar.gz"
  "$_wn_rel/waydroid-nvidia-host-x86_64-$_wn_tag.tar.zst"
  "$_wn_rel/waydroid-nvidia-guest-android-x86_64-$_wn_tag.tar.zst"
  "$_wn_rel/waydroid-nvidia-guest-prebuilts-$_wn_tag.tar.zst"
  "waydroid-a17-nvidia-native-x86_64-$_tag.tar.zst::$_rel/waydroid-a17-nvidia-native-x86_64.tar.zst"
  "vendor-$_tag.img.zst.part00::$_rel/vendor.img.zst.part00"
  "vendor-$_tag.img.zst.part01::$_rel/vendor.img.zst.part01"
  "vendor-$_tag.img.zst.part02::$_rel/vendor.img.zst.part02"
  "vendor-$_tag.img.zst.part03::$_rel/vendor.img.zst.part03"
  "vendor-$_tag.img.zst.part04::$_rel/vendor.img.zst.part04"
)
noextract=(
  "waydroid-nvidia-host-x86_64-$_wn_tag.tar.zst"
  "waydroid-nvidia-guest-android-x86_64-$_wn_tag.tar.zst"
  "waydroid-nvidia-guest-prebuilts-$_wn_tag.tar.zst"
  "waydroid-a17-nvidia-native-x86_64-$_tag.tar.zst"
)
sha256sums=('4dc67241bf35189d4490306611f7f52e49117d04511a60999e96328f010dd84f'
            '507ba87e7ec784e3a04fd1549291d8286d85d877e8d3ae9494f258eeac1bdeec'
            'e7817beac7e26f7d54b2d9f49c847dab8e137c92e403825829e7abbd0b63c411'
            '124106f95e1b35c75eed8a966ab66284760fd6d02c79ad9fadd88355d4e3a2d7'
            '5fa325de02c2ef9c13f972efba98e27cdf4d2d48c0a33cf9a884ade8eaa74c50'
            '3fe5822ca2b9ed3aa6fcd9c9627679a04592837b947d7754911c3ab4c1007ec2'
            '203e3495c2bb80e02070a389fd4374f9044ffba6653c4dd31e8609d7ad768169'
            '09e82830df54a864edaf7cf14b92ddc0965680ee8b685834e8a8a41522f870f6'
            'fc8efc7a597ef28c9c0633bdb7b654e5a960136d7b47596f7afe242908e12880'
            'a2299bd5044ad6715a320009be0af8b224674626b937e76f7101a70cd7115734'
            'b4009690f534bdbdbe616f90c8840c7393f3393571a3d64435cc4daa9481bb13'
            'a18d000622dfe665e6d1822d69860eca926a6edb3d6ddb84f81497b66d35e372')

prepare() {
  local wn="$srcdir/waydroid-nvidia-$_wn_sha" a17="$srcdir/waydroid-a17-nvidia-$_tag" p
  # outside any repository: inside one (makepkg run from a git checkout) git apply would silently skip every path
  for p in "$a17"/patches/waydroid-nvidia/*.patch; do
    GIT_CEILING_DIRECTORIES="$srcdir" git -C "$wn" apply --whitespace=nowarn "$p"
  done
  grep -q 'rustc-cdylib-link-arg=-Wl,-soname' "$wn/nvidia-prolapse/driver-source/native/build.rs"

  cd "$srcdir/waydroid-$_waydroid_sha"
  patch -s -p1 < "$wn/patches/waydroid/0001-nvidia-integration.patch"
  for p in "$wn"/waydroid/000[1-9]-*.patch; do
    patch -s -p1 < "$p"
  done
  cmp "$wn/waydroid/nvidia_native.py" tools/helpers/nvidia_native.py

  cd "$srcdir"
  mkdir -p host guest
  bsdtar -C host  -xf "waydroid-nvidia-host-x86_64-$_wn_tag.tar.zst"
  bsdtar -C guest -xf "waydroid-nvidia-guest-android-x86_64-$_wn_tag.tar.zst"
  bsdtar -C guest -xf "waydroid-nvidia-guest-prebuilts-$_wn_tag.tar.zst"
}

build() {
  cd "$srcdir"
  # the native bundle the vendor image names in ro.vendor.nvidia_prolapse.build_record
  rm -rf native && mkdir native
  bsdtar -C native -xf "waydroid-a17-nvidia-native-x86_64-$_tag.tar.zst"
  cat vendor-$_tag.img.zst.part0[0-4] | zstd -dq -o vendor.img -f
  rm -rf vendor-ota && mkdir vendor-ota
  python "waydroid-nvidia-$_wn_sha/packaging/vendor-ota.py" vendor.img native/BUILD-RECORD.json vendor-ota \
    --tag "$_wn_tag-a17" --repo cagedbird043/waydroid-a17-nvidia
  rm -f vendor.img
}

package() {
  local wn="$srcdir/waydroid-nvidia-$_wn_sha" aur="$srcdir/waydroid-nvidia-$_wn_sha/packaging/aur/waydroid-nvidia-bin"

  # 1. patched waydroid (same layout as extra/waydroid)
  make -C "waydroid-$_waydroid_sha" install DESTDIR="$pkgdir" USE_NFTABLES=1
  # the system interpreter, which has the dbus/gobject/gbinder bindings: `env python3` follows the
  # caller's PATH (pyenv, conda, linuxbrew) and waydroid then fails on `import dbus`
  sed -i '1s|^#!.*python3.*$|#!/usr/bin/python3|' "$pkgdir/usr/lib/waydroid/waydroid.py"

  # 2. host Venus renderer (private libdir; unit sets LD_LIBRARY_PATH)
  install -Dm755 host/virgl_test_server host/virgl_render_server host/libvirglrenderer.so.1 \
    -t "$pkgdir/usr/lib/waydroid-nvidia"

  # 3. guest stack of the venus mode, Android-relative paths kept
  local rel
  for rel in vendor/lib/hw/vulkan.virtio.so vendor/lib/egl/libEGL_angle.so vendor/lib/egl/libGLESv1_CM_angle.so \
             vendor/lib/egl/libGLESv2_angle.so vendor/lib64/hw/vulkan.virtio.so vendor/lib64/egl/libEGL_angle.so \
             vendor/lib64/egl/libGLESv1_CM_angle.so vendor/lib64/egl/libGLESv2_angle.so \
             vendor/lib64/libgbm_mesa_wrapper.so vendor/lib64/hw/hwcomposer.waydroid.so; do
    install -Dm644 "guest/$rel" "$pkgdir/usr/lib/waydroid-nvidia/guest/$rel"
  done
  install -Dm755 guest/system/bin/surfaceflinger "$pkgdir/usr/lib/waydroid-nvidia/guest/system/bin/surfaceflinger"

  # 4. nvidia-prolapse: vendor image, the native bundle it was built against, gate/install tools
  bash "$wn/packaging/native/install-native.sh" "$wn" "$srcdir/waydroid-a17-nvidia-native-x86_64-$_tag.tar.zst" \
    vendor-ota/waydroid-nvidia-vendor-x86_64-$_wn_tag-a17.zip vendor-ota/waydroid-nvidia-vendor-ota-$_wn_tag-a17.json \
    "$pkgdir" "$_wn_tag"
  install -Dm644 "$aur/waydroid-nvidia-driver.hook" "$pkgdir/usr/share/libalpm/hooks/90-waydroid-nvidia-driver.hook"
  install -Dm755 "$aur/driver-update-note" "$pkgdir/usr/lib/waydroid-nvidia/driver-update-note"

  # 5. host integration
  install -Dm644 "$aur/wd-venus.service" "$pkgdir/usr/lib/systemd/user/wd-venus.service"
  install -Dm644 "$aur/waydroid-venus.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/waydroid-venus.conf"
  install -Dm755 "$aur/waydroid-nvidia-setup" "$pkgdir/usr/bin/waydroid-nvidia-setup"
  install -Dm644 "$aur/waydroid-nvidia.rules" "$pkgdir/usr/lib/udev/rules.d/70-waydroid-nvidia.rules"
  install -Dm644 "$aur/waydroid-nvidia-gpu.rules" "$pkgdir/usr/lib/udev/rules.d/70-waydroid-nvidia-gpu.rules"

  # 6. KWin script: cards reopen where they were closed (enable in System Settings > Window Management > KWin Scripts)
  install -d "$pkgdir/usr/share/kwin/scripts"
  cp -r --no-preserve=ownership,mode "waydroid-a17-nvidia-$_tag/host/kwin-waydroid-placement" \
    "$pkgdir/usr/share/kwin/scripts/waydroid-placement"
}

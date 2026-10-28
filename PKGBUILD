# Maintainer: Shiro836
# waydroid-nvidia-bin — Waydroid with NVIDIA GPU acceleration. Driver modes (waydroid.cfg
# nvidia_driver_mode): nvidia-prolapse (default: our Waydroid vendor image with Mesa NVK + our Rust RM
# backend, ANGLE or our nvrm GLES, built from source) and venus (Mesa Venus over a socket to the host driver).
#
# Ships:
#  - patched waydroid (python, built from source here — provides/conflicts
#    waydroid; patches/waydroid/0001 (bind-mounts that survive `waydroid upgrade`,
#    suspend_action=none) + waydroid/0001-lxc-nvidia-native-mounts.patch (driver modes,
#    the nvidia-prolapse mount generator, default mode on `waydroid init`))
#  - nvidia-prolapse: our Waydroid vendor image (vendor-image/, as a Waydroid OTA zip + its channel JSON),
#    the release bundle it was built from (CI-built payload + install-time gate programs) and the tools
#    that gate, install and activate it (/usr/lib/waydroid-nvidia/{native,vendor}, packaging/native/install-native.sh)
#  - host Venus renderer (virgl_test_server + virgl_render_server), CI-built
#  - guest stack (Venus vulkan HAL, gralloc backend, hwcomposer, ANGLE, surfaceflinger), CI-built
#
# Every CI-built asset carries a SLSA provenance attestation:
#   gh attestation verify <file> --repo Shiro836/waydroid-nvidia

pkgname=waydroid-nvidia-bin
# release assets are hashed by `updpkgsums` at tag time (packaging/aur/RELEASING.md step 3)
pkgver=0.2.0
pkgrel=1
_tag=v0.2.0
_waydroid_sha=a33a5c0b31d89d6ce687381104b30aff4dd2d330
pkgdesc="Waydroid with NVIDIA GPU acceleration (our vendor image: NVK + Rust RM backend in the container by default; Venus mode selectable)"
arch=('x86_64')
url="https://github.com/Shiro836/waydroid-nvidia"
license=('GPL-3.0-or-later')
depends=(
  # waydroid runtime (matches extra/waydroid)
  'lxc' 'python' 'python-gbinder>=1.3.0' 'python-gobject' 'nftables' 'dnsmasq'
  'gtk3' 'python-dbus' 'pulse-native-provider'
  'binutils' # readelf validates guest ABI and SONAME before setup installs it
  'e2fsprogs' # debugfs: the nvidia-prolapse gate reads the bionic runtime from system.img
  'util-linux' # unshare: the i686 gate cases run in their own PID namespace
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
  "$url/releases/download/$_tag/waydroid-nvidia-native-x86_64-$_tag.tar.zst"
  "$url/releases/download/$_tag/waydroid-nvidia-vendor-x86_64-$_tag.zip"
  "$url/releases/download/$_tag/waydroid-nvidia-vendor-ota-$_tag.json"
  'wd-venus.service'
  'waydroid-venus.tmpfiles'
  'waydroid-nvidia-setup'
  'waydroid-nvidia.rules'
  'waydroid-nvidia-gpu.rules'
  'waydroid-nvidia-driver.hook'
  'driver-update-note'
)
# Release guest tarballs preserve Android-relative paths. Both extract into the
# same guest tree, but own disjoint paths (Mesa/gralloc vs ANGLE/HWC/SF).
noextract=(
  "waydroid-nvidia-host-x86_64-$_tag.tar.zst"
  "waydroid-nvidia-guest-android-x86_64-$_tag.tar.zst"
  "waydroid-nvidia-guest-prebuilts-$_tag.tar.zst"
  "waydroid-nvidia-native-x86_64-$_tag.tar.zst"
  "waydroid-nvidia-vendor-x86_64-$_tag.zip"
)
# the zero sums are the seven release downloads (source tarball + four asset tarballs + vendor image zip and
# channel JSON): updpkgsums at tag time
sha256sums=('b643aa267e786c10d031a4d8bd89d37da7fc696bb2c43d633c37126a263b8545'
            'e7817beac7e26f7d54b2d9f49c847dab8e137c92e403825829e7abbd0b63c411'
            '99d2814242e140d5ea91d3c23f4494500f3176e88746076ddae85a51d7d320b3'
            '7b57a74940bb1e5db1056a0154d2875f3b498eb6ab645665f6f6e90869f906b7'
            '7dd098c01e00159da66b3249872d48773bd3449aaae77eac23ab91fcabe3cedc'
            '33c9f75fa216c53828e93e8fb2a4e63562e3ab27b24c81268879ee48390fccf8'
            '692a0eeb45c288492f66ddba5b77ea15f00f88eca5354b048ec4b1e752aee29b'
            '2940a04d71ba26e32f85ec7223b19344a89cb9ecaafde4a715aaf9cff4ee3c60'
            '4bc083ac6fc8d0d0fd31546f5abd9912ca1304571d5a6c9ee42351b1e745193f'
            '501db3b266f8a49f643d4054ba948ba40fcefe0fee1f3647bff955184acf533e'
            '3c2baa9fccd224c596764bb829b7d4857fed5746e3ac2f5f50e91ae8c09fd21b'
            'cdceadba519c3e6dada147c1a628ca64bf7f49993f84f50cc9a52da57963c9fe'
            '79a173fc8bcd834330a57130a04d099af5c1e21b7d1a00796082de5772412f73'
            '9cc06d40ecc2c6c256c07d22ec8d47e4888ef4a094fafaf988e222434e244b44'
            '4dae95f4927b4f40ec8e0093b30b996ab5c5eff4da530eafd295cdac8b1987ff')

prepare() {
  cd "waydroid-$_waydroid_sha"
  patch -p1 < "$srcdir/waydroid-nvidia-${_tag#v}/patches/waydroid/0001-nvidia-integration.patch"
  patch -p1 < "$srcdir/waydroid-nvidia-${_tag#v}/waydroid/0001-lxc-nvidia-native-mounts.patch"
  cmp "$srcdir/waydroid-nvidia-${_tag#v}/waydroid/nvidia_native.py" tools/helpers/nvidia_native.py
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

  # 4. nvidia-prolapse: the vendor image + its release bundle + the tools that gate/install/activate it, root helper
  bash "waydroid-nvidia-${_tag#v}/packaging/native/install-native.sh" "waydroid-nvidia-${_tag#v}" \
    "waydroid-nvidia-native-x86_64-$_tag.tar.zst" "waydroid-nvidia-vendor-x86_64-$_tag.zip" \
    "waydroid-nvidia-vendor-ota-$_tag.json" "$pkgdir" "$_tag"
  install -Dm644 waydroid-nvidia-driver.hook "$pkgdir/usr/share/libalpm/hooks/90-waydroid-nvidia-driver.hook"
  install -Dm755 driver-update-note "$pkgdir/usr/lib/waydroid-nvidia/driver-update-note"

  # 5. host integration
  install -Dm644 wd-venus.service "$pkgdir/usr/lib/systemd/user/wd-venus.service"
  install -Dm644 waydroid-venus.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/waydroid-venus.conf"
  install -Dm755 waydroid-nvidia-setup "$pkgdir/usr/bin/waydroid-nvidia-setup"
  # udmabuf access for the seated user (wd-venus CPU-mappable gralloc buffers)
  install -Dm644 waydroid-nvidia.rules "$pkgdir/usr/lib/udev/rules.d/70-waydroid-nvidia.rules"
  install -Dm644 waydroid-nvidia-gpu.rules "$pkgdir/usr/lib/udev/rules.d/70-waydroid-nvidia-gpu.rules"
}

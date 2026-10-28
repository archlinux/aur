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
pkgver=20261028.2
pkgrel=1
_tag=a17-20261028-2
_wn_sha=29ffa3a237b0d79a751748bd9bb82c50dd577808      # waydroid-nvidia v0.2.0-rc10 release notes commit
_wn_tag=v0.2.0-rc10
_waydroid_sha=a33a5c0b31d89d6ce687381104b30aff4dd2d330
_vendor_parts=45
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
)
for (( _part=0; _part<_vendor_parts; _part++ )); do
  printf -v _suffix '%02d' "$_part"
  source+=("vendor-$_tag.img.zst.part$_suffix::$_rel/vendor.img.zst.part$_suffix")
done
unset _part _suffix
noextract=(
  "waydroid-nvidia-host-x86_64-$_wn_tag.tar.zst"
  "waydroid-nvidia-guest-android-x86_64-$_wn_tag.tar.zst"
  "waydroid-nvidia-guest-prebuilts-$_wn_tag.tar.zst"
  "waydroid-a17-nvidia-native-x86_64-$_tag.tar.zst"
)
sha256sums=('4dc67241bf35189d4490306611f7f52e49117d04511a60999e96328f010dd84f'
            'bd838f7d4c575a5128f8ff4a69178dcff29bca9d848f8e83f5e6d8a12dab6211'
            'e7817beac7e26f7d54b2d9f49c847dab8e137c92e403825829e7abbd0b63c411'
            '124106f95e1b35c75eed8a966ab66284760fd6d02c79ad9fadd88355d4e3a2d7'
            '5fa325de02c2ef9c13f972efba98e27cdf4d2d48c0a33cf9a884ade8eaa74c50'
            '3fe5822ca2b9ed3aa6fcd9c9627679a04592837b947d7754911c3ab4c1007ec2'
            '0d24c0a8efebca6fad5e0d61783af1cb747822488b665c7231be2d2e2dfb9930'
            '977f068c71a6226e1fe2e9c297e7c7a5fd8ccc59c36b26aaefad47acffa1f3c9'
            '7c7ff246157e5178e1ff06f0bde7ed0e55a4230a437a98382f42070ffdf43b1e'
            'c826838d3697b7451ca7e890e0e99678c9354995005bce0e1f39973f140fe643'
            '5ee7d42cdfde1216c39c11bdb3989a170cef40550a0fa28b99bdea01a5e25594'
            '9f03639af267b859e450299277cb9789c1980de5943c3a3b3523dda393a242c8'
            'c694c34e80b02dfbe9dc0b568a13ab7329aebfa31e21e7e31728e0f190aee28d'
            '82a5daacc819584c9411310778d40ae18b79168f6ec357fa94aec1d9257fb5ac'
            '60be3894fd2225f09c0ff43b4b6db5b91c2b5f57d16d64aaddc59d65e9023d42'
            '4465e3c1ef13e51fecb902ff0342ba20f371c8e2189d6a3f8b22aa6058bae42a'
            'a7c47b58944354eceffbd9f19734c4227e64cee40fd644d90118fecf264351b4'
            '7f319f897b430c9b57a07f51868c6f2a6e0899e026aa5c79b1d8d1876fc60116'
            'c13a453226095c4ef5b0728de292225579d5d1fd0b1ad85fe0cd927e7bd20c8e'
            '94d9d1f399c8fb6b174f40c48c7270d3306c864824df01baf3ec65bc86a0f96a'
            '8283bc8faadce9ab38a8f1e0629741d2def66987bf41dbc52fd3648ac29998c6'
            'd5bf0b939ed62ff45893159229db7faca54512d835626053b3451f2e388c8659'
            '6f1207edba2c1c34ce3fca5d962ab5e5a193614c14d6b6eeff7299d6c777fdf7'
            '78075ab0f349a632b67ed39182e8b6d254c013acc5c3c1e36aa8be090e30c188'
            'f2acd38fe73d8c3a5ef7b18c2d39f2f3749c6d6ff6bad092481f885565a4f3c0'
            '19663d9c4e461d43200b10020c5653218013f3af85bc6e4817178ca49f8c150b'
            'f2a6cfbfa21a88cb14e4372b98b5814c94b2cc4e8f99a1ecd8024b3347d56395'
            'bba82a24bc29e162c860ef0ca135e5c1ed18544d3dac8218ccbdbd393b364bdd'
            '57f4e0e78f03bdbc32a3ddc94f1740991520b390517c5084a8508faf5cac1c9d'
            '229f77d797783b11e3cea37abaee0058321ae977eb50f469d459307f1efabcfc'
            '777eca94bb209c546492feec01b6d0135bf323ae8af8b3b6795dbc1ba68a644f'
            '557e6b46ecf20dbd3a27309f6123e5c5b0b0885c2467a9de0c61344e540b2265'
            '7e37e0e370b1ef742a01b12669a35616263073be6ea56d33410c30f82589710e'
            '6be64473a783aad5a8a2194d70a957f5f7f584833ed9ea647fac6d4e888801a4'
            '103729a2a8f9aa03512badda7bf2bf07c785e44629d52679700a70fc0a8982a3'
            'cc78fad2ba3e163ebb00408013736e6e2e4b4657a6ad2a62f0343fae4ea96a4c'
            'c92b6520b23e66c42b2aeec6a9364cbbfe438e35bac7829cd916b381bbaa5484'
            'cd37e3a67e526711e57111cc80e3d55ce46e179381e8e5a313cf972552b7d5f9'
            'd1cfed36748acdb5f9e82df6bb79be674623976ea5edc65de8cff8419ee2f916'
            '52f46cf8c02fb36eb3461c07b259a3d50d3f32ace74f444384eb3e9531a5ad9f'
            '557d9f1d6b33cf63bb3a610b8481aac0d3eb23f6a5987045584bd82f521b4be2'
            'e0dd553d2578c24cb0c866b7871efdb5fccf32863deeb22180df732554ced4b8'
            '42f97af3a13e79b4626976d7b7927445ae3168f49e3f58216a4d1c3ddf7e3b5a'
            'b99c304e35d1136d247edfeb1e971e0351706719c3cb0e6affab1d31f67e1f9f'
            '280b59081310bc465b3e3b30c23de1792f47420fbb19479e10094269eec2dafb'
            'c54078fbe585e0d3acd909fb3cbb66cc0285eeed71389e5ac276a45a251385e8'
            '180320fcc1e985fd75cde35a43f2ba5d6cca95ebc31cb1e0e25165449c5914a2'
            '3cbcec70f0ac8dcda0e0b6a90dd1a7da7960b27960f5da32aa53e728804efcc4'
            '990187227da2b4da942d3451fe02039c0bdb5479c90b591a6ee522622f0517cd'
            'e46dc2640d59fd8f865b47fac3e3025d4c9780dbe828cffc1a56a9329ec0d8d5'
            'b84fc7dd8134b896a5325e7a8f2013c0cc6466e17c8d749272082b7fb102a4f5'
            'ec237e849329eef92a1693f564720f94bd7f160fb214e464798355afb6442500')

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
  cat vendor-$_tag.img.zst.part[0-9][0-9] | zstd -dq -o vendor.img -f
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

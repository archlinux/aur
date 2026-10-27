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
pkgver=20261028.1
pkgrel=1
_tag=a17-20261028-1
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
            '59b3f11b6733340f41063f8aab4c193e29094cc71e1c2d6ecc7237e702e07713'
            'e7817beac7e26f7d54b2d9f49c847dab8e137c92e403825829e7abbd0b63c411'
            '124106f95e1b35c75eed8a966ab66284760fd6d02c79ad9fadd88355d4e3a2d7'
            '5fa325de02c2ef9c13f972efba98e27cdf4d2d48c0a33cf9a884ade8eaa74c50'
            '3fe5822ca2b9ed3aa6fcd9c9627679a04592837b947d7754911c3ab4c1007ec2'
            '1b745453643406bc2c8a29fc435276ff4a8bdc3631776d268e1b4c9a72b69139'
            'd4685208d66aaa7b18ffcbb2cf91f1e21f658da8ecca941c0b7dac73aab27253'
            '5841a04372dfc1dc74928f725c7c2edad4c1c91c9799d7bce65dc9ecfe500727'
            'eca12f436c9044294690e0ea73ede6382551ca98d0f9daa6c88bd86666964239'
            '4e2dd4fc9ee5ed287bdff80a8afc7b131d88f8b167937a0546131880a0d3f99f'
            '667ad017abe268dfbd173f16a457639fa783b465f3ee5245ebe6288608da91c3'
            '9199605e8c04080252338e24076a622a7e336220a6b0fa8b950892ddf24d1279'
            'e27eefc0a38abbce0daf9482751665675d0518c18a2746ce7add98ecc055536a'
            '148d002d73e73e1adb7877da895b8c16965aa1b5d8b1a05c43e8ee33cbc17694'
            '7fcfdbe6205d05b622518fba73c7c7d232928cc522178f743026e68130c36f04'
            'd533104ddec6c2a8fc4cc084e4fc6bf53d67366c1db8e346b74aecb951fead66'
            '6255f2825e70951ce91ec9aadd3a000129f0fd86c668a655db63bd7ec71f0bb8'
            '44a832d1cd779e305fc4d4827f1887058d73f2b083e8f9ba729e603134832602'
            'bb8003dad5bbd84b7d4278f871bf969d5c6c008c6f90b04d41c1f900270009e6'
            'a4d4141cc3e290dca2e18935c75f3dd0bfb9cad12fd5ef27d2bdcaed7b71915c'
            '6a16b14903c87d70e027ee7326fe0a0e685994e12d5cc275a95aa3a8d654f858'
            '8a93fd4b896c448eaa81604bb0a716dd8f751d077f12ead1b26cff8f8001ac96'
            '7c940ac904fed9b4debe9992db0018ec61cd9dc7c85175a03bb665561d434d7b'
            '9279812db2d81e1a752a3960c59ba18c90e3ff210be7ac14f78447f271c48506'
            '6206200cecf25779937c738973ea47cf780f52bf3976be4d6769dc72e23160bd'
            '882d0c02fc72d85ac0108edba28fac260c07fc9fd20703b0fef2e8cd1619998a'
            '89ef45d8defba50235f380cc2df8c96a6008900370d855ad5302a2af8d52e43e'
            'a35827c1d7f1d09cab857fa4100f9ea3ffa01aefb10513831b24ae36b3c408e2'
            '5b7c24d83a1cf310a691e5776aa9493eb3c229c788d25680a9a927fda9b0cb14'
            'ff61a61875a9cb9f6b1d4000b52d53eda76efb294cd501b8acc24c9280fc07e0'
            '932fe12395f3bd8994133e0007d9c1269639884d6fa4d89b461737e3252ad373'
            '00a2d186b8c886a1dc472a93b44b87e024de5bb71be88609d9ad4f95d2ba4601'
            '8987969127adee592acd2bb8a094ca1f4a53065cae829af158eeacdad912b564'
            'efbb8bd9a354f57ce6607dc16a8585c34ca906ed4177c365e886b160b94c5e0a'
            'e3cfcc9e5e2da18fffbbb47295f822d8629d3a581d03b7ff9de719d867c9b29c'
            '4cea833df887d2458037520c590ebc1c68d72b84e60504b030f5cdeeec4ed4fd'
            '17608ca9e16667cf10c144aededfce2ba85ce9ad1fa6d64f7f1f00d8a216e673'
            'daddefac9772d0a8a089577c26476c862f20ec1245ae9c555b7bb8c25e7abbd6'
            'fd3df2672e0e8e782d69a72836f1c77b0e9763fd23dbf9026d82272a79829fb6'
            '9084a6f3d62e4a2fad875016c7def5a5d4120b5b419d62699100ec05fec7777d'
            'e3d0f669b46e4cb425754238200933e03172899cf49f2402417a6f549d5a7a98'
            'f19e620f42d921d9a085a3caf6b2829e064c712c121ddc51163573d5585846ac'
            '57b4f07352fbbb8cfa0ef59eb99966ad23b2cc127b47c9049466740a88d72b44'
            'b0f300b2775f3de841fbf0f9e6f2ffe5645d00e5602be679683469240d2df1b5'
            '552d2e566494ae8154da85c482fc1612b7f98d17ddb1e681611edf5ffa8cf426'
            'c80811694d0bf1f752c1ac52c1847bb4c3c15ded54ab1de41855f525e9cfa16e'
            '3c15f53f757269d4776b0f7489a3431ec7dbd669a6fd2b53a0cb690dd4d21cce'
            'cdb3c3737f8540a8734ae904675aa2cd073e995c8fd206a1062d2945fe41c079'
            'e25503c7c11e2c67a80538af78d9c824a3abdc77e295e0e2c04b25d5d95e2a71'
            'c859ba46dc9a3ad5c401dbfebe7e15299cd466d7d6775f720b31b56367bf3444'
            '758d91f96e4ca50baa61d4aa39ab3a881752024d5bf4dfdb293b4d8414a70c6c')

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

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
pkgver=20261111.1
pkgrel=1
_tag=a17-20261111-1
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
  'erofs-utils'  # dump.erofs: the release gate reads vendor.img
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
            'cb6b88ef9f57e7cb2b028c79c43dbb012fd8b54f376dfe7e2e2b5431d980e414'
            'e7817beac7e26f7d54b2d9f49c847dab8e137c92e403825829e7abbd0b63c411'
            '124106f95e1b35c75eed8a966ab66284760fd6d02c79ad9fadd88355d4e3a2d7'
            '5fa325de02c2ef9c13f972efba98e27cdf4d2d48c0a33cf9a884ade8eaa74c50'
            '3fe5822ca2b9ed3aa6fcd9c9627679a04592837b947d7754911c3ab4c1007ec2'
            '68750f73fa9c35c4a3a752ceffcbad4a1cdcf48a21f2fca82c302eba0bf1581f'
            'd81a662d201a942015b200b18bee9cdf1c3cbf04360546fbcf6db95a42433606'
            '907358f582d260d4659fdf77f98016336f8119e6a35c454848697cb2f05a04e0'
            'ade1ad2e61fd3cdb141c6539bd3c7ec325c2573c3ff6dec18fda2832f7037bea'
            '0e7bf36dee8ea756081a26641bdf9b4866075ee92731355c2bb6249a1db172db'
            'cc3a1ccc1b75a7828fc8c7cdc9acd4b03dde220f920d879ff071cb41a80da6ff'
            '3d133807c344cc8db9c6a43173e471705164cd132217833392b38d8345884a84'
            '8a93987b75587c067a9877bc50693bfcc5fb70b22186a04db535950f4592917b'
            'c6165ea8635c51e270b3f34989e9518323223e4d2affc082e256ec7d83567eef'
            '6ad0529cad8cdd2c76ea07583836f59f48df92475b4eddbfdbf9304364ae212e'
            'd00c867f9d6f519e244bf7851ebb28848b47b9b2ef4efe202f579f327f9f110f'
            '74cc877f22851a3638a9be0160c5d39f55e423a04b00238061e4c015f1c92954'
            'dc1466a97f31167f6630b751f32764f0d0e389ae8c717f3cabf29b044103ee19'
            'f016680a6a75c39149570dd91c5f481900de641907f8b670f22545790af6d5d7'
            'ed38b29c627e0e0924225388e2198276eb712125b7a9cc9f900beaf29f2616dc'
            'aea1db41f5348581689d13c323cc959ff65f8eabc40481bc7ed9c3613c6750e6'
            'f1cc1a7eda59cfa232239ba7015fe5d3e50df36be799d2c736d19b3e5cb9300e'
            'e99000b43ac98602f2c34e6e21f63597ea9617a6fee54b218f99eb2f852a0231'
            'a2d21511b4e24581f96f6febfb214a5834295d1c4af7a6d84c408b55d09eab45'
            'e69c5eb30f7bd28c8b8fb4a94cf8768acb7edf0c07bd16bbec1b35aa49c93d9b'
            '2b2314cef8b5393a9ebb17808792fcf156672399cf7ea2686a99524bd80fd6d3'
            '201ce6ea95677e5152204cefd90c073db4897dcfbbe61d7daeebcbfcdb08bccd'
            '264b5332a4423d09ad34bd62d714df51e1188c0221cad849e816b3dd6f142ac8'
            '67eabe1139e362e17ae50f46a062be2ef667539f18c384311378a3c66bdbd894'
            '37fc209e49070dabbe295ad596fccff501df42624663909f59232e43b3b8b130'
            '3a0b7b9c3709a50719cf4a5879002d3a4c8fb07a18afeb8441ff94de55105af6'
            'ea48c29f16c54ca1ca051c5d2a4994b35b183e338daf731253830a9c5b027048'
            '6fa877ec95457cd86ae45e840740c46781cec03fffe1c13ae68e0f53d641ed97'
            '21b0df92a8632888f4b130763c6a2cb8444c0e130a05f6451acec4cb3dd81b36'
            'c38b2fc78bee6a0a10c8f87c7e7cc939354f5c499c19b6b9694f6df34cebd6bd'
            'f55fde8afb84369f9003db4281001512d28d902f15ebd4d02a3ca4b12053c643'
            '3aec8d69e404b4dc9bfe3817e364bf37f25da9a14a3a912c0c600f54335b8a23'
            '4b08ddf65af30f45060f2d2866096b5f0ce8ab34f1d40ca1205d868427fa3940'
            '2d8c12ce71d9c913cb157c9c15f9f5e2750f1f25354f2bb57c72b15d8a985232'
            '5529901cb2b6e67db9d4b3949ec655af6811d7453f158f76cb19d4362f29a13e'
            'e2087cc63f5c13dff5b0a138f85798fb4bdac568b9e681e81159aecef5206bdc'
            '61a936f00dd18f906a94ede499e9076ba68b571c03f944a88540d9b26d7bc369'
            '02af185910a105cefc0b4f466d93dff274c82fda08a73b1d730905c45ee060c9'
            '08ffa7c103b747dc99ca2dcaaaf970852188d63d9e8b6f498bd3d56f29ed1186'
            '02785fa2b88bd4ef98e86f785cb4773bb9c241c25abd5e7be65a9c987fc5f8c5'
            '8915299d9dd0508ee02366ab64291168127821200284ac0a38eb4bb19cc6c6d0'
            '989dde5f50d7fbe6389fa215d283906cdc1fa65c24d20ba8187d491df0af8173'
            '1c8fe7ba07422539a9359e34c8a16392a01c1f1efb771c15b6670e2014edced4'
            'de535acaa16443db226f0a9cdb691b25721a31bea53c7dc62af42557fda1c5d4'
            'd28e9a7ae43bc55464deacf7d733f847d326a23fc9f6fbb6630451e5c687f39c'
            '64ad67465ba7183aa0e862e5fbfca54646a75eb33cd40742dbd9e3f285581142')

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

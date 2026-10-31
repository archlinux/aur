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
pkgver=20261031.2
pkgrel=1
_tag=a17-20261031-2
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
            '97d1cadb48fe5e0c3ac349aee1c1f0640a82da1b65d54bbbe015cc3c35052cdd'
            'e7817beac7e26f7d54b2d9f49c847dab8e137c92e403825829e7abbd0b63c411'
            '124106f95e1b35c75eed8a966ab66284760fd6d02c79ad9fadd88355d4e3a2d7'
            '5fa325de02c2ef9c13f972efba98e27cdf4d2d48c0a33cf9a884ade8eaa74c50'
            '3fe5822ca2b9ed3aa6fcd9c9627679a04592837b947d7754911c3ab4c1007ec2'
            '01f17b394171deefe1d05da3965b1271f7ac745234aa27bd70cb39e0aca803d4'
            'b82e243471ab06947e8a43fe96b0c8bd94658b066104b97371fc1a7eae32d1a0'
            '7c7ff246157e5178e1ff06f0bde7ed0e55a4230a437a98382f42070ffdf43b1e'
            'c826838d3697b7451ca7e890e0e99678c9354995005bce0e1f39973f140fe643'
            '5ee7d42cdfde1216c39c11bdb3989a170cef40550a0fa28b99bdea01a5e25594'
            '9f03639af267b859e450299277cb9789c1980de5943c3a3b3523dda393a242c8'
            'c694c34e80b02dfbe9dc0b568a13ab7329aebfa31e21e7e31728e0f190aee28d'
            '82a5daacc819584c9411310778d40ae18b79168f6ec357fa94aec1d9257fb5ac'
            '60be3894fd2225f09c0ff43b4b6db5b91c2b5f57d16d64aaddc59d65e9023d42'
            '4465e3c1ef13e51fecb902ff0342ba20f371c8e2189d6a3f8b22aa6058bae42a'
            'a7c47b58944354eceffbd9f19734c4227e64cee40fd644d90118fecf264351b4'
            'd2819092306683dd881ed62ae189af701ca79136e55825f18c8e9db7d96c6ad6'
            'c4892b91e09b460122600282263e67807d08a1ce9052c2ca645abf2c77049b90'
            'db7a9165adff0052601a7ce16cf4bf2576951c9ae8dde7b428e3d06afc23b317'
            '08789438990dd9e1e65cbe349a522bd2d6643732ef5494e97a1d281f9264c0af'
            '5c646ac84f5770f089072ccd9d743d8bc12e745ed53f43059db1ce7e8054d99a'
            '0ed7a38ed03b1ac4a46326f4f34da190efb3f9dc0a9302785605fc0e125f7991'
            'fa99d483ab2f6f295f5c019ac9673dabaf58b31022dae486002e6adf980d47fd'
            'a9045e01c9793e3e744b91c14e649009717797982c2074232808255174fc93df'
            '71d7f6e43ed93891b73d8c13737ab4b00848f6fde39b40cf42773a7f14e10b97'
            '746d09c66e794800fd802947fc55afcbe07635d9d593ccd981c1917865cf430b'
            'aff1e32ee837a91d3469fc9e2bcc4545d8c8deef173c90d2fc8ae91cb31b85be'
            'ed67ba44c1eef4bd45d1901c54ef9d12f25b055c0c71ff5ec4ed6308f0c664d5'
            '78d4f1f57d03b57e24e2f6c46b904e47479673fd76647a8a53768c5c2ada7940'
            '0af3334c8b7234251c3aff14f8d69fb6f26c205e50681e935cc71032449a2cb3'
            '810026ef542be22de166ba89ddf9e6f612b5449e9340f1f90a5de82981e3ec09'
            '56cda9e4107294ae4e55ff0d31a3de00d30dbe03ec083f4f114a3d704b5d9828'
            'c50a9ce038e3cd4698269bcf71901305407f635818f5284758be081b8d463618'
            'bc941dcb88d1e20120d8c8584245cbca26e37ec7339646f1da63570339c5c63a'
            '6476965adc7f050cecaa6208183f51fb2693213e1e83656c5d93b76913c46fb9'
            '96b33cfb915daf665b77d1a114c3196a9e714ef309dd0afbf5cdf0321a0ae719'
            'a6c651e52aea0285397c9f8357fbe213d166e57c43d08a84c98deef9c96c10e6'
            'd050e0d1d90031eaafd76100eb24a43b4f1b49b72de96005e6803b87d14ae6db'
            '536933e3f0c874bf2ef59ecf59ea8b0f4639d7caf5765af5d8cd323af2709e49'
            'be60502e19f4f10801d2011112ff44de6a1b1668400b094711b514cce171c7bf'
            '0dacbb71f4be921ec66554342576ac4d68e4cb0cd0986e21b037468780bf6f1e'
            'c933bed6f07b1389253d320ddaa81ae30e538855c8480f463c55dca0cffd0ac1'
            '15eb6886837a076d1be2b2f133bb879c851a33b99b6cdf67c578c0eb1f73c62e'
            '63312b29f37439fabf4300dd27d040ebd2378f34c661311c0ee14ac9d6e0160c'
            '8a60b8b980f19c3140f794f4c619d9cbdc1726d253805db666d23ba5ab95914d'
            'bd9760318db068734efdca5e96076ed3162aa041ec21e0d4c94b230c2b2ec73b'
            '0eae437719d7875ef9c7881c49f6807a258322b9196fcd76ecda1a2a54a48249'
            'e003b67b852408e0e202ad3a33016905c3a42cc5357e6cc1c047e14c82d0d6c4'
            '432ce460adcaa34a90d04579f16e692d68f99e91e6ae1e6b6dc142ee3ee0662b'
            'eda90d20d35d84f8529d94023f8b492f0ce4a519145c1eb9b3575db10e6a78dc'
            '530a2a4c3622a2bf01bb8ffdd333c2951c46dc7cb4d900db0d189f45f062549e')

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

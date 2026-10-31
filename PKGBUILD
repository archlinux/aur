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
pkgver=20261031.1
pkgrel=1
_tag=a17-20261031-1
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
            '2f4176a871b35fe25499941d198a1e8d0880bb8f93dddfb020ae536d27fb021e'
            'e7817beac7e26f7d54b2d9f49c847dab8e137c92e403825829e7abbd0b63c411'
            '124106f95e1b35c75eed8a966ab66284760fd6d02c79ad9fadd88355d4e3a2d7'
            '5fa325de02c2ef9c13f972efba98e27cdf4d2d48c0a33cf9a884ade8eaa74c50'
            '3fe5822ca2b9ed3aa6fcd9c9627679a04592837b947d7754911c3ab4c1007ec2'
            '236969881658ebab23589159fc45f3afb2366d33a5ff47901cfa9921026aba0d'
            '97b9104a4be3b3b20b057a52b98f24b27a6708ddde21077cfe4d76687fb66e19'
            '7c7ff246157e5178e1ff06f0bde7ed0e55a4230a437a98382f42070ffdf43b1e'
            'c826838d3697b7451ca7e890e0e99678c9354995005bce0e1f39973f140fe643'
            '5ee7d42cdfde1216c39c11bdb3989a170cef40550a0fa28b99bdea01a5e25594'
            '9f03639af267b859e450299277cb9789c1980de5943c3a3b3523dda393a242c8'
            'c694c34e80b02dfbe9dc0b568a13ab7329aebfa31e21e7e31728e0f190aee28d'
            '82a5daacc819584c9411310778d40ae18b79168f6ec357fa94aec1d9257fb5ac'
            '60be3894fd2225f09c0ff43b4b6db5b91c2b5f57d16d64aaddc59d65e9023d42'
            '4465e3c1ef13e51fecb902ff0342ba20f371c8e2189d6a3f8b22aa6058bae42a'
            'a7c47b58944354eceffbd9f19734c4227e64cee40fd644d90118fecf264351b4'
            'b1b75eab3c2089ed98cc13d952da54ef8851dbb2e5a16765227d9253fabb0aca'
            'b35d9829837c06e52ed78bed61a3250653bf1f6ae15b2fb864f2d04771ae7d16'
            '98af5e2a7493027f0ade05e784329e0fad17e3b0c5be688985ef29a892db887b'
            '66ae8705bd93f0d84c65a4f408408ca12083d5fbcf7f966b989742bbfc2eb4c6'
            'd3ec7d9891287d67971b8a5f69bd337db9b7580f523edc1b80b4bc38a05208c7'
            '4f489716c75ce472b8e4f17f821feae32e669707026d1913b47e7d2d1a2843c7'
            '8cd671e5c56d48154cee80b739d9752031f37e21589703fdf97e831c5ee65756'
            '176746efcb50caa17006106e8068c1aa7290d7f756c30e4b93d0e715615b7fd3'
            '5b18a3a79362cbba0f51e2851d128d58e6e194bafbd25536b90f7f62b4c65d93'
            '4e389eb8c54b8c348724ff3c8c8a346dd8cfaf5089de6ac540a33231d1600717'
            '7646e65114d7cb9486b6924b0d35595c2f35ac1d3ef41f1ff240cf7be8a7c20a'
            '516ab03d9c20f71367008baab86464b35e7a8bee90f05d370dea4d29ba46df6b'
            'c776c05267520c45eb2011e4f206d707da1b57f530cba73b8db6f07a19fbb12f'
            'ae2f55fd9a11d416ea0060cfdbc594143e550ce76a9f4abc86be1a332e39a916'
            '7bf9fe7298a48b6bd3a35a875f0f850d09d2bb474f60bf182c36726e44fb6b16'
            'ae2a7aeabe933d4b1e19b8612e22c5b383b96001fe72891315a918a87e68d144'
            'c69d1cfbc6b521ff7a12ecbf607e0e1b22cf9b20bd4e8aa8cb75ec700f069b4a'
            '4a30807f4e073d66f88d182c3383a4e101d49b319e569674e694a061a5c2fc4c'
            '2f4c5f20d19eb2f98bf19b0ac5de5d2917af9c36e82d317d0539f06dc732c413'
            'ed6e74f7bd7023f947258772dbf027e723ca908c5db18c3ecca824411fee9624'
            '7b033583e74ea9876fa537da8db8358ba9fdb22fa6d54f3da3cf6bcd6a351a09'
            '7bc5edfe46340693f325c6c5259dd5873af1d056fc13e539b457f2e55c67cb6d'
            '052a305311b9f2e15c6a7c45d536282a694dcf63f87e5d6332eadf0e160f5496'
            'c35772124ebd2743a5cb72384b1afef9b11ccf1c669573f9826f81349ea1cc66'
            'c40757e7690d34504bdbbe5cbaba4ced5dc8b0c7f2e6b7ea222b64c3fe1f8044'
            'ae4abf642722002cd83f8c843e536f1b273be1ed2131ca9c85e059882c230d78'
            '5706dc83e4aa8a0bb5eba19bd4ee17e495756c4eb73a53fbdbdb78a4fe3c31c0'
            '5d1b76e8055b6512a68f9ce0db368c70d31530080342305331e4b76922f8b370'
            '1a7e58ed2b406ab38e535f2058a5f4885fbef76a83f2a5b4a670421b9a13159d'
            'bb0827f1a23b9a3e7be7c579e34aac0e259412e583942dfb241e65575b5d0b50'
            '9cb89bf97c681048e4b6e1e5fe2b1415c82bb2f78d83a056f022fc52c66785d1'
            'a678e3c16991c4704fdc873a0a42752554d8f9d8439668f300a9ef7b5184e4d0'
            'fa503beae478dee789e7da4649d21c41e1238d4bd14e93eb4a58e9a11fae4166'
            'd2f78523fa5650d7f1760b9846828f8333d709e49b3f1047bbf7cce566ce66f1'
            'ce4a9b6cdd13698f4d323456fdf6c8274d0a6390e6c3cc57445eacd79f34720e')

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

# Maintainer: Ragu Manjegowda <raghavendrahm0410@gmail.com>
pkgbase=libcamera-ipu7-ov08x40
pkgname=(
  intel-vision-drivers-dkms-ipu7-ov08x40
  libcamera-ipu7-ov08x40
  libcamera-ipu7-ov08x40-ipa
  ipu-bridge-legacy-cvs-dkms
  v4l2-relayd-ipu7-ov08x40
)
pkgver=0.7.2
pkgrel=3.13
pkgdesc="Patched libcamera for Intel IPU7 with OV08X40"
arch=(x86_64)
url="https://libcamera.org/"
license=(LGPL-2.1-or-later GPL-2.0-or-later)
makedepends=(
  git
  autoconf
  automake
  glib2
  gst-plugins-base
  libglvnd
  libyaml
  libyuv
  meson
  libtool
  pkgconf
  python-jinja
  python-ply
  python-pyyaml
  systemd
)
options=(!debug)
_libcamera_commit=191e202178f02430b5942397c70d215cdd2056fa
_vision_commit=845d6f8bdf66ff1f455901da9de5e00a53a83dce
_relay_commit=d6ec36aae87e765eddef8308f0f58c7b5be95ad7
_ipu_bridge_kernel=7.2.6
source=(
  "libcamera::git+https://gitlab.freedesktop.org/camera/libcamera.git#commit=$_libcamera_commit"
  "vision-drivers::git+https://github.com/intel/vision-drivers.git#commit=$_vision_commit"
  "v4l2-relayd::git+https://gitlab.com/vicamo/v4l2-relayd.git#commit=$_relay_commit"
  libcamera-ipu7-ov08x40.patch
  libcamera-configuration.yaml
  libcamera-ipu7-ov08x40.modules-load.conf
  wireplumber-disable-ipu7-v4l2.conf
  wireplumber-libcamera-gpu.conf
  v4l2-relayd-cleanup.patch
  v4l2-relayd-ipu7.service
  v4l2loopback-ipu7.conf
  v4l2loopback-ipu7.modules-load.conf
  "ipu-bridge-$_ipu_bridge_kernel.c::https://raw.githubusercontent.com/gregkh/linux/v$_ipu_bridge_kernel/drivers/media/pci/intel/ipu-bridge.c"
  ipu7-legacy-cvs.patch
  ipu-bridge-Makefile
  ipu-bridge-dkms.conf
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '9f92187ce488ce31c71fc42e3478779d7b8d23ce2f0306b709549c3ed1eab678'
            '37990699ba1a9146cdd3dd2e2482374e02b8637ef977f7897c0002bc87d2875c'
            '587979fcba7c49194a159ae07763b0f5758abf29312059f1e50b0347d2dd1755'
            '25fd6bf5fa4938a7e00c2b7c4915b8b3cd45dd2d41a38c81307eee6188bfa5dd'
            '78f6ddc7e19be130c6d88ad8b515c196da399128b907c9988b73530328808109'
            '4de66a63b6ca16802214221c373dc74de4be3e6b94e2af04f36c64966becb15f'
            '4454a58ae7af1d68312e3f2a5db47b0bc226d0e5855b6f8bf438a102079e37ab'
            'ff91383aaeb3e97e2461b6cc460b5f66a686bfa47d76ae0c1ca208b31cc9cd2d'
            'bb87430ef8c13d597c0ffb202d001b59bb865a2637fbf2c612e977a379b06270'
            '212f95ba5d3bf97d17d427b4528adf14568c146b00d926be7d8a989e5752b9fb'
            'a926313180a96bc7d9f16920dbc269aed78bdd63796d8602996d88f79e3b7939'
            'd0372ef887d9029177bc4ba9a2dcd4a26e4dc454d85313185c211023ccffb507'
            '3c520c0c2da92a8bbaaa3328839ebc54f08ff71fd9b0284307ddcdbcd57e8a64')

_pick() {
  local destination="$1" file target
  shift
  for file; do
    target="$srcdir/$destination/${file#$pkgdir/}"
    mkdir -p "$(dirname "$target")"
    mv "$file" "$target"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$file")"
  done
}

package_intel-vision-drivers-dkms-ipu7-ov08x40() {
  pkgdesc="Internal vision-driver DKMS dependency for libcamera-ipu7-ov08x40"
  depends=(dkms)
  provides=(intel-vision-drivers-dkms="r59.845d6f8")
  conflicts=(intel-vision-drivers-dkms intel-vision-drivers-dkms-git)

  local source_dir="$pkgdir/usr/src/vision-drivers-845d6f8"
  install -d "$source_dir"
  cp -a vision-drivers/. "$source_dir/"
  rm -rf "$source_dir/.git"
  sed -i \
    -e 's/^PACKAGE_VERSION=.*/PACKAGE_VERSION="845d6f8"/' \
    -e '/^CLEAN=/d' \
    "$source_dir/dkms.conf"
}

package_ipu-bridge-legacy-cvs-dkms() {
  pkgdesc="Internal IPU bridge DKMS dependency for libcamera-ipu7-ov08x40"
  license=(GPL-2.0-only)
  depends=(
    dkms
    'linux>=7.2'
    'linux<7.3'
    'linux-headers>=7.2'
    'linux-headers<7.3'
  )

  local source_dir="$pkgdir/usr/src/ipu-bridge-legacy-cvs-$pkgver"
  install -Dm644 ipu-bridge-src/ipu-bridge.c "$source_dir/ipu-bridge.c"
  install -Dm644 ipu-bridge-src/Makefile "$source_dir/Makefile"
  sed "s/@PACKAGE_VERSION@/$pkgver/" ipu-bridge-dkms.conf |
    install -Dm644 /dev/stdin "$source_dir/dkms.conf"
  printf '%s\n' ipu-bridge-legacy-cvs |
    install -Dm644 /dev/stdin \
      "$pkgdir/usr/share/dkms/modules_to_force_install/ipu-bridge-legacy-cvs"
}

prepare() {
  rm -rf ipu-bridge-src
  install -d ipu-bridge-src/drivers/media/pci/intel
  cp "ipu-bridge-$_ipu_bridge_kernel.c" \
    ipu-bridge-src/drivers/media/pci/intel/ipu-bridge.c
  patch -d ipu-bridge-src -Np1 < ipu7-legacy-cvs.patch
  cp ipu-bridge-src/drivers/media/pci/intel/ipu-bridge.c \
    ipu-bridge-src/ipu-bridge.c
  cp ipu-bridge-Makefile ipu-bridge-src/Makefile

  cd libcamera
  patch -Np1 < ../libcamera-ipu7-ov08x40.patch
  printf '%s\n' "$pkgver" > .tarball-version

  cd ../v4l2-relayd
  patch -Np1 < ../v4l2-relayd-cleanup.patch
}

build() {
  meson setup build-ipu7 libcamera \
    --prefix=/usr \
    --libdir=lib \
    --buildtype=plain \
    -D b_lto=true \
    -D b_pie=true \
    -D pipelines=simple \
    -D ipas=simple \
    -D gstreamer=enabled \
    -D cam=enabled \
    -D cam-output-kms=disabled \
    -D cam-output-sdl2=disabled \
    -D cam-jpeg=disabled \
    -D apps-output-dng=disabled \
    -D documentation=disabled \
    -D lc-compliance=disabled \
    -D libdw=disabled \
    -D libunwind=disabled \
    -D pycamera=disabled \
    -D qcam=disabled \
    -D softisp-gpu=enabled \
    -D test=false \
    -D tracing=disabled \
    -D v4l2=enabled
  meson compile -C build-ipu7

  cd v4l2-relayd
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package_libcamera-ipu7-ov08x40() {
  pkgdesc="Native libcamera and PipeWire camera stack for Intel IPU7 OV08X40"
  depends=(
    glibc
    gnutls
    intel-vision-drivers-dkms-ipu7-ov08x40
    ipu-bridge-legacy-cvs-dkms
    libcamera-ipu7-ov08x40-ipa
    libelf
    libgcc
    libglvnd
    libstdc++
    libyaml
    libyuv
    mesa
    sh
    systemd-libs
  )
  optdepends=(
    'gst-plugin-libcamera: GStreamer plugin'
    'libcamera-tools: applications'
    'pipewire-libcamera: PipeWire camera integration'
    'wireplumber=0.5.15: tested PipeWire camera export; requires matching libwireplumber'
  )
  provides=(
    libcamera="$pkgver"
    'libcamera.so=0.7-64'
    'libcamera-base.so=0.7-64'
  )
  conflicts=(libcamera)
  backup=(etc/libcamera/configuration.yaml)

  meson install -C build-ipu7 --destdir "$pkgdir"
  (
    cd "$pkgdir"
    _pick libcamera-ipu7-ov08x40-ipa usr/lib/libcamera/
    _pick discard usr/bin/{cam,libcamera-bug-report} usr/lib/gstreamer-*
  )

  install -Dm644 libcamera-configuration.yaml \
    "$pkgdir/etc/libcamera/configuration.yaml"
  install -Dm644 libcamera-ipu7-ov08x40.modules-load.conf \
    "$pkgdir/usr/lib/modules-load.d/libcamera-ipu7-ov08x40.conf"
  install -Dm644 wireplumber-disable-ipu7-v4l2.conf \
    "$pkgdir/usr/share/wireplumber/wireplumber.conf.d/90-disable-ipu7-v4l2.conf"
  install -Dm644 wireplumber-libcamera-gpu.conf \
    "$pkgdir/usr/lib/systemd/user/wireplumber.service.d/50-libcamera-intel-gpu.conf"
}

package_libcamera-ipu7-ov08x40-ipa() {
  pkgdesc="Internal signed IPA dependency for libcamera-ipu7-ov08x40"
  depends=(
    glibc
    libcamera-ipu7-ov08x40
    'libcamera.so=0.7-64'
    'libcamera-base.so=0.7-64'
    libgcc
    libstdc++
  )
  provides=(libcamera-ipa="$pkgver")
  conflicts=(libcamera-ipa)
  options=(!strip)

  mv libcamera-ipu7-ov08x40-ipa/* "$pkgdir"
}

package_v4l2-relayd-ipu7-ov08x40() {
  pkgdesc="Full V4L2 browser compatibility stack for Intel IPU7 OV08X40"
  url="https://gitlab.com/vicamo/v4l2-relayd"
  license=(GPL-2.0-only)
  depends=(
    glib2
    gstreamer
    gst-plugins-base-libs
    gst-plugins-good
    libcamera-ipu7-ov08x40
    v4l-utils
    v4l2loopback-dkms
  )
  provides=(v4l2-relayd=0.2.0)
  conflicts=(v4l2-relayd)

  make -C v4l2-relayd DESTDIR="$pkgdir" install
  rm -rf \
    "$pkgdir/etc" \
    "$pkgdir/usr/lib/modules-load.d/v4l2-relayd.conf" \
    "$pkgdir/usr/lib/systemd/system/v4l2-relayd.service" \
    "$pkgdir/usr/lib/systemd/system/v4l2-relayd@.service" \
    "$pkgdir/usr/lib/systemd/system-generators"

  install -Dm644 v4l2-relayd-ipu7.service \
    "$pkgdir/usr/lib/systemd/system/v4l2-relayd-ipu7.service"
  install -Dm644 v4l2loopback-ipu7.conf \
    "$pkgdir/usr/lib/modprobe.d/90-v4l2loopback-ipu7.conf"
  install -Dm644 v4l2loopback-ipu7.modules-load.conf \
    "$pkgdir/usr/lib/modules-load.d/v4l2loopback-ipu7.conf"
}

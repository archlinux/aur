# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>
# Contributor: Sapphire <imsapphire0 at gmail dot com>
pkgname=wivrn-server-git
pkgver=r1856.0e5b339
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")
depends=(
  "avahi"
  "cairo"
  "ffmpeg"
  "gcc-libs"
  "glib2"
  "glibc"
  "libarchive"
  "libbsd"
  "libdrm"
  "libgl"
  "libnotify"
  "libpipewire"
  "libpng"
  "librsvg"
  "libx11"
  "libxcb"
  "openssl"
  "systemd-libs"
  "vulkan-icd-loader"
  "wayland"
  "x264"
)

makedepends=(
  "boost"
  "cli11"
  "cmake"
  "eigen"
  "git"
  "glib2-devel"
  "libdrm"
  "libxrandr"
  "nlohmann-json"
  "vulkan-headers"
)

optdepends=(
  "opencomposite: OpenVR to OpenXR translation layer"
  "xrizer: Another OpenVR to OpenXR translation layer"
)
provides=(
  "openxr-runtime"
  "wivrn-server"
)
conflicts=("wivrn-server")
source=("git+$url")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "$srcdir/WiVRn"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/WiVRn"
  cmake -B build-server . \
    -DGIT_DESC=v${pkgver} \
    -DWIVRN_BUILD_SERVER=ON \
    -DWIVRN_BUILD_WIVRNCTL=ON \
    -DWIVRN_BUILD_CLIENT=OFF \
    -DWIVRN_BUILD_DASHBOARD=OFF \
    -DWIVRN_OPENXR_MANIFEST_TYPE=filename \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWIVRN_USE_VAAPI=ON \
    -DWIVRN_USE_X264=ON \
    -DWIVRN_USE_NVENC=ON \
    -DWIVRN_USE_VULKAN_ENCODE=ON \
    -DOVR_COMPAT_SEARCH_PATH=/opt/xrizer:/opt/opencomposite \
    -DWIVRN_FEATURE_STEAMVR_LIGHTHOUSE=ON \
    -Wno-dev

  cmake --build build-server
}

package() {
  cd "$srcdir/WiVRn"
  DESTDIR="$pkgdir" cmake --install build-server

  mkdir -p $pkgdir/usr/lib/environment.d
  echo PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1 >$pkgdir/usr/lib/environment.d/wivrn.conf
  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/wivrn.conf" <<EOF
/usr/lib/wivrn
EOF
}

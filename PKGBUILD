# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>
# Contributor: Sapphire <imsapphire0 at gmail dot com>
pkgname=wivrn-server-only
pkgver=26.9
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets. For those who only wants to compile the server"
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")
depends=(
  "avahi"
  "boost-libs"
  "cairo"
  "ffmpeg"
  "libgcc"
  "glib2"
  "glibc"
  "libarchive"
  "libbsd"
  "libgl"
  "libnotify"
  "libpipewire"
  "libpng"
  "librsvg"
  "libstdc++"
  "libx11"
  "libxcb"
  "openssl"
  "systemd-libs"
  "vulkan-icd-loader"
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
  "ninja"
)

optdepends=(
  "opencomposite: OpenVR to OpenXR translation layer"
  "xrizer: Another OpenVR to OpenXR translation layer"
  "vapor-openvr: Yet another OpenVR to OpenXR translation layer"
)
install=$pkgname.install
provides=(
  "openxr-runtime"
  "wivrn-server"
)
conflicts=("wivrn-server")
source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89f63bc6c89943f3571055381ee2f1aa744d3d11372c56188b21e39c8d8ef733')

build() {
  cd "WiVRn-$pkgver"
  cmake -B build-server . \
    -G Ninja \
    -DGIT_TAG=v${pkgver} \
    -DWIVRN_BUILD_SERVER=ON \
    -DWIVRN_BUILD_WIVRNCTL=ON \
    -DWIVRN_BUILD_CLIENT=OFF \
    -DWIVRN_BUILD_DASHBOARD=OFF \
    -DWIVRN_OPENXR_MANIFEST_TYPE=relative \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWIVRN_USE_VAAPI=ON \
    -DWIVRN_USE_X264=ON \
    -DWIVRN_USE_NVENC=ON \
    -DWIVRN_USE_VULKAN_ENCODE=ON \
    -DOVR_COMPAT_SEARCH_PATH=/opt/xrizer:/opt/opencomposite:/opt/VapoR \
    -DWIVRN_FEATURE_STEAMVR_LIGHTHOUSE=ON \
    -Wno-dev

  cmake --build build-server
}

package() {
  cd "WiVRn-$pkgver"
  DESTDIR="$pkgdir" cmake --install build-server

  mkdir -p $pkgdir/usr/lib/environment.d
  echo PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1 >$pkgdir/usr/lib/environment.d/wivrn.conf
}

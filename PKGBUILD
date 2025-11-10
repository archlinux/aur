# Maintainer: Uncore <contactuncor3@gmail.com>
pkgname=idescriptor-git
_pkgname=iDescriptor
pkgver=r263.6d86243
pkgrel=1
pkgdesc="A free and open-source iDevice management tool."
arch=('x86_64')
url="https://github.com/uncor3/iDescriptor"
license=('AGPL3-or-later')
provides=("$_pkgname")
depends=(
    'libimobiledevice>=1.4.0'
    'libtatsu>=1.0.5'
    'libimobiledevice-glue'
    'libplist'
    'usbmuxd'
    'openssl'
    'libssh'
    'libusb'
    'pugixml'
    'qrencode'
    'libheif'
    'libzip'
    'qt6-base'
    'qt6-multimedia'
    'qt6-declarative'
    'qt6-serialport'
    'qt6-positioning'
    'qtermwidget'
    'avahi'
    'libsecret'
    'gnome-keyring'
    'ffmpeg'
    # GStreamer dependencies for AirPlay functionality
    'gstreamer'
    'gst-plugins-base-libs'
    'gst-plugins-good'
    'gst-plugins-bad'
)
# Optional dependencies for wider codec support
optdepends=(
    'gst-plugins-ugly: for extra codecs'
    'gst-libav: for FFmpeg-based codecs'
)
makedepends=(
    'git'
    'cmake'
    'go' # Required for the ipatool-go submodule
)
options=('!debug')
source=("git+https://github.com/uncor3/iDescriptor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$_pkgname"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_RECOVERY_DEVICE_SUPPORT=OFF
  cmake --build build
}

package() {
  cd "$_pkgname/build"
  DESTDIR="$pkgdir" cmake --install .
}
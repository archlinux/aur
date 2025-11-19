# Maintainer: Uncore <contactuncor3@gmail.com>
pkgname=idescriptor-git
_pkgname=iDescriptor
pkgver=r263.6d86243
pkgrel=1
pkgdesc="A free and open-source iDevice management tool."
arch=('x86_64')
url="https://github.com/iDescriptor/iDescriptor"
license=('AGPL3-or-later')
provides=("$pkgname")
depends=(
    'libimobiledevice>=1.4.0'
    'libtatsu>=1.0.5'
    'libimobiledevice-glue'
    'libplist'
    'usbmuxd'
    'libusbmuxd'
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
    'qt6-location'
    'qtermwidget'
    'avahi'
    'libsecret'
    'gnome-keyring'
    'ffmpeg'
    'ifuse'
    'gstreamer'
    'gst-plugins-base-libs'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-plugins-ugly'
    'gst-libav'
)
makedepends=(
    'git'
    'cmake'
    'go'
)
options=('!debug')
source=("git+https://github.com/iDescriptor/iDescriptor.git")
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
    -DENABLE_RECOVERY_DEVICE_SUPPORT=OFF \
    -DPACKAGE_MANAGER_MANAGED=ON \
    -DPACKAGE_MANAGER_HINT=yay/paru
  cmake --build build
}

package() {
  cd "$_pkgname/build"
  DESTDIR="$pkgdir" cmake --install .
}
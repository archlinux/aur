# Maintainer: Massimo Pavoni <real.damax@gmail.com>

_pkgname=wb32-dfu-updater_cli
pkgname="$_pkgname-git"
pkgver=1.0.0.r18.g656f6a5
pkgrel=1
pkgdesc="USB programmer for downloading and uploading firmware to/from USB devices."
arch=(x86_64 aarch64)
url="https://github.com/WestberryTech/wb32-dfu-updater"
license=('Apache-2.0')
makedepends=(
  'cmake'
  'libusb'
)
provides=("$_pkgname")
_pkgsrc="wb32-dfu-updater"
source=("git+https://github.com/WestberryTech/wb32-dfu-updater.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -Wno-dev
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Timo S. Prinz <t.prinz@coliza.de>
# Contributor: Dan Nixon <dan@dan-nixon.com>
pkgname=qdmr-git
pkgver=r1419.a6c72eb1
pkgrel=1
pkgdesc="A GUI application for configuring and programming cheap DMR radios"
arch=('x86_64' 'i686')
url="https://github.com/hmatuschek/qdmr"
license=('GPL-3.0-or-later')
depends=('libusb' 'qt5-tools' 'qt5-serialport' 'qt5-location' 'yaml-cpp')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('qdmr::git+https://github.com/hmatuschek/qdmr.git'
        'udev-rules.patch')
sha256sums=('SKIP'
            'f9bc5366df6186e475d010e79d002bf1d495220f269535c526b1faaf14fa1997')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch --forward --strip=2 --input="${srcdir}/udev-rules.patch"
}

build() {
  local cmake_options=(
    -B build
    -S ${pkgname%-git}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
	-D INSTALL_UDEV_RULES=ON
	-D INSTALL_UDEV_PATH=/etc/udev/rules.d
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

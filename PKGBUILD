# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>
# Contributor: Timo S. Prinz <t.prinz@coliza.de>
# Contributor: Dan Nixon <dan@dan-nixon.com>

pkgname=qdmr
pkgver=0.13.2
pkgrel=1
pkgdesc="A GUI application for configuring and programming cheap DMR radios"
arch=('x86_64')
url="https://github.com/hmatuschek/qdmr"
license=('GPL-3.0-or-later')
depends=('libusb' 'qt6-tools' 'qt6-serialport' 'qt6-location' 'yaml-cpp')
makedepends=('cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("qdmr-$pkgver.tar.gz::https://github.com/hmatuschek/qdmr/archive/refs/tags/v$pkgver.tar.gz"
        'udev-rules.patch')
sha256sums=('245809ac742e30085d94bc77386c65d78ff36961928e83eca68c0f1850b5a30a'
            '1d15685397688aaaec4f356567581ee2ff0c5b71f748ab8a30896ef62658f7aa')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch --forward --strip=2 --input="${srcdir}/udev-rules.patch"
}

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D INSTALL_UDEV_RULES=ON
    -D INSTALL_UDEV_PATH=/etc/udev/rules.d
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

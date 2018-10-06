# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=osmo-fl2k-git
_pkgname=${pkgname%-git}
pkgver=0.1.1.r11.0fb8849
pkgrel=1
pkgdesc='Library to use cheap (FL2000 based) USB3.0 to VGA converters as SDR'
arch=('x86_64')
url='https://osmocom.org/projects/osmo-fl2k/wiki'
license=('GPL3')
depends=('libusb')
makedepends=('git' 'cmake')
provides=('osmo-fl2k')
conflicts=('osmo-fl2k')
source=("git+https://git.osmocom.org/$_pkgname")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

build() {
  mkdir -p $_pkgname/build
  cd $_pkgname/build

  cmake .. \
    -DINSTALL_UDEV_RULES=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $_pkgname/build

  make DESTDIR="$pkgdir" install

  mv "$pkgdir"/usr/lib64 "$pkgdir"/usr/lib
}


# Maintainer: Julien Savard <juju@juju2143.ca>
# Contributor: Nathaniel van Diepen <eeems@eeems.codes>

pkgname=ticemu
pkgver=1.3
url='https://ce-programming.github.io/CEmu/'
pkgrel=1
makedepends=('git')
depends=('qt5-base' 'libarchive')
pkgdesc='Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer features'
license=('GPL')
arch=('x86_64')
_subpkgver=('7eb89e56d219bbca5ca5cd82c98dce69bd75004b')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CE-Programming/CEmu/archive/v$pkgver.tar.gz"
	"https://github.com/CE-Programming/zdis/archive/${_subpkgver[0]}.tar.gz"
	"include-stdexcept.patch")
md5sums=('cf8bfb755ea28c91a2a5b4abba14bc09'
         'f4e1cb5120afda89b90d8867d7c89b10'
         'ff15d1a9d6feeeb6252332976ddbbc1b')
prepare(){
  cd "$srcdir/CEmu-$pkgver"

  rm -r core/debug/zdis
  cp -r "${srcdir}"/zdis-${_subpkgver[0]} core/debug/zdis

  patch --forward --strip=1 --input="${srcdir}/include-stdexcept.patch"
}
build() {
  cd "$srcdir/CEmu-$pkgver/gui/qt"

  qmake -r CEmu.pro "PREFIX=$pkgdir/usr" "CEMU_VERSION=v$pkgver"
  make
}
package() {
  install -Dm644 "$srcdir/CEmu-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/CEmu-$pkgver/gui/qt/resources/linux/cemu.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/CEmu-$pkgver/gui/qt/resources/icons/linux/cemu-512x512.png" "$pkgdir/usr/share/pixmaps/cemu.png"

  cd "$srcdir/CEmu-$pkgver/gui/qt"
  make install
}

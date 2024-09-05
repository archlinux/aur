# Maintainer: Julien Savard <juju@juju2143.ca>
# Maintainer: John Cesarz <commandz@commandblockguy.xyz>
# Contributor: Nathaniel van Diepen <eeems@eeems.codes>

pkgname=ticemu
pkgver=2.0
url='https://ce-programming.github.io/CEmu/'
pkgrel=1
makedepends=('git')
depends=('qt5-base' 'libarchive')
pkgdesc='Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer features'
license=('GPL')
arch=('x86_64')
_subpkgver=('7eb89e56d219bbca5ca5cd82c98dce69bd75004b'
            'f627164d42e1b8757e70b12c8d8c7913a4496cf0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CE-Programming/CEmu/archive/v$pkgver.tar.gz"
	"https://github.com/CE-Programming/zdis/archive/${_subpkgver[0]}.tar.gz"
	"https://github.com/adriweb/tivars_lib_cpp/archive/${_subpkgver[1]}.tar.gz")
md5sums=('556651cc60756c85684b7eaa224ac2d8'
         'f4e1cb5120afda89b90d8867d7c89b10'
         '872b754ebfb07878d22de6abc651d9b4')
prepare(){
  cd "$srcdir/CEmu-$pkgver"

  rm -r core/debug/zdis
  cp -r "${srcdir}"/zdis-${_subpkgver[0]} core/debug/zdis

  rm -r gui/qt/tivars_lib_cpp
  cp -r "${srcdir}"/tivars_lib_cpp-${_subpkgver[1]} gui/qt/tivars_lib_cpp
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

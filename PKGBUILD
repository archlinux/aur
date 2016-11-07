# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=charls
pkgname="$_pkgname"1
pkgver=1.1.0
pkgrel=1
pkgdesc='A C++ JPEG-LS library implementation. Legacy release 1.x.'
arch=('i686' 'x86_64')
url='https://github.com/team-charls/charls'
license=('BSD')
makedepends=('cmake' 'dos2unix')
# Apparently the latest stable release of DCMTK, which is close to six years old but represents the
# only and still somewhat relevant reverse dependency of this package, cannot be bothered to use
# system CharLS at any other than the default location. Thus this package has to conflict with all
# other CharLS releases available right now.
provides=("$_pkgname")
conflicts=("$_pkgname"{,-git})
source=("$_pkgname-$pkgver.tar.gz::https://github.com/team-charls/$_pkgname/archive/$pkgver.tar.gz"
        extend-headers.patch)
sha256sums=('02291d5787d8c54b20374ffec4f5157b9bb7ec307f3c1705017ea3fc0f674841'
            '5d7aa69e8d5798a6c92841cbc5db9ebaf49224d0137635652b47a5cd22f8e75e')

prepare() {
  # export additional header, again to please latest stable DCMTK release
  patch -p1 < $srcdir/extend-headers.patch

  # remove CRLF sequence
  for i in $(find $_pkgname-$pkgver -type f -exec file {} \; | grep CRLF | sed 's/:.*$//')
  do
    dos2unix $i
  done
}

build() {
  mkdir -p build
  cd build
  cmake $srcdir/$_pkgname-$pkgver -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  # referencing $startdir as workaround for license file missing in upstream release archive
  install -D -m644 $startdir/License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

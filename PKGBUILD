# Maintainer:
# Contributor: kevku <kevku@gmx.com>

pkgname=xsd
pkgver=4.0.0
_pkgver=4.0.0+dep
pkgrel=5
pkgdesc='An open-source, cross-platform W3C XML Schema to C++ data binding compiler'
arch=(x86_64)
url='https://www.codesynthesis.com/products/xsd'
license=(GPL2)
depends=(xerces-c)
source=(https://www.codesynthesis.com/download/${pkgname}/4.0/${pkgname}-${_pkgver}.tar.bz2
        xsdcxx.patch
        gcc-11.patch)
sha256sums=('eca52a9c8f52cdbe2ae4e364e4a909503493a0d51ea388fc6c9734565a859817'
            '93f2e6a9dc942cf1fcab7edbe9c38fc102cbaf86f8b667b70aad4e8e2d1e2fd3'
            'd57e0aed8784d2b947983209b6513c81ac593c9936c3d7b809b4cd60d4c28607')

prepare() {
  patch -d $pkgname-$_pkgver -p1 < xsdcxx.patch
  patch -d $pkgname-$_pkgver/libxsd-frontend -p1 < gcc-11.patch # Fix build with GCC 11
}

build() {
  cd $pkgname-$_pkgver
  make CXXFLAGS="${CXXFLAGS} -std=c++14"
}

package() {
  cd $pkgname-$_pkgver
  make install_prefix="$pkgdir/usr" install

  # Fix conflicts with mono
  mv "$pkgdir"/usr/bin/xsd{,cxx}
  mv "$pkgdir"/usr/share/man/man1/xsd{,cxx}.1
}

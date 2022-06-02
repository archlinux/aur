# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=aalib
pkgname=lib32-$_pkgname
pkgver=1.4rc5
pkgrel=3
pkgdesc="A portable ASCII art graphic library (32 bit)"
arch=('x86_64')
url="http://aa-project.sourceforge.net/aalib/"
license=('LGPL')
depends=('lib32-gpm' 'lib32-libx11' "$_pkgname")
makedepends=('lib32-libxt')
source=(https://downloads.sourceforge.net/sourceforge/aa-project/${_pkgname}-${pkgver}.tar.gz
        aclocal-fixes.patch)
sha512sums=('3e4506eccce3b81ccbbb79a4a1b90abd39e2259e6043fde90f70b9ca279bd4c37758a047167267b97c4ec92f64fb17c7c8f548114f0d0c6e78ddb9463b5f1299'
            'aa98b2226c2dd15c13561b28b5558ed459e9065c2339222df7c3002ea17a9b81711e6ff4f59d66ad817d96461dd8b5411c87b049306c875f295fdb8d0c9425c7')

prepare() {
  cd ${_pkgname}-1.4.0
  patch -p0 -i "${srcdir}/aclocal-fixes.patch"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgname}-1.4.0
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgname}-1.4.0
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

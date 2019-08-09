# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Joakim Hernberg <jhernberg at alchemy dot lu>
_pkgbasename=gettext
pkgname=lib32-$_pkgbasename
pkgver=0.20.1
pkgrel=1
pkgdesc="GNU internationalization library (32-bit)"
arch=('x86_64')
url="https://www.gnu.org/software/gettext/"
license=('GPL')
depends=('lib32-acl' lib32-gcc-libs $_pkgbasename)
makedepends=(gcc-multilib)
options=(!docs)
source=(https://ftp.gnu.org/pub/gnu/gettext/${_pkgbasename}-${pkgver}.tar.gz{,.sig})
md5sums=('bb5b0c0caa028105f3ca1905ddc306e2'
         'SKIP')
validpgpkeys=(462225C3B46F34879FC8496CD605848ED7E69871
              68D94D8AAEEAD48AE7DC5B904F494A942E4616C2)

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
 cd "${srcdir}/${_pkgbasename}-${pkgver}"
 make check || warning "Tests failed"
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Joakim Hernberg <jhernberg at alchemy dot lu>

_pkgbasename=gettext
pkgname=lib32-$_pkgbasename
pkgver=0.25
pkgrel=1
pkgdesc="GNU internationalization library (32-bit)"
arch=('x86_64')
url="https://www.gnu.org/software/gettext/"
license=('GPL')
depends=('lib32-acl' lib32-gcc-libs $_pkgbasename)
makedepends=(gcc-multilib)
options=(!docs)
source=(https://ftp.gnu.org/pub/gnu/gettext/${_pkgbasename}-${pkgver}.tar.gz{,.sig})
sha512sums=('a086191926f9d9d87ec45136e0796626140f0209d71b498756cda8212b71343b76643cd28aaeb74370b661d99d8ceea25ba3afd24d9dca4814a552436066d393'
            'SKIP')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871'  # Daiki Ueno
              '68D94D8AAEEAD48AE7DC5B904F494A942E4616C2'
              '9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D'  # Bruno Haible
              'E0FFBD975397F77A32AB76ECB6301D9E1BBEAC08') # Bruno Haible (Open Source Development)

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32
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

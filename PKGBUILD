# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Joakim Hernberg <jhernberg at alchemy dot lu>

_pkgbasename=gettext
pkgname=lib32-$_pkgbasename
pkgver=0.24
pkgrel=1
pkgdesc="GNU internationalization library (32-bit)"
arch=('x86_64')
url="https://www.gnu.org/software/gettext/"
license=('GPL')
depends=('lib32-acl' lib32-gcc-libs $_pkgbasename)
makedepends=(gcc-multilib)
options=(!docs)
source=(https://ftp.gnu.org/pub/gnu/gettext/${_pkgbasename}-${pkgver}.tar.gz{,.sig})
sha512sums=('9e9913fec1d3eeff65e023ee00c5da456baceabd49ce0c0d21f19b9911a60b67546f4ee5716f6f5b7a160b4c13c47604da8762854eba6f17f9bf3fd1c6056828'
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

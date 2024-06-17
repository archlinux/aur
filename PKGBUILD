# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Joakim Hernberg <jhernberg at alchemy dot lu>

_pkgbasename=gettext
pkgname=lib32-$_pkgbasename
pkgver=0.22.5
pkgrel=1
pkgdesc="GNU internationalization library (32-bit)"
arch=('x86_64')
url="https://www.gnu.org/software/gettext/"
license=('GPL')
depends=('lib32-acl' lib32-gcc-libs $_pkgbasename)
makedepends=(gcc-multilib)
options=(!docs)
source=(https://ftp.gnu.org/pub/gnu/gettext/${_pkgbasename}-${pkgver}.tar.gz{,.sig})
sha512sums=('d8b22d7fba10052a2045f477f0a5b684d932513bdb3b295c22fbd9dfc2a9d8fccd9aefd90692136c62897149aa2f7d1145ce6618aa1f0be787cb88eba5bc09be'
            'SKIP')
validpgpkeys=(462225C3B46F34879FC8496CD605848ED7E69871
              68D94D8AAEEAD48AE7DC5B904F494A942E4616C2
              9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D)  # Bruno Haible (Open Source Development)

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

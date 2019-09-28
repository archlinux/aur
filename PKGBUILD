# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-glpk
_pkgbasename=glpk
pkgver=4.65
pkgrel=2
pkgdesc="GNU Linear Programming Kit : solve LP, MIP and other problems."
arch=('x86_64')
url="https://www.gnu.org/software/glpk/glpk.html"
depends=('lib32-gmp')
makedepends=('gcc-multilib')
license=('GPL')
source=(https://ftp.gnu.org/gnu/glpk/${_pkgbasename}-${pkgver}.tar.gz glpk-remove-warnings.patch)
sha1sums=('d9b607a9cf3a25b754a0cd9a842ea5043f8604db'
          '6f4e904c5dc88a8b43391e030496644d77e39163')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  patch -p1 -i ../glpk-remove-warnings.patch # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=891465
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-gmp-include=/usr/lib32/gmp \
    --with-gmp-lib=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -f "${pkgdir}/usr/lib32/"*.py
}

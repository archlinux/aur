# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>
# Contributor: Gregor Entzian <entzian at tbi dot univie dot ac dot at>
# Contributor: Maho Nakata <maho at riken dot jp>

pkgbase=mlapack
pkgname=('mlapack')
pkgver=0.8.1
pkgrel=4
pkgdesc="Multiple precision linear algebra package (fork of MPLAPACK)"
arch=('x86_64' 'i686')
license=('Custom')
url=""
groups=('mlapack')
makedepends=( 'qd'
              'gmp'
              'mpfr'
              'libmpc'
              'libtool')

checkdepends=('check')

source=(https://github.com/RaumZeit/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)

sha256sums=('a0810b16b85f442f90933f04a5e4a4e8fb3ec234d755e1ed5ef72dcf04d4709a')

build() {
  cd "${srcdir}/mlapack-${pkgver}"
  ./configure \
      --prefix=/usr \
      --enable-gmp \
      --enable-mpfr \
      --enable-qd \
      --enable-dd \
      --enable-double \
      --enable-__float128 \
      --enable-longdouble \
      --enable-optimization \
      --with-system-gmp \
      --with-system-mpfr \
      --with-system-mpc \
      --with-system-qd \
      --disable-benchmark \
      --disable-examples \
      --disable-reference \
      CPPFLAGS=-fpermissive
  make
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make check
}

package() {
  depends=('qd'
           'gmp'
           'mpfr'
           'libmpc')
  provides=("mlapack=${pkgver}")


  # install library and header files
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # install pkg-config file
  install -Dm644 mlapack.pc "$pkgdir/usr/lib/pkgconfig/mlapack.pc"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}



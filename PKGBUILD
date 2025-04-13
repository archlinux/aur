# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
pkgname=apl
pkgver=1.9
pkgrel=1
pkgdesc="GNU APL interpreter and library for array programming (ISO 13751)"
arch=(x86_64)
url="https://www.gnu.org/software/apl/"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
optdepends=('gtk3: ⎕GTK'
            'fftw3: ⎕FFT'
            'gnuplot: ⎕PLOT'
            'libpng: ⎕PNG'
            'pcre: ⎕RE'
            'sqlite: ⎕SQL')

source=("https://ftp.gnu.org/gnu/apl/apl-${pkgver}.tar.gz")
sha256sums=('291867f1b1937693abb57be7d9a37618b0376e3e2709574854a7bbe52bb28eb8')

build() {
  cd "${srcdir}/apl-${pkgver}"
  # Build the binary (interpreter)
  mkdir -p build-bin
  cd build-bin
  ../configure --prefix=/usr --without-libapl
  make

  # Build the library-only version
  cd "${srcdir}/apl-${pkgver}"
  mkdir -p build-lib
  cd build-lib
  ../configure --prefix=/usr --with-libapl
  make
}

package() {
  cd "${srcdir}/apl-${pkgver}/build-bin"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/apl-${pkgver}/build-lib"
  make DESTDIR="${pkgdir}" install
}

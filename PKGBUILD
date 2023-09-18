# Maintainer: jabra98 <jabra98.gpg@gmail.com>
pkgname='rwth-psp-binutils'
groups=('rwth-psp-toolchain')
pkgver=2.26.1
pkgrel=1
pkgdesc="GCC Toolchain (binutils) for the RWTH psp module"
arch=('x86_64')
url="https://ftp.gnu.org/gnu"
license=('GPL3')
conflicts=()
makedepends=('gcc10')
provides=("${pkgname}")
source=("binutils-${pkgver}.tar.gz::$url/binutils/binutils-${pkgver}.tar.gz"
        "avr-size.patch")
sha256sums=(
    "dd9c3e37c266e4fefba68e444e2a00538b3c902dd31bf4912d90dca6d830a2a1"
    "14cd16d76dd519516bd694d4f9f47f8216e13600b39f82b1ad7e7ec942f31b08"
        )

_prefix="/opt/psp-toolchain"

prepare() {
  cd "${srcdir}/binutils-${pkgver}"
  # patch avr-size
  patch "binutils/size.c" < "${srcdir}/avr-size.patch"
}

build() {
  # use gcc-10
  export CC='gcc-10'
  export CXX='g++-10'

  # build binutils
  cd "${srcdir}/binutils-${pkgver}"
  mkdir -p build
  cd build
  ../configure --prefix=${_prefix} --target=avr --disable-nls
  make
}

package() {
  cd "${srcdir}/binutils-${pkgver}/build"
  make DESTDIR="$pkgdir/" install 
}

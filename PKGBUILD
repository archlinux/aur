# Maintainer: jabra98 <jabra98.gpg@gmail.com>
pkgname='rwth-psp-gcc'
groups=('rwth-psp-toolchain')
pkgver=5.4.0
pkgrel=1
pkgdesc="Toolchain (gcc) for the RWTH psp module"
arch=('x86_64')
url="https://ftp.gnu.org/gnu"
license=('GPL3')
conflicts=()
makedepends=('gcc10')
depends=('rwth-psp-binutils')
provides=("${pkgname}")
source=("gcc-${pkgver}.tar.gz::$url/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.gz")
sha256sums=(
    "37089e80c3f2e9a0663d7ccc51c2a6c7dbbf3275bc1e4ed1ed3b1460cd5b3030"
        )

_prefix="/opt/psp-toolchain"

prepare() {
  cd "${srcdir}/gcc-${pkgver}"
  # download prereqs
  ./contrib/download_prerequisites
}

build() {
  # use gcc-10
  export CC='gcc-10'
  export CXX='g++-10'

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  export PATH="${_prefix}/bin:$PATH"

  # build gcc
  cd "${srcdir}/gcc-${pkgver}"
  mkdir -p build
  cd build
  ../configure --prefix=${_prefix} --target=avr --enable-languages=c,c++ --disable-nls --disable-libssp --with-dwarf2
  make
}

package() {
  cd "${srcdir}/gcc-${pkgver}/build"
  make DESTDIR="$pkgdir/" install 
  rm -rf "$pkgdir/opt/psp-toolchain/share/info/dir"
}

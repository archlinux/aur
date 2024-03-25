# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
# note: need to export PATH="/usr/lib/llvm14/bin:$PATH" before using

pkgname=stoat-git
_pkgname=stoat
pkgver=v1.1.r29.g124b0e1
pkgrel=1
pkgdesc="STatic (LLVM) Object file Analysis Tool"
arch=('i686' 'x86_64')
url="https://github.com/fundamental/stoat"
license=('GPL3')
depends=('llvm14' 'ruby' 'binutils')
makedepends=('git' 'cmake' 'clang14')
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/fundamental/stoat.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # https://reviews.llvm.org/D78882
  find ./src -type f -exec sed -i -e 's/getCalledValue/getCalledOperand/g' {} \;
}

build() {
  cd "${srcdir}/${_pkgname}"

  rm -rf build
  mkdir -p build
  cd build
  export PATH="/usr/lib/llvm14/bin:$PATH"
  CC=clang CXX=clang CFLAGS="-I/usr/lib/llvm14/include" LDFLAGS="-L /usr/lib/llvm14/lib" cmake -DCMAKE_CXX_STANDARD=17 -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
  make PREFIX="/usr"
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make install
}


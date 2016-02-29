# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=mingw-w64-lkl-linux-git
_srcname=linux
pkgver=4.3.r329.g5eb6acb
pkgrel=1
pkgdesc="Linux kernel library for building portable linux drivers (mingw-w64)"
arch=('any')
url="https://github.com/lkl/linux/blob/master/Documentation/lkl.txt"
license=('GPL2')
depends=('mingw-w64-crt' 'mingw-w64-winpthreads')
makedepends=('bc' 'python' 'git' 'mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-binutils-weak')
options=('!buildflags' 'staticlibs')
source=('git+git://github.com/lkl/linux.git')
sha256sums=('SKIP')

export LC_ALL=C
_architectures="i686-w64-mingw32" 
# x86_64-w64-mingw32 : not yet supported Win64 LLP64, long bit size errors in Linux source

pkgver() {
  cd "${srcdir}/${_srcname}"

  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

prepare() {
  cd "${srcdir}/${_srcname}"
  cd tools
  # apply patches or something
}

build() {
  cd "${srcdir}/${_srcname}"
  cd tools/lkl
  
  for _arch in ${_architectures}; do
    CFLAGS="-Iinclude -I/usr/${_arch}/include -g -O2"
    rm -rf build-${_arch}
    mkdir -p build-${_arch}/include
    make CROSS_COMPILE=${_arch}- CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" OUTPUT_FORMAT="pe-i386"
    cp lib/*.a build-${_arch}/
    cp -r include build-${_arch}/include
    make clean
  done
}

package() {
  cd "${srcdir}/${_srcname}"
  cd tools/lkl
  for _arch in ${_architectures}; do
    mkdir -p "${pkgdir}"/usr/"${_arch}"/{include,lib}
    cp build-${_arch}/*.a "${pkgdir}"/usr/"${_arch}"/lib/
    cp -r build-${_arch}/include/* "${pkgdir}"/usr/"${_arch}"/include/
  done
}





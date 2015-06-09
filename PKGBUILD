# Maintainer:  Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-x265
pkgver=1.6
pkgrel=1
pkgdesc='Open Source H265/HEVC video encoder (mingw-w64)'
arch=('any')
url='https://bitbucket.org/multicoreware/x265'
license=('GPL')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'yasm' 'mingw-w64-cmake' 'mingw-w64-pkg-config')
#source=($url/get/$pkgver.tar.bz2
source=(x265-$pkgver.tar.bz2::$url/get/$pkgver.tar.bz2
        mingw.patch)
md5sums=('d6fcde2d021899bc93f987cd6819a233'
         'd1f6263ad2f345673a8b0ece73f68338')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd multicoreware-x265-*/
    patch -Np1 -i "${srcdir}/mingw.patch"
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    unset LDFLAGS CPPFLAGS
    ${_arch}-cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr/${_arch} -DLIB_INSTALL_DIR="lib" "${srcdir}"/multicoreware-x265-*/source
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}

    make DESTDIR="$pkgdir" install
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-flac
pkgver=1.4.2
_commit=b32e5cbf9818ca23dd22aaa75522042c16ea7d17  # tags/1.4.2
pkgrel=1
pkgdesc="Free Lossless Audio Codec (mingw-w64)"
url="http://flac.sourceforge.net/"
arch=('any')
license=('BSD' 'GPL')
depends=('mingw-w64-libogg' 'mingw-w64-crt')
makedepends=('git' 'mingw-w64-cmake' 'ninja')
options=('staticlibs' '!buildflags' '!strip')
source=("git+https://github.com/xiph/flac#commit=$_commit")
b2sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    BUILD_OPTS=("-DCMAKE_INSTALL_PREFIX=/usr/${_arch}"
      '-DCMAKE_BUILD_TYPE=None'
      '-DBUILD_DOCS=OFF'
      '-DBUILD_EXAMPLES=OFF'
      '-DBUILD_PROGRAMS=OFF'
      '-DBUILD_TESTING=OFF'
      '-DWITH_STACK_PROTECTOR=OFF'
      '-DINSTALL_MANPAGES=OFF'
      '-DNDEBUG=ON')

    ${_arch}-cmake -S flac -B build/${_arch}-static -G Ninja \
      -DBUILD_SHARED_LIBS=OFF \
      ${BUILD_OPTS[@]}

    ${_arch}-cmake -S flac -B build/${_arch} -G Ninja \
      -DBUILD_SHARED_LIBS=ON \
      ${BUILD_OPTS[@]}

    cmake --build build/${_arch}-static
    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}-static
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
    install -Dm644 flac/src/*/*.m4 -t "${pkgdir}/usr/${_arch}/share/aclocal"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

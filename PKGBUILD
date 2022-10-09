# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-flac
pkgver=1.4.1
_commit=b6fbd6b3d97e2da4481bdbd25176f263fd6a5e75  # tags/1.4.1
pkgrel=2
pkgdesc="Free Lossless Audio Codec (mingw-w64)"
url="http://flac.sourceforge.net/"
arch=('any')
license=('BSD' 'GPL')
depends=('mingw-w64-libogg' 'mingw-w64-crt')
makedepends=('git' 'mingw-w64-cmake' 'ninja' 'nasm')
options=('staticlibs' '!buildflags' '!strip')
source=("git+https://github.com/xiph/flac#commit=$_commit")
b2sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd flac

  # Fix GStreamer
  # https://bugs.archlinux.org/task/76120
  git cherry-pick -n 3d55a9dc6c14317b4766db96bb52e2fd95e920a9
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S flac -B build/${_arch}-static -G Ninja \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_DOCS=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_PROGRAMS=OFF \
      -DBUILD_TESTING=OFF \
      -DWITH_STACK_PROTECTOR=OFF \
      -DINSTALL_MANPAGES=OFF \
      -DNDEBUG=ON

    ${_arch}-cmake -S flac -B build/${_arch} -G Ninja \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_DOCS=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_PROGRAMS=OFF \
      -DBUILD_TESTING=OFF \
      -DWITH_STACK_PROTECTOR=OFF \
      -DINSTALL_MANPAGES=OFF \
      -DNDEBUG=ON

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

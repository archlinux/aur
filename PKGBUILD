pkgname=mingw-w64-waffle
pkgver=1.6.2
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime (mingw-w64)'
arch=('any')
url='http://www.waffle-gl.org'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gitlab.freedesktop.org/mesa/waffle/-/archive/v$pkgver/waffle-v$pkgver.tar.gz")
sha256sums=('1a120d258390fb776a1c47cc9617f057dc72baf07bad610772e5da2fea82437c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/waffle-v$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake .. \
      -Dwaffle_build_tests=0 \
      -Dwaffle_build_manpages=0 \
      -Dwaffle_build_htmldocs=0 \
      -Dwaffle_build_examples=0
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/waffle-v$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

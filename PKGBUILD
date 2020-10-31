pkgname=mingw-w64-piglit-git
pkgver=r11172.59e695c16
pkgrel=1
pkgdesc="OpenGL implementation testing suite. Provides a simple means to perform regression tests. (mingw-w64)"
arch=('any')
url="http://piglit.freedesktop.org/"
license=('GPL2' 'GPL3' 'LGPL2.1')
depends=('mingw-w64-freeglut' 'python-mako' 'python-numpy')
makedepends=('git' 'mingw-w64-cmake')
provides=('mingw-w64-piglit')
conflicts=('mingw-w64-piglit')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://gitlab.freedesktop.org/mesa/piglit.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/piglit"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/piglit"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
      -DGLUT_glut_LIBRARY_RELEASE=/usr/${_arch}/lib/libfreeglut.dll.a \
      -DGLUT_glut_LIBRARY=/usr/${_arch}/lib/libfreeglut.dll.a \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/piglit/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip "$pkgdir"/usr/${_arch}/lib/piglit/bin/*.exe
  done
}

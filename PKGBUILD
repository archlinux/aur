pkgname=mingw-w64-piglit-git
pkgver=r11338.6a4be9e99
pkgrel=1
pkgdesc="OpenGL implementation testing suite. Provides a simple means to perform regression tests. (mingw-w64)"
arch=('any')
url="http://piglit.freedesktop.org/"
license=('GPL2' 'GPL3' 'LGPL2.1')
depends=('mingw-w64-freeglut' 'mingw-w64-waffle' 'python-mako' 'python-numpy')
makedepends=('git' 'mingw-w64-cmake')
provides=('mingw-w64-piglit')
conflicts=('mingw-w64-piglit')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://gitlab.freedesktop.org/mesa/piglit.git" mingw.patch)
sha256sums=('SKIP' 'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/piglit"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd "${srcdir}/piglit"
  patch -p1 -i "${srcdir}"/mingw.patch
}

build() {
  for _arch in ${_architectures}; do
    rm -rf "${srcdir}/build-${_arch}"
    cp -r "${srcdir}/piglit" "${srcdir}/build-${_arch}"
    cd "${srcdir}/build-${_arch}"
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
      -DGLUT_glut_LIBRARY_RELEASE=/usr/${_arch}/lib/libfreeglut.dll.a \
      -DGLUT_glut_LIBRARY=/usr/${_arch}/lib/libfreeglut.dll.a \
      .
    make
  done
}

check() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    PIGLIT_EMULATOR="${_arch}-wine" PIGLIT_WFLINFO_EXECUTABLE="/usr/${_arch}/bin/wflinfo.exe" ./piglit run -p wgl sanity results/sanity
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip "$pkgdir"/usr/${_arch}/lib/piglit/bin/*.exe
  done
}

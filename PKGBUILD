pkgname=mingw-w64-mesa-demos-git
pkgver=r6122.faaa319d
pkgrel=1
pkgdesc="Mesa demos and tools incl. glxinfo + glxgears (mingw-w64)"
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
provides=('mingw-w64-mesa-demos')
conflicts=('mingw-w64-mesa-demos')
makedepends=('mingw-w64-cmake' 'git')
depends=('mingw-w64-freeglut')
options=('staticlibs' '!strip' '!buildflags')
source=(git+https://gitlab.freedesktop.org/mesa/demos.git)
sha256sums=(SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver () {
  cd "${srcdir}"/demos
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

prepare () {
  cd "${srcdir}"/demos
  sed -i "s|add_subdirectory (wgl)||g" src/CMakeLists.txt
}

build() {
  cd "${srcdir}"/demos
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure .. && make
    ${_arch}-cmake -DBUILD_SHARED_LIBS=OFF \
      -DGLUT_glut_LIBRARY_RELEASE=/usr/${_arch}/lib/libfreeglut.dll.a \
      -DGLUT_glut_LIBRARY=/usr/${_arch}/lib/libfreeglut.dll.a \
      .. 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/demos/build-${_arch}
    make install DESTDIR="${pkgdir}"
  done
}

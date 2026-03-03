# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=kicad-git
pkgver=10.0.0.rc1.1.r631.gdb0744f369
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools"
arch=('i686' 'x86_64')
url="https://kicad.org/"
license=('GPL-3.0-or-later')
depends=('glew' 'wxwidgets-gtk3' 'desktop-file-utils' 'boost-libs' 'python'
         'glm' 'curl' 'swig' 'python-wxpython' 'opencascade'
         'ngspice>=27' 'unixodbc' 'libgit2' 'protobuf' 'zstd' 'nng'
         'libspnav' 'poppler' 'poppler-glib' 'webkit2gtk-4.1')
makedepends=('cmake' 'git' 'zlib' 'mesa' 'boost')
optdepends=('kicad-library: for footprints')
conflicts=('kicad' 'kicad-bzr')
provides=('kicad')
install=kicad.install
source=("${pkgname}"'::git+https://gitlab.com/kicad/code/kicad.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKICAD_USE_EGL=ON \
    -DCMAKE_EXE_LINKER_FLAGS=-fuse-ld=gold \
    -DKICAD_USE_PCH=OFF \
    -DKICAD_USE_CMAKE_FINDPROTOBUF=0

  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}

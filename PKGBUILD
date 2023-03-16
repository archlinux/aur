# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=kicad-git
pkgver=7.99.0.r505.ge51594cdf5
pkgrel=1
pkgdesc="Electronic schematic and printed circuit board (PCB) design tools"
arch=('i686' 'x86_64')
url="https://kicad.org/"
license=('GPL')
depends=('glew' 'wxwidgets-gtk3' 'desktop-file-utils' 'boost-libs' 'python'
         'glm' 'curl' 'swig' 'python-wxpython' 'opencascade'
         'ngspice>=27' 'unixodbc')
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
    -DKICAD_SCRIPTING_WXPYTHON_PHOENIX=ON

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build
  make DESTDIR="${pkgdir}" install
}

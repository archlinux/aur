# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgbase=mingw-w64-mygui
pkgname=('mingw-w64-mygui')
pkgver=3.4.0
pkgrel=1
pkgdesc="A multilayer and overlappable GUI System (mingw-w64)"
arch=('any')
url="http://mygui.info/"
license=('LGPL')
depends=('mingw-w64-crt' 'mingw-w64-boost' 'mingw-w64-sdl2' 'mingw-w64-sdl2_image' 'mingw-w64-pkg-config')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'doxygen' 'graphviz' 'ttf-dejavu')
source=("https://github.com/MyGUI/mygui/archive/MyGUI${pkgver}.tar.gz")
sha512sums=('3f560fd9c7e5b514da40e41c7753dc20649f80b763f5ee20afc9627df3be14242ea833eff09eac16b9e88b1c9fbed7c09def0c5068c832e710c247191fb53487')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    # Static build
    mkdir -p ${srcdir}/build-${_arch}-static && cd ${srcdir}/build-${_arch}-static

    unset LDFLAGS CXXFLAGS
    ${_arch}-cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DMYGUI_INSTALL_SAMPLES=FALSE \
      -DMYGUI_INSTALL_TOOLS=FALSE \
      -DMYGUI_INSTALL_DOCS=FALSE \
      -DMYGUI_INSTALL_MEDIA=FALSE \
      -DCMAKE_BUILD_TYPE=Release \
      -DMYGUI_BUILD_DEMOS=FALSE \
      -DMYGUI_BUILD_TOOLS=FALSE \
      -DMYGUI_STATIC=TRUE \
      -DMYGUI_RENDERSYSTEM=7 \
      ../mygui-MyGUI$pkgver
    make

    # Shared build
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CXXFLAGS
    ${_arch}-cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DMYGUI_INSTALL_SAMPLES=FALSE \
      -DMYGUI_INSTALL_TOOLS=FALSE \
      -DMYGUI_INSTALL_DOCS=FALSE \
      -DMYGUI_INSTALL_MEDIA=FALSE \
      -DCMAKE_BUILD_TYPE=Release \
      -DMYGUI_BUILD_DEMOS=FALSE \
      -DMYGUI_BUILD_TOOLS=FALSE \
      -DMYGUI_RENDERSYSTEM=7 \
      ../mygui-MyGUI$pkgver
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    # Install static binaries
    cd ${srcdir}/build-${_arch}-static
    make DESTDIR=${pkgdir} install

    # Install shared binaries
    cd ${srcdir}/build-${_arch}
    make DESTDIR=${pkgdir} install

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/Release/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/Release/*.a
  done
}

# vim:set ts=2 sw=2 et:

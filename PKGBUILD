# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgbase=mingw-w64-mygui
pkgname=('mingw-w64-mygui')
pkgver=3.4.2
pkgrel=1
pkgdesc="A multilayer and overlappable GUI System (mingw-w64)"
arch=('any')
url="http://mygui.info/"
license=('LGPL')
depends=('mingw-w64-crt' 'mingw-w64-sdl2' 'mingw-w64-sdl2_image' 'mingw-w64-pkg-config')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'doxygen' 'graphviz' 'ttf-dejavu' 'ninja')
source=("https://github.com/MyGUI/mygui/archive/MyGUI${pkgver}.tar.gz"
        "opengl3.patch")
sha512sums=('202f3df35f0767778b5a91b71dbd1ad3409d0a1977d5fbe3f0d48db430276c71b84edc5a28dd1fdb8e60245b56f2bda99872a4d860b83585f08406b28fb850fe'
            '67a36e7424e7e0d8abf1aa3721cefb5f40da280447c68590cec0febb13330d7258a1034a9c9748bd954e529bd5062f311a91dda93074ac3fd8a2132bc88526dd')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare()
{
  cd "${srcdir}/mygui-MyGUI${pkgver}"

  patch -Np1 -i "${srcdir}/opengl3.patch"
}

build() {
  for _arch in ${_architectures}; do
    # Static build
    mkdir -p ${srcdir}/build-${_arch}-static && cd ${srcdir}/build-${_arch}-static

    unset LDFLAGS CXXFLAGS
    ${_arch}-cmake \
      -GNinja \
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
      ../mygui-MyGUI${pkgver}
    ninja

    # Shared build
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CXXFLAGS
    ${_arch}-cmake \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DMYGUI_INSTALL_SAMPLES=FALSE \
      -DMYGUI_INSTALL_TOOLS=FALSE \
      -DMYGUI_INSTALL_DOCS=FALSE \
      -DMYGUI_INSTALL_MEDIA=FALSE \
      -DCMAKE_BUILD_TYPE=Release \
      -DMYGUI_BUILD_DEMOS=FALSE \
      -DMYGUI_BUILD_TOOLS=FALSE \
      -DMYGUI_RENDERSYSTEM=7 \
      ../mygui-MyGUI${pkgver}
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    # Install static binaries
    cd ${srcdir}/build-${_arch}-static
    DESTDIR=${pkgdir} ninja install

    # Install shared binaries
    cd ${srcdir}/build-${_arch}
    DESTDIR=${pkgdir} ninja install

    mv ${pkgdir}/usr/${_arch}/bin/Release/*.dll ${pkgdir}/usr/${_arch}/bin/
    mv ${pkgdir}/usr/${_arch}/lib/Release/*.a ${pkgdir}/usr/${_arch}/lib/

    rmdir ${pkgdir}/usr/${_arch}/bin/Release
    rmdir ${pkgdir}/usr/${_arch}/lib/Release

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:

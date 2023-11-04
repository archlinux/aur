# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Andrew Belitsky <belitsky.a@gmail.com>
pkgname=mygui-openmw
pkgver=3.4.3
pkgrel=1
pkgdesc="A multilayer and overlappable GUI System"
arch=('x86_64')
url="http://mygui.info/"
license=('LGPL')
depends=('sdl2' 'sdl2_image' 'freetype2' 'gcc-libs' 'glibc' 'libglvnd')
makedepends=('cmake' 'doxygen' 'graphviz' 'glu')
provides=('mygui')
conflicts=('mygui')
source=("https://github.com/MyGUI/mygui/archive/MyGUI${pkgver}.tar.gz")
sha512sums=('88c69ca2e706af364b72d425f95013eb285501881d8094f8d67e31a54c45ca11b0eb5b62c382af0d4c43f69aa8197648259ac306b72efa7ef3e25eecb9b039cb')
options=(debug strip)

build() {
   # Build only minimal debug info to reduce size
   CFLAGS=${CFLAGS/-g /-g1 }
   CXXFLAGS=${CXXFLAGS/-g /-g1 }

  cmake \
    -B _build \
    -S mygui-MyGUI${pkgver} \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D MYGUI_INSTALL_TOOLS=TRUE \
    -D MYGUI_INSTALL_DOCS=TRUE \
    -D MYGUI_BUILD_TOOLS=TRUE \
    -D CMAKE_BUILD_TYPE=Release \
    -D MYGUI_RENDERSYSTEM=4 \
    -D MYGUI_DONT_USE_OBSOLETE=ON \
    -D BUILD_SHARED_LIBS=TRUE \
    -Wno-dev

  make -C _build
  make -C _build api-docs
}

package() {
#  cd mygui-MyGUI${pkgver}

  make DESTDIR="$pkgdir" -C _build install

    # install docs
  install -d "${pkgdir}"/usr/share/doc/
  cp -r _build/Docs/html "${pkgdir}"/usr/share/doc/MYGUI
}

# vim:set ts=2 sw=2 et:

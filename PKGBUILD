# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Hakim <acrox999 at gmail dot com>
# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

pkgname=supertux-git
_pkgname=supertux
pkgver=0.6.3.r708.gc619c4ae4
pkgrel=1
epoch=1
pkgdesc="A classic 2D jump'n run sidescroller game in a style similar to the original SuperMario game"
url='http://supertux.lethargik.org/'
license=(GPL)
arch=(i686 x86_64)
depends=('sdl2_image' 'openal' 'libvorbis' 'glew' 'boost-libs' 'curl' 'physfs' 'hicolor-icon-theme' 'libraqm')
makedepends=('git' 'cmake' 'boost' 'glm')
conflicts=(supertux)
provides=(supertux)
source=('git+https://github.com/SuperTux/supertux.git')
sha512sums=('SKIP')
           
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

prepare() {
  cd "$_pkgname"

  git submodule update --init --recursive

  sed -i '/curl\/types.h/d' src/addon/addon_manager.cpp
  sed -i '1i#include <cstddef>' src/supertux/screen_manager.hpp  
}

build() {
  cd "$_pkgname"

  export CFLAGS+=" -fPIC"
  export CXXFLAGS+=" -fPIC"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DINSTALL_SUBDIR_BIN=bin

  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="${pkgdir}/" install
}

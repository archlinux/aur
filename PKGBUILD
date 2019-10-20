# Maintainer: Angelo Theodorou <encelo at users dot sourceforge dot net>
pkgname=stratagus
pkgver=2.4.2
pkgrel=2
pkgdesc="A free cross-platform real-time strategy gaming engine"
arch=('i686' 'x86_64')
url="https://github.com/Wargus/stratagus"
license=('GPL')
depends=('libgl' 'sdl' 'libpng' 'libmng' 'libtheora' 'libmikmod' 'sqlite' 'tolua++')
makedepends=('cmake')
changelog=stratagus.changelog
source=("stratagus::git://github.com/Wargus/stratagus.git#tag=v2.4.2" glext.patch)
md5sums=('SKIP' '1c4a52e50e0e959c5b8b58bf42930be7')

prepare() {
  cd $pkgname
  patch --forward --strip=1 --input="${srcdir}/glext.patch"
}


build() {
  cd $srcdir

  cmake ${pkgname} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DGAMEDIR=/usr/bin \
  -DSBINDIR=/usr/bin \
  -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
  -Bbuild

  make -C build
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install

  mkdir -p ${pkgdir}/usr/include
  cp ${srcdir}/stratagus/gameheaders/stratagus-game-launcher.h ${pkgdir}/usr/include
}

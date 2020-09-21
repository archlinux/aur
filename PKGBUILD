#Stratagus - https://github.com/Wargus/stratagus
# Original Maintainer: Angelo Theodorou <encelo at users dot sourceforge dot net>
# Maintainer: Eden Rose(endlesseden) <eenov1988 "at"  gmail.com >
pkgname=stratagus-git
pkgver=2.4.4.72f8ea9e7.20200921
pkgrel=1
pkgdesc="A free cross-platform real-time strategy gaming engine"
arch=('i686' 'x86_64')
url="https://github.com/Wargus/stratagus"
license=('GPL')
depends=('libgl' 'sdl' 'libpng' 'libmng' 'libtheora' 'libmikmod' 'sqlite' 'tolua++')
makedepends=('git' 'cmake' 'glu')
source=("${pkgname}::git://github.com/Wargus/stratagus.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  
  DATE="$(date +%Y%m%d)"
  PV=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null || echo git-`git rev-parse --short HEAD`) ### get GIT version
  echo "2.4.4$PV.$DATE" | sed -e 's/git-/./g' 
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
  cp ${srcdir}/${pkgname}/gameheaders/stratagus-game-launcher.h ${pkgdir}/usr/include
  cp ${srcdir}/${pkgname}/gameheaders/stratagus-gameutils.h ${pkgdir}/usr/include
  cp ${srcdir}/${pkgname}/gameheaders/stratagus-tinyfiledialogs.h ${pkgdir}/usr/include
}


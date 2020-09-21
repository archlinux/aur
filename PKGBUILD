#Stargus - https://github.com/Wargus/stargus
# Maintainer: Eden Rose(endlesseden) <eenov1988 "at"  gmail.com >
pkgname=stargus-git
pkgver=2.4.4.72f8ea9e7.20200921
pkgrel=1
pkgdesc="Starcraft 1 plugin for Stratagus, free cross-platform real-time strategy gaming engine."
arch=('i686' 'x86_64')
url="https://github.com/Wargus/stargus"
license=('GPL')
depends=('libgl' 'sdl' 'libpng' 'libmng' 'libtheora' 'libmikmod' 'sqlite' 'tolua++' 'stratagus' 'stratagus-gameutils.h')
makedepends=('git' 'cmake' 'glu')
source=("${pkgname}::git://github.com/Wargus/stargus.git")
md5sums=('SKIP')
provides=(${pkgname}
	  'stargus'
)
pkgver() {
  cd "$srcdir/${pkgname}"
  
  DATE="$(date +%Y%m%d)"
  PV=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null || echo git-`git rev-parse --short HEAD`) ### get GIT version
  echo "2.4.4$PV.$DATE" | sed -e 's/git-/./g' 
}

build() {
  cd $srcdir

  cmake ${pkgname} \
  -DSTRATAGUS=stratagus \
  -DSTRATAGUS_INCLUDE_DIR=/usr/include/ \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DGAMEDIR=/usr/bin \
  -DSBINDIr=/usr/bin \
  -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
  -Bbuild

  make -C build
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

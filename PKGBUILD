#Stargus - https://github.com/Wargus/stargus
# Maintainer: Eden Rose(endlesseden) <eenov1988 "at"  gmail.com >
pkgname=stargus-git
pkgver=2.4.1.a482208.20220709
pkgrel=1
pkgdesc="Starcraft 1 plugin for Stratagus, free cross-platform real-time strategy gaming engine."
arch=('i686' 'x86_64')
url="https://github.com/Wargus/stargus"
license=('GPL')
depends=('libgl' 'sdl' 'libpng' 'libmng' 'libtheora' 'libmikmod' 'sqlite' 'tolua++' 'stratagus' 'stratagus-gameutils.h' 'stormlib' 'casclib' 'nlohmann-json')
makedepends=('git' 'cmake' 'glu')
optionaldepends=('innoextract: Assists in extracting Starcraft game files')
source=("${pkgname}::git+https://github.com/Wargus/stargus.git")
md5sums=('SKIP')
provides=(${pkgname}
	  'stargus')
pkgver() {
  cd "$srcdir/${pkgname}"
  
  DATE="$(date +%Y%m%d)"
  PV=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null || echo git-`git rev-parse --short HEAD`) ### get GIT version
  VER=$(git describe --tags | head -1 | grep v | sed 's/v//g;s/-/\n/g' | head -1)
  echo "$VER$PV.$DATE" | sed -e 's/git-/./g' 
}

build() {
  cd $srcdir/$pkgname
  
  if [ -e build ]; then
  	rm -r build
  fi
    
  arch-meson build
  ninja -C build

  cmake ./ \
  -DSTRATAGUS=stratagus \
  -DSTRATAGUS_INCLUDE_DIR=/usr/include/ \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DGAMEDIR=/usr/bin \
  -DBINDIR=/usr/bin \
  -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
  -Bbuild

  make -C build
}

package() {
  cd ${srcdir}/${pkgname}/build
  cp ${srcdir}/${pkgname}/stargus.png ./
  cp stargus-0.xpm ./stargus.xpm
  if [ ! -e ${srcdir}/${pkgname}/campaigns ]; then
  	mkdir ${srcdir}/${pkgname}/campaigns
  fi
  if [ ! -e ${srcdir}/${pkgname}/maps ]; then
  	mkdir ${srcdir}/${pkgname}/maps
  fi
  if [ ! -e ${srcdir}/${pkgname}/shaders ]; then
        mkdir ${srcdir}/${pkgname}/shaders
  fi
  make DESTDIR=${pkgdir} install/local/fast
}

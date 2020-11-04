# -*- shell-script -*-
# Maintainer:  Marco Schroeder <marco.schroeder96 at gmail dot com>
# Contributor: Fernando Carmona Varo <ferkiwi @t gmail dot com>
pkgname=keeperrl-git
pkgver=r5004
pkgrel=1
pkgdesc="Dungeon Keeper and Dwarf Fortress inspired dungeon simulator built on top of roguelike mechanics."
arch=('i686' 'x86_64')
url="http://keeperrl.com/"
groups=()
license=('GPL')
conflicts=('keeperrl')
#depends=('sfml' 'freeglut' 'angelscript')
depends=('sfml' 'freeglut')
makedepends=('git' 'ctags' 'boost' 'clang' 'sdl2_image')
checkdepends=()
optdepends=()
backup=()
options=()
install=
changelog=
source=("$pkgname"::'git://github.com/miki151/keeperrl#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    printf "r%s" $(git rev-list --count HEAD)
}

build() {
  cd "${srcdir}/${pkgname}"
  make NO_STEAMWORKS=true RELEASE=true
}

package() {
  cd "${srcdir}/${pkgname}"

  local instdir="/opt/keeperrl"

  install -dm775 "$pkgdir/$instdir"
  install -Dm755 keeper "$pkgdir/$instdir/"
  install -Dm644 appconfig.txt "$pkgdir/$instdir/"
  cp -a data* "$pkgdir/$instdir/"
  
  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/keeperrl" <<EOF
#!/bin/sh
cd $instdir/
exec ./keeper "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/keeperrl"
}


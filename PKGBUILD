# Contributor: Maintainer <keenerd@gmail.com>
pkgname=cataclysm-git
pkgver=20130706
pkgrel=1
pkgdesc="A post-apocalyptic roguelike."
#url="http://cataclysmrl.blogspot.com/"
#url="http://www.cataclysm.glyphgryph.com/"
url="http://en.cataclysmdda.com/"
arch=('i686' 'x86_64')
license=("CCPL:by-sa")
depends=('ncurses')
makedepends=('git')
install=cataclysm-git.install
source=('git://github.com/CleverRaven/Cataclysm-DDA.git')
md5sums=('SKIP')

# whales's version
#_gitroot="git://github.com/Whales/Cataclysm.git"
#_gitname="Cataclysm"

# community fork
#_gitroot="git://github.com/TheDarklingWolf/Cataclysm-DDA.git"
#_gitname="Cataclysm-DDA"

# new community fork
#_gitroot="git://github.com/CleverRaven/Cataclysm-DDA.git"
_gitname="Cataclysm-DDA"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}


build() {
  cd "$_gitname"

  sed -i 's|"data/|"/usr/share/cataclysm/data/|g' *.cpp
  sed -i 's|"./data/|"/usr/share/cataclysm/data/|g' *.cpp
  sed -i 's|"data"|"/usr/share/cataclysm/data"|g' *.cpp
  sed -i 's|"save"|"/var/games/cataclysm/save"|g' {game,map,overmap,mapbuffer,main_menu,itypedef}.cpp
  sed -i 's|"save/|"/var/games/cataclysm/save/|g' {game,map,overmap,mapbuffer,main_menu,itypedef}.cpp
  # Earnestly, http://ix.io/6xk/diff
  # patch -Np1 -i ../foo.patch
  # http://ix.io/6xl/sh
  # keenerd: Btw, it won't build with -flto, it gets stuck in a loop with lto1 (lto_wrapper iirc)

  # someday...
  #sed -i '1i #include <stdio.h>' {game,map,overmap}.cpp
  #sed -i 's|"save/|getenv("HOME") << "/.cataclysm/save/|g' *.cpp

  make PREFIX=/usr
}

package() {
  cd "$_gitname"
  install -Dm755 cataclysm "$pkgdir/usr/bin/cataclysm"
  install -dm774 -g games  "$pkgdir/usr/share/cataclysm/data"
  cp -r data/* "$pkgdir/usr/share/cataclysm/data"
  install -dm774 -g games "$pkgdir/var/games/cataclysm/save"
}

# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=monsters_and_mushrooms-git
_pkgname=monsters_and_mushrooms
pkgver=r2.fd68f10
pkgrel=1
pkgdesc="A Millipede remake written in Python using Pygame"
arch=('any')
url="https://github.com/machinezilla/monsters_and_mushrooms"
license=('GPL2')
depends=('python2-pygame')
source=("${_pkgname}"::'git+https://github.com/machinezilla/monsters_and_mushrooms.git' 'monsters_and_mushrooms.desktop')
md5sums=('SKIP'
         '106a7a4738e9db5075fa96895e93ed48')

build() {
  cd $srcdir/$_pkgname
  git submodule init
  git submodule update
  sed -i '1s/python/python2/' game.py
  sed -i '1s/python/python2/' animtest.py
} 

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/monsters_and_mushrooms
  mkdir -p $pkgdir/usr/{share/monsters_and_mushrooms/data/{images,sounds,sprites},bin}
  chmod 775 $pkgdir/usr/share/monsters_and_mushrooms
  install -Dm 644 data/images/* $pkgdir/usr/share/monsters_and_mushrooms/data/images
  install -Dm 644 data/sounds/* $pkgdir/usr/share/monsters_and_mushrooms/data/sounds
  install -Dm 644 data/sprites/* $pkgdir/usr/share/monsters_and_mushrooms/data/sprites
  install -Dm 644 README $pkgdir/usr/share/monsters_and_mushrooms/README
  install -Dm 644 gpl.txt $pkgdir/usr/share/monsters_and_mushrooms/gpl.txt
  install -Dm 755 animtest.py $pkgdir/usr/share/monsters_and_mushrooms/animtest.py
  install -Dm 755 game.py $pkgdir/usr/share/monsters_and_mushrooms/game.py
  echo "#!/bin/sh
  cd /usr/share/monsters_and_mushrooms
  ./game.py" > $pkgdir/usr/bin/monsters_and_mushrooms
  chmod 755 $pkgdir/usr/bin/monsters_and_mushrooms
  install -Dm 644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
}

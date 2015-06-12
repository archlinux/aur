# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=airhockey-git
pkgver=20120414
pkgrel=1
pkgdesc="(single|multi)-player game written in OpenGL"
arch=('x86_64' 'i686')
url="https://github.com/cosmiczilch/AirHockey"
license=('GPL')
depends=('sdl_image' 'sdl_net' 'freeglut' 'sdl_mixer')
source=('airhockey.desktop')
md5sums=('91dc383c109507d242e5e3585ad697d6')

_gitroot="https://github.com/cosmiczilch/AirHockey.git"
_gitname="AirHockey"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  make
} 

package() {
  mkdir -p $pkgdir/usr/share/$_gitname/resources/{fonts,images,sounds,themes}
  install -Dm755 $srcdir/$_gitname/main $pkgdir/usr/share/$_gitname/airhockey
  for dir in fonts images sounds themes; do
	install -Dm644 $srcdir/$_gitname/resources/$dir/* $pkgdir/usr/share/$_gitname/resources/$dir/
  done
  echo -e "#"'!'"/bin/bash\ncd /usr/share/$_gitname/\n./airhockey \"\$@\"" >./airhockey
  install -Dm755 ./airhockey $pkgdir/usr/bin/airhockey
  install -Dm644 $srcdir/airhockey.desktop $pkgdir/usr/share/applications/airhockey.desktop
}

# vim: sw=2:ts=2 et:

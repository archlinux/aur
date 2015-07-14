# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=airhockey-git
_gitname=airhockey
pkgver=r38.bfa266b
pkgrel=1
pkgdesc="(single|multi)-player game written in OpenGL"
arch=('x86_64' 'i686')
url="https://github.com/cosmiczilch/AirHockey"
license=('GPL')
depends=('sdl_image' 'sdl_net' 'freeglut' 'sdl_mixer' 'glew')
makedepends=('git')
md5sums=('SKIP' '91dc383c109507d242e5e3585ad697d6')

source=("${pkgname}"::'git+https://github.com/cosmiczilch/AirHockey.git' airhockey.desktop)

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir"/${pkgname}
  make
} 

package() {
  mkdir -p $pkgdir/usr/share/$_gitname/resources/{fonts,images,sounds,themes}
  install -Dm755 $srcdir/${pkgname}/main $pkgdir/usr/share/$_gitname/airhockey
  for dir in fonts images sounds themes; do
	install -Dm644 $srcdir/${pkgname}/resources/$dir/* $pkgdir/usr/share/$_gitname/resources/$dir/
  done
  echo -e "#"'!'"/bin/bash\ncd /usr/share/$_gitname/\n./airhockey \"\$@\"" >./airhockey
  install -Dm755 ./airhockey $pkgdir/usr/bin/airhockey
  install -Dm644 $srcdir/airhockey.desktop $pkgdir/usr/share/applications/airhockey.desktop
}

# vim: sw=2:ts=2 et:

# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=freerct-git
pkgver=r1090.2976ed9
pkgrel=2
pkgdesc="Open Source RollerCoaster Tycoon 1 and 2 implementation"
arch=('i686' 'x86_64')
url="http://freerct.org"
license=('GPL2')
depends=('sdl2' 'sdl2_ttf' 'libzip' 'libpng' 'ttf-freefont')
optdepends=('bison' 'flex')
makedepends=('git' 'cmake')
conflicts=('freerct')
provides=('freerct')
source=('freerct::git+https://github.com/FreeRCT/FreeRCT.git'
        'freerct.cfg'
        'freerct.sh')
md5sums=('SKIP'
         '9418fedbf4487127964abc96b4eb71e9'
         '1fce36e419ae2d70a28eba03f9cb6fa1')
_gitname=freerct

build() {
  cd "$srcdir/$_gitname"
  cmake .
  make
}

package() {
  cd "$srcdir/$_gitname"

  mkdir -p "$pkgdir/opt/freerct"
  mkdir -p "$pkgdir/usr/bin"

  # install all files
  cp -r bin/* "$pkgdir/opt/freerct/"

  # install executeables
  install -D -m755 "$srcdir/freerct.sh" "$pkgdir/usr/bin/freerct"

  # install freerct.cfg
  install -D -m664 "$srcdir/freerct.cfg" "$pkgdir/opt/freerct"

  # install LICENSE
  install -D -m664 LICENSE-gpl-2.0.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:

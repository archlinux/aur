# Maintainer: SoVerySour <gmaiadremailfeis22 at gmail dot com>

pkgname=infra-arcana-git
pkgver=v18.2.168.g6df74630
pkgrel=1

pkgdesc="Roguelike game inspired by the writings of H.P. Lovecraft"
arch=('i686' 'x86_64')
url="https://github.com/martin-tornqvist/ia"
license=('custom: Infra Arcana License' 'Apache')

depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
makedepends=('git' 'cmake')
conflicts=('infra-arcana')
md5sums=('SKIP')

source=("git+https://github.com/soverysour/ia.git#branch=develop")

pkgver() {
  cd $srcdir/ia
  echo "$(git describe --tags | tr - .)"
}

build() {
  cd $srcdir/ia

  mkdir -p build && cd build
  git submodule init
  git submodule update
  cmake ../
  make ia
}

package() {
  cd $pkgdir

  install -DTm644 "$srcdir/ia/res/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -DTm644 "$srcdir/ia/res/images/SPECIAL_ELITE_License.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/SPECIAL_ELITE_License.txt"

  install -DTm644 "$srcdir/ia/res/contact.txt" \
    "$pkgdir/usr/share/doc/$pkgname/contact.txt"
  install -DTm644 "$srcdir/ia/res/credits.txt" \
    "$pkgdir/usr/share/doc/$pkgname/credits.txt"
  install -DTm644 "$srcdir/ia/res/manual.txt" \
    "$pkgdir/usr/share/doc/$pkgname/manual.txt"
  install -DTm644 "$srcdir/ia/res/release_history.txt" \
    "$pkgdir/usr/share/doc/$pkgname/release_history.txt"

  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/opt/games/$pkgname"
  
  install -Dm775 "$srcdir/ia/build/ia" \
    "$pkgdir/opt/games/$pkgname/infra-arcana"

  cp -r "$srcdir/ia/build/res" "$pkgdir/opt/games/$pkgname/"
  chmod 775 "$pkgdir/opt/games/$pkgname/res"
  
  printf "#!/bin/bash\ncd /opt/games/%s\n./infra-arcana" "$pkgname" > "$pkgdir/usr/bin/ia"
  chmod 775 "$pkgdir/usr/bin/ia"
}

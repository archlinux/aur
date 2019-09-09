# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: SoVerySour <gmaiadremailfeis22 at gmail dot com>

pkgname=infra-arcana-git
pkgver=v19.2.r359.gf3c8e782
pkgrel=1

pkgdesc="Roguelike game inspired by the writings of H.P. Lovecraft - git version"
arch=('i686' 'x86_64')
url="https://gitlab.com/martin-tornqvist/ia"
license=('custom: Infra Arcana License' 'Apache')

depends=('sdl2_image' 'sdl2_mixer')
makedepends=('git' 'cmake')
conflicts=('infra-arcana')
md5sums=('SKIP')

source=("git+https://gitlab.com/martin-tornqvist/ia.git")

pkgver() {
  cd $srcdir/ia
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

  install -DTm644 "$srcdir/ia/installed_files/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -DTm644 "$srcdir/ia/installed_files/contact.txt" \
    "$pkgdir/usr/share/doc/$pkgname/contact.txt"
  install -DTm644 "$srcdir/ia/installed_files/credits.txt" \
    "$pkgdir/usr/share/doc/$pkgname/credits.txt"
  install -DTm644 "$srcdir/ia/installed_files/manual.txt" \
    "$pkgdir/usr/share/doc/$pkgname/manual.txt"
  install -DTm644 "$srcdir/ia/installed_files/release_history.txt" \
    "$pkgdir/usr/share/doc/$pkgname/release_history.txt"

  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/opt/games/$pkgname"

  install -Dm775 "$srcdir/ia/build/ia" \
    "$pkgdir/opt/games/$pkgname/infra-arcana"

  ln -s /opt/games/$pkgname/infra-arcana $pkgdir/usr/bin/

  cp -r "$srcdir/ia/build/audio" "$pkgdir/opt/games/$pkgname/"
  chmod 775 "$pkgdir/opt/games/$pkgname/audio"
  
  cp -r "$srcdir/ia/build/data" "$pkgdir/opt/games/$pkgname/"
  chmod 775 "$pkgdir/opt/games/$pkgname/data"

  cp -r "$srcdir/ia/build/gfx" "$pkgdir/opt/games/$pkgname/"
  chmod 775 "$pkgdir/opt/games/$pkgname/gfx"
 
  printf "\n\n\n"
  printf "*** Note that updating the package will keep ***\n"
  printf "*** Your \"config\", \"save\" and \"highscores\" files ***\n"
  printf "*** From under /usr/share/games/%s/res/data/ ***\n" "$pkgname"
  printf "*** If anything unusual happens after an update, try deleting those ***\n"
  printf "\n\n\n"
}

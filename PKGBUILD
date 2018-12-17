# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: SoVerySour <gmaiadremailfeis22 at gmail dot com>

pkgname=infra-arcana-git
pkgver=v19.2.r230.g83ed53a3
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

prepare() {
  if [ -f "/opt/games/$pkgname/res/data/config" ]
  then
    cp "/opt/games/$pkgname/res/data/config" "$srcdir/"
  fi

  if [ -f "/opt/games/$pkgname/res/data/save" ]
  then
    cp "/opt/games/$pkgname/res/data/save" "$srcdir/"
  fi

  if [ -f "/opt/games/$pkgname/res/data/highscores" ]
  then
    cp "/opt/games/$pkgname/res/data/highscores" "$srcdir/"
  fi
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
  #install -DTm644 "$srcdir/ia/res/gfx/SPECIAL_ELITE_License.txt" \
  #  "$pkgdir/usr/share/licenses/$pkgname/SPECIAL_ELITE_License.txt"

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
  
  if [ -f "$srcdir/config" ]
  then
    cp "$srcdir/config" "$pkgdir/opt/games/$pkgname/res/data/config"
    rm "$srcdir/config"
  else
    touch "$pkgdir/opt/games/$pkgname/res/data/config"
  fi

  if [ -f "$srcdir/save" ]
  then
    cp "$srcdir/save" "$pkgdir/opt/games/$pkgname/res/data/save"
    rm "$srcdir/save"
  else
    touch "$pkgdir/opt/games/$pkgname/res/data/save"
  fi

  
  if [ -f "$srcdir/highscores" ] 
  then
    cp "$srcdir/highscores" "$pkgdir/opt/games/$pkgname/res/data/highscores"
    rm "$srcdir/highscores"
  else
    touch "$pkgdir/opt/games/$pkgname/res/data/highscores"
  fi

  chmod 666 "$pkgdir/opt/games/$pkgname/res/data/save"
  chmod 666 "$pkgdir/opt/games/$pkgname/res/data/config"
  chmod 666 "$pkgdir/opt/games/$pkgname/res/data/highscores"

  printf "#!/bin/bash\ncd /opt/games/%s\n./infra-arcana" "$pkgname" > "$pkgdir/usr/bin/ia"
  chmod 775 "$pkgdir/usr/bin/ia"

  printf "\n\n\n"
  printf "*** Note that updating the package will keep ***\n"
  printf "*** Your \"config\", \"save\" and \"highscores\" files ***\n"
  printf "*** From under /opt/games/%s/res/data/ ***\n" "$pkgname"
  printf "*** If anything unusual happens after an update, try deleting those ***\n"
  printf "\n\n\n"
}

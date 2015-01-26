# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=egoboo-git
pkgver=2.8.1.r1367.873a0a9
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="An action RPG/dungeon crawling adventure with OpenGL 3D graphics (development version)"
url="http://egoboo.sourceforge.net/"
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'physfs' 'enet' 'libgl' 'glu')
makedepends=('mesa')
source=("git+https://github.com/egoboo/egoboo.git"
        "egoboo.png"
        "egoboo.desktop")
sha256sums=('SKIP'
            '7b112e3449b1881c9a218959817b6db9c23c393910ed9a2856b5fc9e8cf267a8'
            'ee96f15b9edacf9d6ee12e0be0ad324e48a80002597b5520e9e9edf757b150ca')

pkgver() {
  cd egoboo
  # needs to be updated later, when the repo has proper tags
  printf "2.8.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd egoboo

  # adapt paths
  sed 's|egoboo-2.x|egoboo|g;s|share/games/|share/|g;s|etc/|share/|g;s|games/|bin/|g' \
    -i egolib/src/egolib/platform/file_linux.c
  # allow adding our flags
  sed 's|CFLAGS  :=|CFLAGS  +=|;s|CXXFLAGS:=|CXXFLAGS+=|' -i egolib/Makefile game/Makefile
  # fix linking
  sed 's|-lenet|-lenet -lm -lstdc++|' -i game/Makefile
}

build() {
  make -C egoboo
}

package() {
  cd egoboo
  # doc
  install -d "$pkgdir"/usr/share/doc
  cp -rup doc "$pkgdir"/usr/share/doc/egoboo
  # binary
  cd game
  install -Dm755 egoboo-2.x "$pkgdir"/usr/bin/egoboo
  # data
  cd data
  install -d "$pkgdir"/usr/share/egoboo
  cp -rup *.txt basicdat modules "$pkgdir"/usr/share/egoboo
  find "$pkgdir"/usr/share/egoboo -type f -print0 | xargs -0 chmod 644
  # icon and .desktop file
  install -Dm644 "$srcdir"/egoboo.png "$pkgdir"/usr/share/pixmaps/egoboo.png
  install -Dm644 "$srcdir"/egoboo.desktop "$pkgdir"/usr/share/applications/egoboo.desktop
}

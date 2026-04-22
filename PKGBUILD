# Maintainer: Joao Cordeiro <jlcordeiro@gmail.com>

pkgname=brogue
pkgver=1.15.1
pkgrel=1
pkgdesc="Roguelike game (Brogue Community Edition)"
arch=('x86_64')
url="https://github.com/tmewett/BrogueCE"
license=('AGPL-3.0-or-later')

depends=('sdl2' 'sdl2_image')
makedepends=('make' 'gcc')

conflicts=('brogue-ce-git' 'brogue-ce' 'brogue-ce-curses')
provides=('brogue-ce')
options=(!debug)

source=("$pkgname-$pkgver.tar.gz::https://github.com/tmewett/BrogueCE/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2abc186c5327342cb9ad7e45d41096ab10797d5ba76dcac843824ac2a0bfb3ac')

build() {
  cd "BrogueCE-$pkgver"
  make DATADIR="/usr/share/brogue"
}

package() {
  cd "BrogueCE-$pkgver"

install -d "$pkgdir/usr/share/brogue"
install -Dm755 bin/brogue "$pkgdir/usr/bin/brogue-bin"
cp -r bin/assets "$pkgdir/usr/share/brogue/"
install -Dm644 bin/keymap.txt "$pkgdir/usr/share/brogue/keymap.txt"

  # launcher (XDG-safe)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/brogue" << 'EOF'
#!/bin/sh

USERDIR="${XDG_DATA_HOME:-$HOME/.local/share}/brogue"
mkdir -p "$USERDIR"
cd "$USERDIR"

exec /usr/bin/brogue-bin "$@"
EOF
}

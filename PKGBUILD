# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=snipes-git
pkgver=r211.c52f725
pkgrel=1
pkgdesc="The classic 1982 text-mode game, ported from the original DOS executable"
arch=('i686' 'x86_64')
url="https://github.com/Davidebyzero/Snipes"
license=('custom')
groups=('games')
depends=('sdl2_ttf')
makedepends=('git')
source=("git+https://github.com/Davidebyzero/Snipes"
		"http://kingbird.myphotos.cc/ee22d44076adb8a34d8e20df4be3730a/SnipesConsole.ttf"
		"license.txt")
md5sums=('SKIP'
         'ee22d44076adb8a34d8e20df4be3730a'
         '13b721b4d3a2add8e7bf6cdd65dcaacc')

pkgver() {
  cd "$srcdir/Snipes"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_datadir=/usr/share/snipes

prepare() {
  # Create config file and patch font file location
  cd "$srcdir/Snipes"
  sed 's|\(#define FONT_FILENAME "\)\(.*\)$|\1'"$_datadir"/'\2|' < config-sample.h > config.h
}

build() {
  cd "$srcdir/Snipes"
  make
}

package() {
  # Font file
  mkdir -p "$pkgdir$_datadir"
  install -m644 -t "$pkgdir$_datadir" SnipesConsole.ttf

  # License
  mkdir -p "$pkgdir/usr/share/licenses/snipes-git"
  install -m644 -t "$pkgdir/usr/share/licenses/snipes-git" license.txt

  # Binary
  cd "$srcdir/Snipes"
  mkdir -p "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" snipes
}

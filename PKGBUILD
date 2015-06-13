# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=durdraw-git
pkgver=20150227
pkgrel=1
pkgdesc="Frame based ASCII and ANSI drawing and playback program"
url="http://cmang.org/durdraw/"
license=("custom")
arch=('any')
makedepends=('git')
depends=('python2')
optdepends=('ansilove: png export, animated gif export'
            'python2-pillow: animated gif export'
            'images2gif: animated gif export')
conflicts=('durdraw')
provides=('durdraw')
source=("git+https://github.com/cmang/durdraw.git")
md5sums=('SKIP')

pkgver() {
  cd durdraw
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd durdraw
  # todo, make it work with py3
  #2to3 -w durdraw
  sed -i 's|bin/python.*$|bin/env python2|' durdraw
  sed -i 's|/usr/local/share/|/usr/share/|' durdraw
  grep -A5000 -m1 -e 'LEGAL' readme.txt > LICENSE
  grep -B5000 -m1 -e 'Homepage' readme.txt > help.txt
}

package() {
  cd durdraw
  install -Dm755 durdraw "$pkgdir/usr/bin/durdraw"

  install -d "$pkgdir/usr/share/durdraw"
  install -m644 *.dur "$pkgdir/usr/share/durdraw/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 help.txt "$pkgdir/usr/share/doc/$pkgname/help.txt"

  install -Dm644 vga.pcf "$pkgdir/usr/share/fonts/X11/misc/vga.pcf"
  install -Dm644 dos437.ttf "$pkgdir/usr/share/fonts/TTF/dos437.ttf"
}


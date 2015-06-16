# Maintainer: Daniel Escoz <darkhogg[at]gmail[dot]com>
pkgname=werebot
pkgver=r54.56d53cc
pkgrel=1
pkgdesc="Werewolf IRC Bot"
url="http://github.com/Darkhogg/werebot"
arch=('any')
license=('GPL3')
depends=('nodejs')
makedepends=('git' 'npm')
source=("$pkgname::git+https://github.com/Darkhogg/werebot.git"
        "werebot.service")
md5sums=('SKIP'
         'b91fd86ab22acbf3dcabce202652a565')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/$pkgname"

    PYTHON=python2 npm install
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/lib/node_modules/$pkgname"
  install -d "$pkgdir/usr/bin"

  install -Dm644 werebot.service "$pkgdir/usr/lib/systemd/system/werebot.service"

  cp -dr --no-preserve=ownership "$pkgname" "$pkgdir/usr/lib/node_modules/"

  ln -s "/usr/lib/node_modules/$pkgname/index.js" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:

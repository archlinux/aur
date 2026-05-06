pkgname=picobat-git
pkgver=226.05.r585.g78b0273
pkgrel=1
pkgdesc='Free, cross-platform batch script interpreter'
arch=('x86_64')
url='https://github.com/darkbatcher/picobat'
license=('GPL-3.0-or-later' 'BSD-2-Clause')
depends=('glibc' 'xdg-utils')
makedepends=('git' 'gcc' 'make' 'flex' 'bison' 'gettext')
provides=('picobat')
conflicts=('picobat')
source=('git+https://github.com/darkbatcher/picobat.git#branch=dev')
sha256sums=('SKIP')

pkgver() {
  cd picobat

  printf '%s.r%s.g%s' \
    "$(date +%Y.%m | sed 's/0//')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd picobat

  CFLAGS="${CFLAGS/-Werror=format-security/}"
  make config
  make all bin
}

package() {
  cd picobat

  install -d "$pkgdir/usr/lib/picobat" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  cp -a bin/. "$pkgdir/usr/lib/picobat/"

  ln -s ../lib/picobat/pbat "$pkgdir/usr/bin/pbat"
  ln -s ../lib/picobat/cmd/dump "$pkgdir/usr/bin/pbat-dump"
  ln -s ../lib/picobat/cmd/pbatize "$pkgdir/usr/bin/pbatize"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 COPYING.darkbox "$pkgdir/usr/share/licenses/$pkgname/COPYING.darkbox"
  install -Dm644 COPYING.libmatheval "$pkgdir/usr/share/licenses/$pkgname/COPYING.libmatheval"
  install -Dm644 COPYING.linenoise "$pkgdir/usr/share/licenses/$pkgname/COPYING.linenoise"
}

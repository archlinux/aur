# Maintainer: Roman Mishin <xtradev (a) yandex (.) ru>

pkgname=bracmat-git
pkgver=6.7.4r237
pkgrel=1
pkgdesc='Programming language for symbolic computation with pattern matching features'
arch=('x86_64')
url='https://github.com/BartJongejan/Bracmat'
license=('GPL2')
makedepends=('git')
provides=('bracmat')
conflicts=('bracmat')
source=("git+$url.git"
        'path-to-help.patch')
md5sums=('SKIP'
         'f595a0ccdef5980c45433127c1bc37b4')

pkgver() {
  sed -nr 'N;s/#define VERSION "(.+)"\n#define BUILD "(.+)"/\1r\2/p'\
          "$srcdir/Bracmat/src/bracmat.c"
}

prepare() {
  cd "$srcdir/Bracmat/src"
  patch -Ni "$srcdir/path-to-help.patch"
}

build() {
  cd "$srcdir/Bracmat/src"
  make bracmat
  make bracmatsafe
}

package() {
  install -dm755                                   "$pkgdir"/usr/bin
  install -sm755 "$srcdir"/Bracmat/src/bracmat     "$pkgdir"/usr/bin
  install -sm755 "$srcdir"/Bracmat/src/bracmatsafe "$pkgdir"/usr/bin
  pushd          "$srcdir"/Bracmat/src                   &>/dev/null
  make clean                                             &>/dev/null
  popd                                                   &>/dev/null

  install -dm755                    "$pkgdir"/usr/lib/bracmat/web
  cp -a "$srcdir"/Bracmat/web/*     "$pkgdir"/usr/lib/bracmat/web
  cp -a "$srcdir"/Bracmat/*.bra     "$pkgdir"/usr/lib/bracmat
  cp -a "$srcdir"/Bracmat/*.xml     "$pkgdir"/usr/lib/bracmat

  install -dm755                    "$pkgdir"/usr/share/doc/bracmat
  cp -a "$srcdir"/Bracmat/doc/*     "$pkgdir"/usr/share/doc/bracmat
  cp -a "$srcdir"/Bracmat/*.md      "$pkgdir"/usr/share/doc/bracmat
  cp -a "$srcdir"/Bracmat/Changelog "$pkgdir"/usr/share/doc/bracmat/changelog.txt
}

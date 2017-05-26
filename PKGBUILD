# Maintainer: Emmanuel Gil Peyrot <emmanuel.peyrot@collabora.com>

_pkgname=hsbooru
pkgname="$_pkgname-git"
pkgver=r66.13b508f
pkgrel=1
pkgdesc="*booru scraper in Haskell"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/haasn/hsbooru"
license=('GPL3')
depends=('xapian-core')
makedepends=('git' 'ghc' 'cabal-install')
source=("$_pkgname::git+https://github.com/haasn/hsbooru"
        'git+https://github.com/haasn/intset')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  git submodule init
  git config submodule.extern/intset.url "$srcdir/intset"

  cabal sandbox init
  cabal sandbox add-source extern/intset
}

build() {
  cd "$srcdir/$_pkgname"
  git submodule update
  cabal install
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 .cabal-sandbox/bin/hsbooru "$pkgdir/usr/bin/hsbooru"
}

# vim:set ts=2 sts=2 sw=2 et:

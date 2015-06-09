# Maintainer: Noel Maersk <veox at wemakethings dotnet>
# Contributor: Mike Lenzen <lenzenmi@gmail.com>

pkgname=litecoin-git
_gitname=litecoin
epoch=1
pkgver=4179.88e2a2e
pkgrel=1
pkgdesc="A peer-to-peer network-based digital currency (git version)"
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
license=('MIT')
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('litecoin')
conflicts=('litecoin')
source=('git://github.com/litecoin-project/litecoin.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"

  # check out specific branch or tag
  # git checkout v0.8.6.1

  # make litecoin-qt client
  qmake-qt4
  make

  # make litecoin daemon
  cd "$srcdir/$_gitname/src"
  make $MAKEFLAGS -f makefile.unix litecoind
}

package() {
  # install litecoin-qt client
  install -D -m755 "$srcdir/$_gitname/litecoin-qt" "$pkgdir/usr/bin/litecoin-qt"

  # install litecoin daemon
  install -D -m755 "$srcdir/$_gitname/src/litecoind" "$pkgdir/usr/bin/litecoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Yamashita Ren

# Contributor: Qhor Vertoe <vertoe at qhor dot net>
# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=mintcoin-daemon-git
_gitname=mintcoin
pkgver=r175.59f8575
pkgrel=1
pkgdesc="Mintcoin is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://www.mintcoinofficial.com/"
license=('MIT')
depends=('boost-libs>=1.46' 'openssl')
makedepends=('git' 'make' 'boost')
provides=('mintcoin-daemon')
conflicts=('mintcoin')
source=('git://github.com/MintcoinCommunity/mintcoin.git#branch=2.0')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # fix for build
  cd "$srcdir/$_gitname/src"
  sed -i $srcdir/$_gitname/src/init.cpp -e 's/#if ! USE_IPV6/#ifndef USE_IPV6/' 
}

build() {
  # make mintcoind daemon
  cd "$srcdir/$_gitname/src"
  make -f makefile.unix mintcoind
}

package() {
  # install mintcoind daemon
  install -D -m755 "$srcdir/$_gitname/src/mintcoind" "$pkgdir/usr/bin/mintcoind"

  # install license
  install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

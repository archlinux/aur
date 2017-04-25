# Maintainer: Yamashita Ren

# Contributor: Qhor Vertoe <vertoe at qhor dot net>
# Contributor: Noel Maersk <veox at wemakethings dot net>
# Contributor: Mike Lenzen <lenzenmi at gmail dot com>

pkgname=mintcoin-daemon-git
_gitname=mintcoin
pkgver=2.0.2.r0.g59f8575
pkgrel=1
pkgdesc="Mintcoin is a peer-to-peer network-based digital currency (git version)."
arch=('i686' 'x86_64')
url="http://www.mintcoinofficial.com/"
license=('MIT')
depends=('boost-libs>=1.46' 'openssl')
makedepends=('git' 'make' 'boost')
provides=('mintcoin-daemon')
conflicts=('mintcoin')
source=('git+https://github.com/MintcoinCommunity/mintcoin.git#branch=2.0')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

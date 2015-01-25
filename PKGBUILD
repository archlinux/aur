# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=liquidwar
pkgver=5.6.4
pkgrel=7
pkgdesc="A unique multiplayer wargame"
arch=('i686' 'x86_64')
url="http://www.ufoot.org/liquidwar/"
license=('GPL')
depends=('allegro4')
makedepends=('python2')
install=liquidwar.install
source=("http://www.ufoot.org/download/$pkgname/v5/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver-ovflfix.patch"
        "$pkgname-$pkgver-underlink.patch")
sha256sums=('32c52e4588e8e723f907ef43703b4ddf009e8ff1f29555c09bcc1f70bf5b93a3'
            '3e72162d8ff2a690b1f30736f16867bcab76f031040460d95ec0ef9c41df8452'
            '4187d94156d5adfba1f7ddeace9d35baf6c7a28bfbcac503ca7e246d580285ad')

prepare() {
  cd $pkgname-$pkgver

  patch -Np0 < ../$pkgname-$pkgver-ovflfix.patch
  patch -Np0 < ../$pkgname-$pkgver-underlink.patch

  sed 's|python |python2 |g' -i.bak doc/Makefile.in
}

build() {
  cd $pkgname-$pkgver
  [[ "$CARCH" != "i686" ]] && EXTRAOPTS="--disable-asm"
  PYTHON=yes ./configure --prefix=/usr $EXTRAOPTS
  make GAMEDIR=/usr/bin DATADIR=/usr/share/liquidwar
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" GAMEDIR=/usr/bin DATADIR=/usr/share/liquidwar install_nolink
}

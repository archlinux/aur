# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=liquidwar
pkgver=5.6.5
pkgrel=2
pkgdesc="A unique multiplayer wargame"
arch=('i686' 'x86_64')
url="https://www.ufoot.org/liquidwar/"
license=('GPL')
depends=('allegro4')
makedepends=('python2')
source=("http://www.ufoot.org/download/$pkgname/v5/$pkgver/$pkgname-$pkgver.tar.gz"
        "gcc10.patch"
        "doc.patch")
sha256sums=('dad0aa84dd416cad055421ed9b40df39efae78d3df759c0583c64c54f7f2ff5f'
            '0101b8df849f8b0767e0fb0f4e3eebcea8d00c272f7827c22573cee7e38d630a'
            '3bf4e9940a29e0401cb83eb064af5d80453b91914ec085b6bae1afcbd2ca50ff')

prepare() {
  cd $pkgname-$pkgver

  sed 's|EFENCE_LIBRARY)$|& -lm|g' -i src/Makefile.in
  sed 's|python |python2 |g' -i doc/Makefile.in
  patch -Np1 -i "${srcdir}/gcc10.patch"
  patch -Np1 -i "${srcdir}/doc.patch"
}

build() {
  cd $pkgname-$pkgver
  [[ "$CARCH" != "i686" ]] && EXTRAOPTS="--disable-asm"
  PYTHON=yes ./configure --prefix=/usr $EXTRAOPTS
  make GAMEDIR=/usr/bin DATADIR=/usr/share/liquidwar
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" \
    GAMEDIR=/usr/bin DATADIR=/usr/share/liquidwar install_nolink
}

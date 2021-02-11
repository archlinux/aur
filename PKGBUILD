# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Beej Jorgensen <beej@beej.us>
pkgname=umoria
pkgver=5.7.13
pkgrel=1
pkgdesc="Rogue-like dungeon crawler"
arch=('i686' 'x86_64')
url="https://umoria.org"
license=('GPL')
depends=('ncurses')
makedepends=('gzip' 'cmake')
backup=("usr/share/${pkgname}/files/scores")
source=(
  "${pkgname}-${pkgver}-aur.patch"
  ${pkgname}-${pkgver}.tar.gz::https://github.com/dungeons-of-moria/${pkgname}/archive/v${pkgver}.tar.gz
)
install=${pkgname}.install
sha512sums=('281275858ce39b5fe07f856e4e126f80fa6a864ada259d1d30c8d97e4dc853ffa6efa805bc1950ab2abd49d1cf0b4f54d60384ffa67f70fa93845628ece145e8'
            '3a577d9dded3e9a1d6e13e3ab4f87afc38549603e3510e4d778eef65d9251b2feb3f9718709e5f0b19a589259c1de6cc10f6d5eeeee057651fa920393d9ac985')

prepare() {
  cd "$srcdir/${pkgname}-$pkgver"
  patch -Np1 < ../${pkgname}-${pkgver}-aur.patch
}

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  cmake .
  make
}

package() {
  cd "$srcdir/${pkgname}-$pkgver/umoria"

  # binary
  install -D -m0755 umoria "${pkgdir}/usr/bin/umoria"

  # support files
  install -d -m0755 "${pkgdir}/usr/share/${pkgname}/data"
  install -m0644 data/* "${pkgdir}/usr/share/${pkgname}/data"
  install -m0664 scores.dat "${pkgdir}/usr/share/${pkgname}/data"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # set permissions on scores file (Uncomment below and change 666 > 664 to make games group exclusive)
  # chgrp games "${pkgdir}/usr/share/${pkgname}/data/scores.dat"
  chmod 666 "${pkgdir}/usr/share/${pkgname}/data/scores.dat"

}


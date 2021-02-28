# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Beej Jorgensen <beej@beej.us>
pkgname=umoria
pkgver=5.7.14
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
            '5c99ed314a29684d2fc18a1429fb7609553a78fd053eac8d61189e0af8c72777d481910153514dfe544a8939be24ed9725fc2b31e89e5d6e26f0b1df5ad4c3e0')

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


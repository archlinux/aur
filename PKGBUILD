# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Beej Jorgensen <beej@beej.us>
pkgname=umoria
pkgver=5.7.15
pkgrel=2
pkgdesc="Rogue-like dungeon crawler"
arch=('i686' 'x86_64')
url="https://umoria.org"
license=('GPL3')
depends=('ncurses')
makedepends=('gzip' 'cmake')
backup=("usr/share/${pkgname}/files/scores")
source=(
  "${pkgname}-${pkgver}-aur.patch"
  ${pkgname}-${pkgver}.tar.gz::https://github.com/dungeons-of-moria/${pkgname}/archive/v${pkgver}.tar.gz
)
install=${pkgname}.install
sha512sums=('a88a8924011a8ee6532052092badc06fc50ca8cb94e3eff5a4f94ca51d72e5360bec4090dbd612ca636360b46d9563b787ed835bf6fcf49acdf2125ee96c927f'
            '9ef9723eb120e5180640d8aa52073df638e506e0c842dac7173643bebfd84c51ec1fe6e2b1fa84ad1dcef29dc6607639e6a19ac4fd47000c6ba241691c1c720c')

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


# Maintainer: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Beej Jorgensen <beej@beej.us>
pkgname=umoria
pkgver=5.7.15
pkgrel=1
pkgdesc="Rogue-like dungeon crawler"
arch=('i686' 'x86_64')
url="https://umoria.org"
license=('GPL')
depends=('ncurses')
makedepends=('gzip' 'cmake' 'gcc10')
backup=("usr/share/${pkgname}/files/scores")
source=(
  "${pkgname}-${pkgver}-aur.patch"
  ${pkgname}-${pkgver}.tar.gz::https://github.com/dungeons-of-moria/${pkgname}/archive/v${pkgver}.tar.gz
)
install=${pkgname}.install
sha512sums=('5e5daf79b076b8784ee22bd1c18b901a9f837d32a617f1fef066c2985a426bd63854ba022d8cc759b9be0cde1d4c81ff3909a06213abee5bdfda16b0fb031f66'
            '9ef9723eb120e5180640d8aa52073df638e506e0c842dac7173643bebfd84c51ec1fe6e2b1fa84ad1dcef29dc6607639e6a19ac4fd47000c6ba241691c1c720c')

prepare() {
  cd "$srcdir/${pkgname}-$pkgver"
  patch -Np1 < ../${pkgname}-${pkgver}-aur.patch
}

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  export CC=$(which gcc-10)
  export CXX=$(which g++-10)
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


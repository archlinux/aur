# Maintainer: lea Chescotta <lea250183 at tutanota dot com>
# Contributor: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Beej Jorgensen <beej@beej.us>
pkgname=umoria-color
pkgver=5.8.2
pkgrel=1
pkgdesc="Rogue-like dungeon crawler color variant"
arch=('i686' 'x86_64')
url="https://andrew.cool/moria"
license=('GPL')
depends=('ncurses')
makedepends=('gzip' 'cmake')
backup=("usr/share/${pkgname}/files/scores")
source=(
  "${pkgname}-${pkgver}-aur.patch"
  ${pkgname}-${pkgver}.tar.gz::https://github.com/andrewtweber/${pkgname}/archive/v${pkgver}.tar.gz
)
install=${pkgname}.install
sha512sums=('a88a8924011a8ee6532052092badc06fc50ca8cb94e3eff5a4f94ca51d72e5360bec4090dbd612ca636360b46d9563b787ed835bf6fcf49acdf2125ee96c927f'
            'f7259a6a405418a716c05720abf69d6afc50922f6089751a12500c49d347ff1238a349618d5f3169e81122ef3b78dfa2c5bafda48aba06a2bed32fc824a4d2f3')

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
  install -D -m0755 umoria "${pkgdir}/usr/bin/umoria-color"

  # support files
  install -d -m0755 "${pkgdir}/usr/share/${pkgname}/data"
  install -m0644 data/* "${pkgdir}/usr/share/${pkgname}/data"
  install -m0664 scores.dat "${pkgdir}/usr/share/${pkgname}/data"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # set permissions on scores file (Uncomment below and change 666 > 664 to make games group exclusive)
  # chgrp games "${pkgdir}/usr/share/${pkgname}/data/scores.dat"
  chmod 666 "${pkgdir}/usr/share/${pkgname}/data/scores.dat"

}


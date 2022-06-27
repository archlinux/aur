# Maintainer: lea Chescotta <lea250183 at tutanota dot com>
# Contributor: Rojikku <RojikkuNoKami at gmail dot com>
# Contributor: Beej Jorgensen <beej@beej.us>
pkgname=umoria-color
pkgver=5.8.2
pkgrel=2
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
sha512sums=('35b1ebbb6c2b55795b9f86470a30bf3ff30d6d5926bcf34fef9f009cd08d9d2139a9c3479cfacf80a6a77c25843c592c85d11bebbb9628ca89d448baab0b4d39'
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


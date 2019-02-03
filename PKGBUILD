# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=umoria
pkgver=5.6
pkgrel=4
pkgdesc="Rogue-like dungeon crawler"
arch=('i686' 'x86_64')
url="http://free-moria.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'termcap')
makedepends=('gzip')
backup=("usr/share/${pkgname}/files/scores")
source=(
  "${pkgname}-${pkgver}-aur.patch"
  ${pkgname}-${pkgver}.tar.gz::https://github.com/HunterZ/${pkgname}/archive/${pkgver}.tar.gz
)
install=${pkgname}.install
sha512sums=('65c264ce47c24d428aa956865ec46b90eb343703cb80ed62b5eababe7329f4ee81f61a035a0cca0573b8537eab9bc41804bd66473d489821477e4c11cfba2bee'
            'd73fa55bc8609d1bb6727b59affb8f1461e6439d2f97de0b45e8f56e01d95a2b500ed4d86ac2690d831ff7e9492e604bcd3dcc47c253b44ab70d3f5da5457067')

prepare() {
  echo ">>>>>>> " $srcdir
  cd "$srcdir/${pkgname}-$pkgver"
  patch -Np1 < ../${pkgname}-${pkgver}-aur.patch

  cd source
  cp ../unix/* .
}

build() {
  cd "$srcdir/${pkgname}-$pkgver/source"
  make -f Makefile.unix
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  # binary
  install -D -m0755 source/moria "${pkgdir}/usr/bin/moria"

  # support files
  install -d -m0755 "${pkgdir}/usr/share/${pkgname}/files"
  install -m0644 files/* "${pkgdir}/usr/share/${pkgname}/files"

  # set permissions on scores file (must be in games group to use)
  chgrp games "${pkgdir}/usr/share/${pkgname}/files/scores"
  chmod 664 "${pkgdir}/usr/share/${pkgname}/files/scores"

  # documentation
  install -d -m0755 "${pkgdir}/usr/share/doc/${pkgname}/doc"
  install -m0644 doc/* "${pkgdir}/usr/share/doc/${pkgname}/doc"
  install -m0644 ChangeLog* "${pkgdir}/usr/share/doc/${pkgname}"
  install -m0644 ERRORS "${pkgdir}/usr/share/doc/${pkgname}"
  install -m0644 INSTALL "${pkgdir}/usr/share/doc/${pkgname}"
  install -m0644 README "${pkgdir}/usr/share/doc/${pkgname}"
  install -m0644 files/COPYING "${pkgdir}/usr/share/doc/${pkgname}"

  # man page
  install -d -m0755 "${pkgdir}/usr/share/man/man6"
  install -m0644 doc/moria.6 "${pkgdir}/usr/share/man/man6"
}

# vim:set ts=2 sw=2 et:

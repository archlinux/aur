# Maintainer: Beej Jorgensen <beej@beej.us>
# Contributor: Beej Jorgensen <beej@beej.us>

# I'm not sure what the canonical URL for Umoria 5.6 is.
# This source was originally from this URL:
# http://ftp.de.debian.org/debian/pool/main/m/moria/moria_5.6.orig.tar.gz
# but that has been mirrored at the location below for safe keeping.

pkgname=umoria
pkgver=5.6
pkgrel=2
pkgdesc="Rogue-like dungeon crawler"
arch=('i686' 'x86_64')
url="http://www-math.bgsu.edu/~grabine/moria.html"
license=('GPL3')
depends=('ncurses' 'termcap')
makedepends=('gzip')
backup=("usr/share/${pkgname}/files/scores")
source=(
  "${pkgname}-${pkgver}-aur.patch"
  "http://beej.us/moria/files/source/moria_${pkgver}.tar.gz"
)
install=${pkgname}.install
md5sums=('66beb16532261ce7967680bb205944d8'
         '09fd637948e3486730c88e8e15eb42fa')

prepare() {
  cd "$srcdir/moria-$pkgver"
  patch -Np1 < ../${pkgname}-${pkgver}-aur.patch

  cd source
  cp ../unix/* .
}

build() {
  cd "$srcdir/moria-$pkgver/source"
  make -f Makefile.unix
}

package() {
  cd "$srcdir/moria-$pkgver"

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

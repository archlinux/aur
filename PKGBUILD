# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
pkgname=emacspeak
pkgver=53.0
pkgrel=1
pkgdesc="Emacs extension that provides spoken output"
arch=('x86_64' 'aarch64')
url="http://emacspeak.sf.net/"
license=('GPL' 'LGPL' 'APACHE')
depends=(emacs
	 'tcl>=8.6'
	 'tclx'
	 'espeak')
optdepends=('python: Google client, and wrapper for Emacspeak speech servers.'
	 'openmotif')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/tvraman/emacspeak/archive/${pkgver}.tar.gz")
sha512sums=('6575b3d16a69d0189270597357c61b38151696cd22d001f7a0e092457ba16fd6d0c837c0df5b5330f3fc04ddf393d3d4cecdd045cc1376c5d9170b08843cd278')

prepare() {
  export DTK_PROGRAM="espeak"
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's|/etc/info-dir|$(DESTDIR)/etc/info-dir|g' info/Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make config -j1
  make
  # Espeak isn't compiled by default, but lots of folks use it.
  make espeak
}

package() {
  local d=$pkgdir/usr/share/emacs/site-lisp/emacspeak
  install -d -- "$d"
  cp -a "$srcdir/$pkgname-$pkgver/."  "$d"
  find "$d" \( -type d -or \( -type f -executable \) \) -execdir chmod 755 {} +
  find "$d" -type f -not -executable -execdir chmod 644 {} +

  # Add convenient wrapper to keep your configs unmodified
  local s=$pkgdir/usr/bin/emacspeak
  install -d -- "${s%/*}"
  printf '#!/bin/sh\nemacs -l '"'%s'"' "$@"\n' "${d#$pkgdir}/lisp/emacspeak-setup.elc" >"$s"
  chmod 755 "$s"
}

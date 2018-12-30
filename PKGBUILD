# Maintainer: erik-pro <aarnaarn2@gmail.com>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
pkgname=emacspeak
pkgver=49.0
pkgrel=1
pkgdesc="Emacs extension that provides spoken output"
arch=('x86_64')
url="http://emacspeak.sf.net/"
license=('GPL' 'LGPL' 'APACHE')
depends=(emacs
	 'tcl>=8.6'
	 'tclx'
	 'espeak')
optdepends=('python: Google client, and wrapper for Emacspeak speech servers.'
	 'openmotif')
source=("https://github.com/tvraman/emacspeak/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('24a73d020c434e539ac88ea2041898b6')

prepare() {
  export DTK_PROGRAM="espeak"
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's|/etc/info-dir|$(DESTDIR)/etc/info-dir|g' info/Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make config
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

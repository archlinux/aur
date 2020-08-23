# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
pkgname=emacspeak
pkgver=52.0
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
source=("https://github.com/tvraman/emacspeak/archive/${pkgver}.tar.gz")
sha512sums=('0949db2b45e75b339fd3e57a17a55db1c7da91edb38fb281f128dd5d6e0d7da3ab36a6378270f0af1d01de64aa18df0c3e978ba02b86194606270cae2481dc12')

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

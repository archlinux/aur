# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>

pkgname=emacspeak
pkgver=54.0
pkgrel=1
pkgdesc="Emacs extension that provides spoken output"
arch=('x86_64' 'aarch64')
url="http://emacspeak.sf.net/"
license=('GPL' 'LGPL' 'APACHE')
depends=('emacs' 'tcl' 'tclx' 'espeak-ng')
source=("https://github.com/tvraman/emacspeak/releases/download/${pkgver}/emacspeak-${pkgver}.tar.bz2")
sha512sums=('088b8d08258202e5cc12ad1e2a56eabe27e626157201f4b665da78f7f4f03ea858746131d5c27a261049283a35eeb0fd5bb47aa054acac8a9b65a32da39a2f35')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export DTK_PROGRAM="espeak"
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

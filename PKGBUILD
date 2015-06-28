# Maintainer: Steve Holmes <steve.holmes88@gmail.com>
# Contributers: Chris Brannon <cmbrannon79@gmail.com>
pkgname=emacspeak
pkgver=42.0
pkgrel=1
pkgdesc="Emacs extension that provides spoken output"
arch=('i686' 'x86_64')
url="http://emacspeak.sf.net/"
license=('GPL' 'LGPL' 'APACHE')
depends=(emacs
	 'tcl>=8.6'
	 'tcl<8.7'
	 'tclx'
	 'espeak')
optdepends=('eflite: software speech via the FLite TTS engine'
            'python: Google client, and wrapper for Emacspeak speech servers.')
install='emacspeak.install'
source=("https://github.com/tvraman/emacspeak/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('cbf0fb61180120d6eb18af572dae4606')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's|/etc/info-dir|$(DESTDIR)/etc/info-dir|g' info/Makefile
  rm -f lisp/g-client/*.elc
  rm -f sounds/default-8k/*.elc
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make config
  make

  # This one isn't compiled by default, but a lot of folks use it.
  cd servers/linux-espeak
  make TCL_VERSION=8.6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/etc"
  make DESTDIR="$pkgdir" install
  cd servers/linux-espeak
  make DESTDIR="$pkgdir" install
  # Interestingly, the source files are installed under DESTDIR.
  cd "$pkgdir/usr/share/emacs/site-lisp/emacspeak/servers/linux-espeak"
  rm -f tclespeak.cpp Makefile
  # A handful of files have permissions of 750 and 640; fix.
  cd "$pkgdir"
  find . -perm 640 -print0
  find . -perm 750 -print0
  gzip -9nf "${pkgdir}"/usr/share/info/*
  rm -f "$pkgdir/usr/share/info/dir"
  rm -f "$pkgdir/etc/info-dir"
}


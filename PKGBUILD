# Maintainer: Steve Holmes <steve.holmes88@gmail.com>
# Contributors: Chris Brannon <cmbrannon79@gmail.com>
pkgname=emacspeak-git
pkgver=r10930.29aded1
pkgrel=1
pkgdesc="Emacs extension that provides spoken output"
arch=(i686 x86_64)
url="http://emacspeak.sourceforge.net/"
license=('GPL' 'custom')
depends=('emacs' 'tcl>=8.6' 'tcl<8.7' 'tclx' 'espeak')
optdepends=(  'eflite: software speech via the FLite TTS engine')
makedepends=('git')
provides=(emacspeak)
conflicts=(emacspeak)
install='emacspeak-git.install'
source=(${pkgname}::'git://github.com/tvraman/emacspeak.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${pkgname}
  sed -i -e 's, /etc/info-dir, $(DESTDIR)$(infodir)/dir,g;s, $(infodir)/, $(DESTDIR)$(infodir)/,' info/Makefile
}

build() {
  cd ${srcdir}/${pkgname}
  make config
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make prefix="${pkgdir}/usr" install
  # Espeak isn't compiled by default, but lots of folks use it.
  cd "$pkgdir/usr/share/emacs/site-lisp/emacspeak/servers/linux-espeak"
  make TCL_VERSION=8.6
  rm -f tclespeak.cpp Makefile
  # A handful of files have permissions of 750 and 640; fix.
  #cd ${pkgdir}
  #find . -perm 640 -print0
  #find . -perm 750 -print0
  gzip -9nf ${pkgdir}/usr/share/info/*
  rm -f "$pkgdir/usr/share/info/dir"
}


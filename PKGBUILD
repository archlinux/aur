# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=ascd
pkgver=0.13.2
pkgrel=1
pkgdesc="A CD play that can be docked with Afterstep and Window Maker"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/ascd"
license=('GPL')
depends=('libxpm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}+lib-src.tgz")
md5sums=('SKIP')

prepare() {
  cd ${pkgname}-${pkgver}+lib-src
  sed -i -e 's,bytesex.h,cdio/bytesex.h,;t' \
    ascd/workman/wm_cdda.h \
    libworkman/include/wm_cdda.h
  sed -i -e '/InstallMultiple/s,(THEMESDIR),(THEMESDIR)/themes-manual.ps.gz,;t' \
    ascd/Imakefile
  sed -i -e '/^install::/,$s,\$(THEMESDIR),$(DESTDIR)/$(THEMESDIR),' \
    ascd/Imakefile
  sed -i -e 's,read CDD,CDD="",;t' \
    ascd/configure
  sed -i -e 's,read BINDIR,BINDIR="/usr/bin",;t' \
    ascd/configure
  sed -i -e 's,read MANDIR,MANDIR="/usr/share/man/man1",;t' \
    ascd/configure
  sed -i -e 's,read THDIR,THDIR="/usr/share/AScd",;t' \
    ascd/configure
  sed -i -e 's,read WINGS,WINGS="2",;t' \
    ascd/configure
  ./configure
}

build() {
  cd ${pkgname}-${pkgver}+lib-src
  make CCOPTIONS="-fPIC" EXTRA_INCLUDES="-I."
}

package() {
  cd ${pkgname}-${pkgver}+lib-src
  make DESTDIR="$pkgdir" install install.man
  cd libworkman
  make LIBDIR="/usr/lib" DESTDIR="$pkgdir" install
  chown -R root.root "$pkgdir/usr/share/AScd"
}

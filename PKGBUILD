# Contributor: Alessandro Pezzoni <alessandro_pezzoni@lavabit.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ghostscript-git
pkgver=20160426
pkgrel=1
pkgdesc="An interpreter for the PostScript language"
arch=('i686' 'x86_64')
license=('AGPL' 'custom')
depends=('gtk3' 'libxt' 'libcups' 'fontconfig' 'jasper' 'libpaper')
makedepends=('gnutls')
optdepends=('texlive-core: needed for dvipdf'
            'gdk-pixbuf2: needed for gsx')
url="http://www.ghostscript.com/"
provides=('ghostscript=9.18')
conflicts=('ghostscript')
options=('!libtool' '!makeflags')
source=('git://git.ghostscript.com/ghostpdl.git')
md5sums=('SKIP')
_gitname=ghostpdl

pkgver() {
  cd "$_gitname"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd "$_gitname"
  rm -rf jpeg jasper lcms freetype 
  
  # Fix compilation error
  sed -i "s:AM_PROG_CC_STDC:AC_PROG_CC:g" configure.ac
  ./autogen.sh --enable-dynamic \
	--with-ijs \
	--with-jbig2dec \
	--with-omni \
	--with-x \
	--with-drivers=ALL \
	--with-fontpath=/usr/share/fonts/Type1:/usr/share/fonts \
	--enable-fontconfig \
	--enable-freetype \
	--without-luratech \
	--without-omni \
	--with-system-libtiff \
	--disable-compile-inits #--help # needed for linking with system-zlib

  ./configure --prefix=/usr 
  make
}

package() {
  cd "$_gitname"
  make DESTDIR=${pkgdir} \
	cups_serverroot=${pkgdir}/etc/cups \
	cups_serverbin=${pkgdir}/usr/lib/cups install soinstall

  # install missing doc files # http://bugs.archlinux.org/task/18023
  mkdir -p ${pkgdir}/usr/share/ghostscript/doc/
  install -m 644 ${srcdir}/$_gitname/doc/{gs-vms.hlp,gsdoc.el,pscet_status.txt} ${pkgdir}/usr/share/ghostscript/doc/
  
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

  # remove unwanted localized man-pages
  rm -rf $pkgdir/usr/share/man/[^man1]*
}

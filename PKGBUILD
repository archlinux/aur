# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=gutenprint-cvs
pkgver=20120525
pkgrel=1
pkgdesc="Top quality printer drivers for POSIX systems"
arch=('i686' 'x86_64')
license=('GPL')
install=gutenprint.install
depends=('readline' 'gnutls>=2.12.3') # needs to be checked. build log says -Lgnutls but namcap doesn't detect it
makedepends=('gimp>=2.6.11' 'gtk2>=2.24.4' 'cups>=1.4.6' 'foomatic-db-engine' 'ghostscript>=9.02' 'cvs')
optdepends=('cups:		to use cups printer spooler(recommended)'
            'foomatic-db-engine:	to use foomatic spooler'
            'ghostscript:	adds postscript support for ijsgutenprint'
            'gimp:		adds gutenprint plugin to gimp')
source=('http://downloads.sourceforge.net/gimp-print/gutenprint-5.2.7.tar.bz2' 'buildfix.patch')
url='http://gimp-print.sourceforge.net/'
provides=('gutenprint')
conflicts=('gutenprint')
replaces=('gimp-print')
options=('!libtool' '!emptydirs')
noextract=('gutenprint-5.2.7.tar.bz2')
md5sums=('b19029972bf28f6efd693270daf8f5de'
         '2354cdecf1fbab32eca84266c8c72e7d')

_cvsroot=':pserver:anonymous:@gimp-print.cvs.sourceforge.net:/cvsroot/gimp-print'
_cvsmod='gimp-print'

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  patch -Np1 -i "${srcdir}/buildfix.patch"
  # We extract the precompiled documentation from the latest release because there is currently no easy way to run db2html on Arch.
  tar -xjf "${srcdir}/gutenprint-5.2.7.tar.bz2" --strip-components 1 'gutenprint-5.2.7/doc/developer'
  ./autogen.sh
  ./configure --prefix=/usr --disable-samples --with-cups --with-gimp2 \
	--disable-translated-cups-ppds --with-gimp2-as-gutenprint \
	--disable-libgutenprintui  --enable-libgutenprintui2 --disable-gtktest \
	--enable-cups-ppds --enable-cups-ppds-at-top-level \
	--with-foomatic --with-foomatic3 --with-ghostscript \
	--disable-static --disable-static-genppd --with-ijs \
	--disable-globalized-cups-ppds
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

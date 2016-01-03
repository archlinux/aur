# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Johnny Santisteban <xplode53@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=gutenprint-cvs
_docname=gutenprint
pkgver=20160102
_docver='5.2.10'
pkgrel=1
pkgdesc="Top quality printer drivers for POSIX systems (cvs version)"
arch=('i686' 'x86_64')
license=('GPL')
install=gutenprint.install
depends=('glibc')
makedepends=('cvs' 'gimp' 'gtk2' 'cups' 'foomatic-db-engine' 'ghostscript')
optdepends=('cups:		to use cups printer spooler(recommended)'
            'foomatic-db-engine:	to use foomatic spooler'
            'ghostscript:	adds postscript support for ijsgutenprint'
            'gimp:		adds gutenprint plugin to gimp'
            'libusb:  required for drivers that depend on gutenprint52usb backend')
source=("http://downloads.sourceforge.net/gimp-print/${_docname}-${_docver}.tar.bz2"
        'configure_ac.patch' 'usr_sbin.patch' 'm4extra.patch')
url='http://gimp-print.sourceforge.net/'
provides=('gutenprint')
conflicts=('gutenprint')
replaces=('gimp-print')
options=('!emptydirs')
noextract=("${_docname}-${_docver}.tar.bz2")
sha256sums=('431f352b412dfb9809d126a85a37a1fcd1c1826275ace8cdcd4fd9a6ee360e59'
            '041690da1d414e82297fc9bb8a1395cf133e198123c73572c69d932173343768'
            '05e551713e2a0853535bee30dce71e384ece26ae69faffc61859089192cbddf2'
            '0761ab979e0e352cd2702db36af4cbb19dc0553031023874c13f37c6d0ea82c0')

_cvsroot=':pserver:anonymous:@gimp-print.cvs.sourceforge.net:/cvsroot/gimp-print'
_cvsmod='gimp-print'

pkgver() {
  date +%Y%m%d
}

prepare() {
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

  patch -Np1 -i "${srcdir}/configure_ac.patch"
  patch -Np1 -i "${srcdir}/usr_sbin.patch"
  patch -Np1 -i "${srcdir}/m4extra.patch"

  # We extract the precompiled documentation from the latest release because there is currently no easy way to run db2html on Arch.
  tar -xjf "${srcdir}/${_docname}-${_docver}.tar.bz2" --strip-components 1 "${_docname}-${_docver}/doc/developer"
}

build() {
  cd "$srcdir/$_cvsmod-build"

  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-samples \
    --enable-cups-ppds \
    --enable-cups-ppds-at-top-level \
    --disable-translated-cups-ppds \
    --disable-globalized-cups-ppds \
    --disable-static \
    --disable-static-genppd
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

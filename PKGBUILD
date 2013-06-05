# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=gutenprint-cvs
_docname=gutenprint
pkgver=20130605
_docver='5.2.9'
pkgrel=1
pkgdesc="Top quality printer drivers for POSIX systems (cvs version)"
arch=('i686' 'x86_64')
license=('GPL')
install=gutenprint.install
depends=('glibc')
makedepends=('gimp' 'gtk2' 'cups' 'foomatic-db-engine' 'ghostscript')
optdepends=('cups:		to use cups printer spooler(recommended)'
            'foomatic-db-engine:	to use foomatic spooler'
            'ghostscript:	adds postscript support for ijsgutenprint'
            'gimp:		adds gutenprint plugin to gimp')
source=("http://downloads.sourceforge.net/gimp-print/${_docname}-${_docver}.tar.bz2"
        'configure_ac.patch' 'usr_sbin.patch')
url='http://gimp-print.sourceforge.net/'
provides=('gutenprint')
conflicts=('gutenprint')
replaces=('gimp-print')
options=('!libtool' '!emptydirs')
noextract=("${_docname}-${_docver}.tar.bz2")
sha256sums=('4b27e4f06f32d30271df89ecb6089bb11bcf2caec5f60b0909e083095354bca0'
            '041690da1d414e82297fc9bb8a1395cf133e198123c73572c69d932173343768'
            'a232a39e30986426dc34c39092a4c15ede5bac653765801ccf76b2532136171a')

_cvsroot=':pserver:anonymous:@gimp-print.cvs.sourceforge.net:/cvsroot/gimp-print'
_cvsmod='gimp-print'

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

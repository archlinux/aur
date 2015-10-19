# Mantainer: Franco Tortoriello

pkgname=openglide-cvs
pkgver=20130713
pkgrel=1
pkgdesc="Glide wrapper, useful for DOSBox with Glide support"
arch=(i686 x86_64)
url="http://openglide.sourceforge.net"
license=(GPL)
options=(!libtool)
depends=(mesa sdl glu libsm)
makedepends=(cvs)
source=(# patch from http://www.vogons.org/viewtopic.php?t=26313
	glide-highres.patch::http://www.vogons.org/download/file.php?id=8212)
md5sums=('13e7e2c25aee886705585a4ac7ac763d')

_cvsroot="anonymous:@openglide.cvs.sourceforge.net:/cvsroot/openglide"
_cvsmod="openglide"

pkgver() {
  date +"%Y%m%d"
}

prepare() {
  cd "$srcdir"

  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d:pserver:$_cvsroot co -f $_cvsmod
  fi

  msg "CVS checkout done or server timeout"

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  sed -e '/install-data-hook/,/$p/d' -i Makefile.am
  # Fix autoconf files
  sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' \
      -i configure.ac
  sed -e '/INCLUDES/d' -i Makefile.am

  patch -p0 -i "$srcdir/glide-highres.patch"
}

build() {
  cd "$srcdir/$_cvsmod-build"

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir" install
}


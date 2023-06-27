# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tino Reichardt <milky-archlinux@mcmilk.de>

pkgname=dietlibc-cvs
pkgver=20150317
pkgrel=1
pkgdesc="a libc optimized for small size"
arch=('i686' 'x86_64')
url="https://www.fefe.de/dietlibc/"
license=("GPL")
options=('staticlibs')
makedepends=('cvs')
provides=(dietlibc)
conflicts=(dietlibc)

_cvsroot=":pserver:cvs@cvs.fefe.de:/cvs"
_cvsmod="dietlibc"


pkgver() { date --iso-8601|tr -d - ; }

prepare() {
	cd $srcdir
		msg "getting $_cvsmod from $_cvsroot ..."
	if [ -d $_cvsmod/CVS ]; then
		cd $_cvsmod
		cvs -z9 update -d
	else
		cvs -d $_cvsroot -z9 co $_cvsmod
	fi
}

build() {
  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/diet/bin/diet "$pkgdir/usr/bin/diet"
}

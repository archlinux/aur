# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# This PKGBUILD is inspired from the package sdcc in Archlinux repos.

pkgname=sdcc-svn
pkgver=3.4.1.svn9120
pkgrel=1
pkgdesc="Small Device C Compiler suite"
url="http://sdcc.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')

provides=('sdcc')
conflicts=('sdcc')
depends=('bash' 'gcc-libs' 'boost-libs')
makedepends=('gputils' 'flex' 'bison' 'patch' 'boost')
optdepends=('python')

options=(!strip staticlibs)
source=('sdcc::svn://svn.code.sf.net/p/sdcc/code/trunk')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/sdcc/sdcc"

	local _sdccver=`cat ./.version`
	local _svnver="$(svnversion)"

	echo "$_sdccver.svn$_svnver"
}

prepare() {
	cd "$srcdir/sdcc/sdcc"
	# Note: optim is required, otherwise compilation fails
	sed -i 's|CC -E|CC -O2 -E|g' support/sdbinutils/libiberty/configure
}

build() {
	cd "$srcdir/sdcc/sdcc"

	./configure \
		--prefix=/usr \
		--includedir=/usr/include/sdcc \
		--libdir=/usr/lib/sdcc \
		--disable-werror \
		#--enable-avr-port --enable-xa51-port  # Optional: activate non-free targets

	make
}

package() {
  cd "$srcdir/sdcc/sdcc"

  make DESTDIR="$pkgdir" install

  if [ -d "$pkgdir"/usr/lib/lib ]; then
    mv "$pkgdir"/usr/lib/lib/* "$pkgdir"/usr/lib/sdcc/
    rm -rf "$pkgdir"/usr/lib/lib
  fi

  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python3|' "$pkgdir"/usr/bin/as2gbmap
}

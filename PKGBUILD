# Maintainer: éclairevoyant
# Contributor: Jan de Groot <jgc at archlinux dot org>
# Contributor: Ben <ben at benmazer dot net>

pkgname=gmime
pkgver=3.2.13
pkgrel=1
pkgdesc="C/C++ MIME creation and parser library for S/MIME, PGP, and Unix mbox spools"
arch=(x86_64)
license=(GPL)
url="https://github.com/jstedfast/$pkgname"
depends=(glib2 glibc gpgme libidn2 zlib)
makedepends=(gtk-sharp-2 gobject-introspection gtk-doc git vala docbook-utils)
source=("git+$url.git#commit=da1b041a2ce7e5e5c9d2c3e9499fe71b7a84d222")
b2sums=('SKIP')

prepare() {
	cd $pkgname
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	# get rid of the .wapi errors in fakeroot
	mkdir weird
	export MONO_SHARED_DIR="$PWD/weird"

	cd $pkgname

	./configure --prefix=/usr \
		--program-prefix=$pkgname \
		--enable-gtk-doc \
		--enable-mono \
		--enable-smime \
		--disable-static

	sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
	make -C $pkgname DESTDIR="$pkgdir" install
}

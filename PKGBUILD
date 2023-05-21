# Maintainer: éclairevoyant
# Contributor: Jan de Groot <jgc at archlinux dot org>
# Contributor: Ben <ben at benmazer dot net>

pkgname=gmime
pkgver=2.6.23+4+g91dcee38
pkgrel=1
epoch=1
pkgdesc="C/C++ MIME creation and parser library (v2) for S/MIME, PGP, and Unix mbox spools"
arch=(x86_64)
license=(GPL)
url="https://github.com/jstedfast/$pkgname"
depends=(glib2 gpgme zlib)
makedepends=(gtk-sharp-2 gobject-introspection gtk-doc git vala docbook-utils)
_commit=91dcee38ea301463fb9c6bc936f08b9fd1c0969f  # gmime-2-6
source=("git+https://github.com/jstedfast/gmime#commit=$_commit"
        0001-Avoid-non-UTF-8-code.patch)
b2sums=('SKIP'
        '29b3b3620ac2f5945f55bb96add829a843b63e79422df4b36f8964b9bd8c86ca2d41224142be06845221cb57fc8c87d0aeed34baefb7b83ade7e8dde8d8c9811')

pkgver() {
	git -C $pkgname describe --tags | sed 's/-/+/g'
}

prepare() {
	cd $pkgname
	patch -Np1 -i ../0001-Avoid-non-UTF-8-code.patch
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

	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make
}

package() {
	make -C $pkgname DESTDIR="$pkgdir" install
}

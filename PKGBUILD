# Maintainer: pounceandmiss <pounceandmiss@proton.me>
# Contributor: Uwe Koloska <kolewu [at] koloro [dot] de>
# Contributor: Dejan Cabrilo <dcabrilo [at] bitspan [dot] rs>
#
# Based on the AUR tdom PKGBUILD.
#
# tDOM built against tcl9, installed into its prefix (/usr/lib/tcl9).

pkgname=tcl9-tdom
_pkgname=tdom
pkgver=0.9.6
pkgrel=1
pkgdesc='A fast XML/DOM/XPath package for Tcl written in C (for tcl9)'
arch=(x86_64)
url='https://tdom.org'
license=(MPL-2.0)
depends=(tcl9 gumbo-parser)
options=(staticlibs !lto)
_archive="$_pkgname-$pkgver-src"
source=("https://tdom.org/downloads/$_archive.tgz")
sha256sums=('6d24734aef46d1dc16f3476685414794d6a4e65f48079e1029374477104e8319')

_prefix=/usr/lib/tcl9

build() {
	cd "$_archive"
	./configure \
		--prefix=$_prefix \
		--with-tcl=$_prefix/lib \
		--enable-64bit \
		--enable-html5
	make
}

check() {
	cd "$_archive"
	make test
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	# rm empty directory
	rmdir "$pkgdir$_prefix/bin"

	# remove buildroot traces
	sed -e "s#$srcdir/$_archive#$_prefix/lib/$_pkgname$pkgver#g" \
		-i "$pkgdir$_prefix/lib/tdomConfig.sh"
}

# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
# Contributor: relrel <relrelbachar@gmail.com>
pkgname=nbc
_ver=1.2.1
_rev=r4
pkgver=$_ver.$_rev
pkgrel=6
pkgdesc="Next Byte Codes (NBC) compiler for the LEGO Mindstorms NXT programmable brick"
arch=('i686' 'x86_64')
url="http://bricxcc.sourceforge.net/nbc/"
license=('MPL')
depends=(libusb-compat)
makedepends=(fpc)
source=("https://sourceforge.net/projects/bricxcc/files/NBC_NXC/NBC%20release%20$_ver%20$_rev/$pkgname-$pkgver.src.tgz"
        "https://sourceforge.net/projects/bricxcc/files/NBC_NXC/NBC%20release%20$_ver%20$_rev/$pkgname-$pkgver.tgz"
        "$pkgname.patch")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('32e6d19bd6a22abca0cb299c7032eae7fff5ba509037d942441ac657570a05d48342bab0b986631e508fdd9fdbff0531f60ac25c2de0d6cc77b755fe288bb7b6'
            'b68ae5d73e6303c1778b1360f52717445952e5f6d5f8ef2901cb4b78341baffdc47b11f2a04f7f3c84a293b36250e8f21d1c362b6551ad34703b0ccaaf39e930'
            'e2e038464550898f033ad766f56798f93c61b0d3571cc129834e21bc41effe5a92a99fc13fcfe4f88cbed5858651c32b111848c6b2fe07e1fd358a357124d7b4')

prepare() {
	# For some reason doc/nbc.1 is missing from r4, but it exists in the binary release
	tar -C "$srcdir/" -xzf "$srcdir/$pkgname-$pkgver.tgz" "doc/$pkgname.1"

	# Fix dependencies in nbcunix.mak to allow parallel compilation
	patch -Np1 < "$pkgname.patch"
}

build() {
	make -C "$srcdir/NXT/" -f nbcunix.mak
}

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/NXT/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/doc/"{Readme,Changelog}
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" "$srcdir/doc/$pkgname.1"
}

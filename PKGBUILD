# Maintainer: Denilson Sá <denilsonsa@gmail.com>

# TODO: Add means to let the user provide their own cc-lynx.dac and cc-ms.dac.
# TODO: It seems CCLP2 is missing the sets/*.dac files.

pkgname=tworld
pkgver=1.3.2
pkgrel=1
pkgdesc="Tile World is an emulation of the game Chip's Challenge. This package includes many fan-made level packs."
arch=('x86_64')
url="https://www.muppetlabs.com/~breadbox/software/tworld/"
license=('GPL2')
depends=('sdl')
source=(
	"http://www.muppetlabs.com/~breadbox/pub/software/tworld/$pkgname-$pkgver-CCLPs.tar.gz"
	"https://bitbusters.club/cclp4/CCLP4.zip"
	"makefile-destdir-1.3.2.patch"
	"$pkgname.desktop"
)
sha512sums=(
	"395b1ddbe9df568243d2e8b78704732dbbe931a5b2ea2af63ebc4e93394c5715e58891a3e1f536f785062cb44ba4540538544b3ed10910d9f30843452a26b803"
	"0bb4a6a769c4f2962de9540c72f8326c067a27be88159666f82ba7a98e086ce8aced9752bdb2143889943f851b466c86b9a92e90cd6c0ca564c7e1eb2eb94a81"
	"a506370349088199866061fd14824f7eb8efe7ba24d1d4fcc1606b5b5fed5e3b2121195e0faa40d7f434b9d92810fdd517ac0e3862c3ad7317f02be6d9a6e0ed"
	"951e705063c5a10f606302d26418ab5574c3a83bbfc412e35a19f475932abe49cac03cdd76bf4ad7ef22025f8576060f198b58ee3cd48325cf2f218f343a71c9"
)

prepare() {
	mv -i CCLP4/data/*  "$pkgname-$pkgver/data/"
	mv -i CCLP4/sets/*  "$pkgname-$pkgver/sets/"
	mv -i CCLP4/*.html  "$pkgname-$pkgver/CCLPs/"
	mv -i CCLP4/cclp4res  "$pkgname-$pkgver/CCLPs/"
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/makefile-destdir-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname.desktop" "$pkgdir/usr/share/applications/"

	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	cp -p docs/tworld.html "$pkgdir/usr/share/doc/$pkgname/"
	cp -pr CCLPs/* "$pkgdir/usr/share/doc/$pkgname/"
}

# Maintainer: Denilson Sá <denilsonsa@gmail.com>

# TODO: Add means to let the user provide their own cc-lynx.dac and cc-ms.dac.

pkgname=tworld
pkgver=1.3.2
pkgrel=2
pkgdesc="Tile World is an emulation of the game Chip's Challenge. This package includes many fan-made level packs."
arch=('x86_64')
url="https://www.muppetlabs.com/~breadbox/software/tworld/"
license=('GPL2')
depends=('sdl')
source=(
	"http://www.muppetlabs.com/~breadbox/pub/software/tworld/$pkgname-$pkgver-CCLPs.tar.gz"
	"CCLXP2.zip::https://forum.bitbusters.club/attachment.php?aid=783"
	"https://bitbusters.club/cclp4/CCLP4.zip"
	"makefile-destdir-1.3.2.patch"
	"$pkgname.desktop"
	"CCLP2-MS.dac"
)
sha512sums=(
	"395b1ddbe9df568243d2e8b78704732dbbe931a5b2ea2af63ebc4e93394c5715e58891a3e1f536f785062cb44ba4540538544b3ed10910d9f30843452a26b803"
	"d840f43e521972b9f8d20f3a0b2fa5c16354647b33417093700afa1875bbfaaf7494d9a71e5d48b92f7b82338b7d09d63fc0e78dae768ee92027db796c6ce10c"
	"0bb4a6a769c4f2962de9540c72f8326c067a27be88159666f82ba7a98e086ce8aced9752bdb2143889943f851b466c86b9a92e90cd6c0ca564c7e1eb2eb94a81"
	"a506370349088199866061fd14824f7eb8efe7ba24d1d4fcc1606b5b5fed5e3b2121195e0faa40d7f434b9d92810fdd517ac0e3862c3ad7317f02be6d9a6e0ed"
	"951e705063c5a10f606302d26418ab5574c3a83bbfc412e35a19f475932abe49cac03cdd76bf4ad7ef22025f8576060f198b58ee3cd48325cf2f218f343a71c9"
	"8f9900d77b653cebea7c3b3625d6f71908719acc8acaeb4efd985f8bc32119f550498e487a4fd37c7cf23d5d4aa791c7530797c9862077a9587e0a21c57b6573"
)

prepare() {
	mv CCLP2-MS.dac   "$pkgname-$pkgver/sets/"
	mv data/CCLXP2*   "$pkgname-$pkgver/data/"
	mv sets/CCLXP2*   "$pkgname-$pkgver/sets/"
	mv "CCLXP2 readme.txt" "$pkgname-$pkgver/CCLPs/"
	mv CCLP4/data/*   "$pkgname-$pkgver/data/"
	mv CCLP4/sets/*   "$pkgname-$pkgver/sets/"
	mv CCLP4/*.html   "$pkgname-$pkgver/CCLPs/"
	mv CCLP4/cclp4res "$pkgname-$pkgver/CCLPs/"
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

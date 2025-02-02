# Maintainer: Jenrikku (JkKU)
pkgname=narc-cli
_reponame=NARC-CLI
pkgver=1.0.2
pkgrel=1
_narcsharpcommit=5654376
_narcsharpref=5654376ffe4950a9d08dab83710a096fce1bf4ba
pkgdesc="A quick NARC cli app for reading, modifying and creating NARC files"
arch=('x86_64')
url="https://github.com/Jenrikku/NARC-CLI"
license=('BSD-3-Clause')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk-9.0')
optdepends=()
options=('!strip')
source=("$_reponame-$pkgver.tar.gz::https://github.com/Jenrikku/NARC-CLI/archive/refs/tags/$pkgver.tar.gz"
        "NARCSharp-$_narcsharpref.tar.gz::https://api.github.com/repos/Jenrikku/NARCSharp/tarball/$_narcsharpref")
sha256sums=('1a1395bce13b0c43e0e7e68c5d8a13e2dbbaff354a6bee1966c907a05c2673a6'
            '6354e1293d7e1b4ef66a09d4c21369cab14809820785ff291110349916634c63')

prepare() {
	cp -rT "Jenrikku-NARCSharp-$_narcsharpcommit" "$_reponame-$pkgver/NARCSharp"
}

build() {
	cd "$_reponame-$pkgver"
	dotnet publish -c Release -r linux-x64
}

package() {
	install -dm755 "$pkgdir/usr/share/narc-cli"
	install -dm755 "$pkgdir/usr/bin"

	cp -r "$_reponame-$pkgver/$_reponame/bin/Release/net9.0/linux-x64/publish/"* "$pkgdir/usr/share/narc-cli"
	rm "$pkgdir/usr/share/narc-cli/"*.pdb
	chmod 755 "$pkgdir/usr/share/narc-cli/narc"

	ln -s "/usr/share/narc-cli/narc" "$pkgdir/usr/bin/narc"
}

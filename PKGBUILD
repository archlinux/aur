# Maintainer: Jenrikku (JkKU)
pkgname=narc-cli
_reponame=NARC-CLI
pkgver=1.0.0
pkgrel=1
_narcsharpcommit=144c671
_narcsharpref=144c6713498262b60092cee513cb648a4fce6840
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
sha256sums=('b612615925c3ac660d9554a8e5bf0ef690688065b635e737b9c2cc506b17c428'
            '1368fa9d01a6dbde0f0e362ba0a61109b39a463606ada65fe9c8e496e271f421')

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

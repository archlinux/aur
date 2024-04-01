# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# This PKGBUILD is heavily inspired by the bash-language-server PKGBUILD
pkgname=awk-language-server
pkgver=0.10.5
pkgrel=1
pkgdesc='Language server for the AWK programming language'
arch=(any)
url="https://github.com/Beaglefoot/awk-language-server"
license=(MIT)
depends=('nodejs')
makedepends=(jq yarn typescript)
_commit=55bfe7a07ba1e282b2f9cbc23173246ae9d6596c/
source=("$pkgname-$pkgver.zip::$url/archive/_commit.zip")
sha256sums=('697cf54e371baefe416212707921e1cb4d54a20b536afa7b563e0641d2a24d61')

build() {
	cd "$pkgname-$_commit"
	yarn --frozen-lockfile
	yarn run build:server
}

package() {
	cd "$pkgname-$_commit/server"

	# Emulate `npm prune --production`
	cp package.json{,.bak}
	read -ra devDependencies < <(jq -r '.devDependencies | keys | join(" ")' package.json)
	yarn remove --frozen-lockfile "${devDependencies[@]}"
	mv package.json{.bak,}

	install -d "$pkgdir/usr/lib/$pkgname"
	cd "$pkgdir/usr/lib/$pkgname"
	cp -a "$srcdir/$pkgname-$_commit/server/"* .
	chmod +x out/cli.js

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname-$_commit/LICENSE"

	install -d "$pkgdir/usr/bin"
	ln -s "/usr/lib/$pkgname/out/cli.js" "$pkgdir/usr/bin/$pkgname"
}

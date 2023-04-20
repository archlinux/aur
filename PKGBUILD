# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# This PKGBUILD is heavily inspired by the bash-language-server PKGBUILD
pkgname=awk-language-server
pkgver=0.10.0
pkgrel=1
pkgdesc='Language server for the AWK programming language'
arch=(any)
url="https://github.com/Beaglefoot/awk-language-server"
license=(MIT)
depends=(nodejs)
makedepends=(jq yarn typescript)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/server-$pkgver.tar.gz")
sha256sums=('e61b5e6af5cda2959b5927a5ae5adad890df24337a6d869efe4922f500a842ea')

build() {
	cd "$pkgname-server-$pkgver"
	yarn --frozen-lockfile
	yarn run build:server
}

package() {
	cd "$pkgname-server-$pkgver/server"

	# Emulate `npm prune --production`
	cp package.json{,.bak}
	read -ra devDependencies < <(jq -r '.devDependencies | keys | join(" ")' package.json)
	yarn remove --frozen-lockfile "${devDependencies[@]}"
	mv package.json{.bak,}

	install -d "$pkgdir/usr/lib/$pkgname"
	cd "$pkgdir/usr/lib/$pkgname"
	cp -a "$srcdir/$pkgname-server-$pkgver/server/"* .
	chmod +x out/cli.js

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname-server-$pkgver/LICENSE"

	install -d "$pkgdir/usr/bin"
	ln -s "/usr/lib/$pkgname/out/cli.js" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=apg-js
pkgname=nodejs-"$_npmname"
pkgver=4.3.0
pkgrel=2
pkgdesc='an ABNF parser generator creating recursive-descent parsers from a superset of ABNF'
arch=(any)
url="https://github.com/ldthomas/$_npmname"
license=(BSD-2-Clause)
depends=(nodejs)
makedepends=(jq
             moreutils
             npm)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('322bfadc66788f3c48e654dcb85ab31c5cfefa3d9d069db0edeae3452c8c06e2')
noextract=("${source[@]##*/}")

package() {
	npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +
	find "$pkgdir" -type f -name package.json \
		-execdir bash -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
	chown -R root:root "$pkgdir"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE.md"
	mkdir -p "$pkgdir/usr/bin"
	for bin in apg apg-conv; do
		ln -sf "../lib/node_modules/$_npmname/bin/$bin.sh" "$pkgdir/usr/bin/$bin-js"
	done
}

# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=apg-js
pkgname=nodejs-"$_npmname"
pkgver=4.4.0
pkgrel=1
pkgdesc='an ABNF parser generator creating recursive-descent parsers from a superset of ABNF'
arch=(any)
url="https://github.com/ldthomas/$_npmname"
license=(BSD-2-Clause)
depends=(nodejs)
makedepends=(jq
             moreutils
             npm)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('79c9ad44a5b82d359ac68b69c3b4be46a269a7a953a98fd1b2dd757fcbfb3beb')
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

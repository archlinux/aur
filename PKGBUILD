# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=kubebox
pkgver=0.7.0
pkgrel=3
pkgdesc="Kubebox - Terminal and Web console for Kubernetes"
arch=('x86_64')
url="https://github.com/astefanutti/kubebox"
license=('Apache')
makedepends=('npm' 'jq')

source=("kubebox-$pkgver.tar.gz::https://github.com/astefanutti/kubebox/archive/v${pkgver}.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha1sums=('9bb6700ce569434ad16a148375bb7803f29bc160')

package() {
	# install -D -g root -m 0755 -o root "$srcdir/kubebox-linux-$pkgver" "$pkgdir/usr/bin/kubebox"
	npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$pkgname-$pkgver".tar.gz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}

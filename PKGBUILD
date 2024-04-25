# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>
# Contributor: Alex D'Andrea <alex at dandrea dot io>

pkgname=zx
pkgver=8.0.2
_commit=5fd3d8a8f126565248f16cc810a889a95bdd88d9 # tags/8.0.2
pkgrel=1
pkgdesc='A tool for writing better scripts'
arch=(any)
url=https://github.com/google/zx
license=(Apache)
depends=('nodejs>=16')
makedepends=(npm git)
source=("git+$url.git#commit=$_commit")
md5sums=('c34ce30f7fecb348e11dcd2e89386417')

build() {
	cd "$pkgname"
	npm install --cache "$srcdir/npm-cache"
	npm run build
}

package() {
	cd "$pkgname"

	local _npmdir="$pkgdir/usr/lib/node_modules"
	install -d "$_npmdir/$pkgname"
	cp -r build/ package.json "$_npmdir/$pkgname"

	mkdir -p "$pkgdir/usr/bin"
	ln -s "$(realpath -m --relative-to=/usr/bin /usr/lib/node_modules/$pkgname/build/cli.js)" "$pkgdir/usr/bin/zx"
	chmod 0755 "$pkgdir/usr/bin/zx"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


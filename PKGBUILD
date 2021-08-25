# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nodejs-addon-api
_npmname=${pkgname/js}
pkgver=4.1.0
pkgrel=1
pkgdesc='Node.js API (N-API)'
arch=(any)
url="https://github.com/nodejs/$_npmname"
license=(MIT)
depends=(nodejs)
makedepends=(jq
             moreutils
             npm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7da61958aa9137fb6dbfff84b2ff833c53e2a42d9fec7142079e0d70ae2913a2')

prepare() {
	cd "$_npmname-$pkgver"
	# Suppress install or link against this package triggering a build!
	jq 'del(.scripts[])' package.json | sponge package.json
}

build() {
	cd "$_npmname-$pkgver"
	npm pack
}

package() {
	cd "$_npmname-$pkgver"
	npm install \
		--production \
		--global \
		--no-update-notifier \
		--no-audit \
		--no-fund \
		--cache "$srcdir/npm-cache" \
		--prefix "$pkgdir/usr" \
		$_npmname-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	chmod -R u=rwX,go=rX "$pkgdir"

	# npm installs package.json owned by build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}

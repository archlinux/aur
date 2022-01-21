# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nodejs-addon-api
_npmname=${pkgname/js}
pkgver=4.3.0
pkgrel=1
pkgdesc='Node.js API (N-API)'
arch=(any)
url="https://github.com/nodejs/$_npmname"
license=(MIT)
depends=(nodejs)
makedepends=(jq
             moreutils
             npm)
_archive="$_npmname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0e4b59fe0fb9c61b2d38850ae4e9fc1f2e284757e1780e67d4f43249a1a375c4')

prepare() {
	cd "$_archive"
	# Suppress install or link against this package triggering a build!
	jq 'del(.scripts[])' package.json | sponge package.json
}

build() {
	cd "$_archive"
	npm pack
}

package() {
	cd "$_archive"
	npm install \
		--production \
		--global \
		--no-update-notifier \
		--no-audit \
		--no-fund \
		--cache "$srcdir/npm-cache" \
		--prefix "$pkgdir/usr" \
		$_archive.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	chmod -R u=rwX,go=rX "$pkgdir"

	# npm installs package.json owned by build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}

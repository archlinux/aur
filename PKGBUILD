# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nodejs-addon-api
_npmname=${pkgname/js}
pkgver=6.0.0
pkgrel=1
pkgdesc='Node.js API (N-API)'
arch=(any)
url="https://github.com/nodejs/$_npmname"
license=(MIT)
depends=('nodejs>=14')
makedepends=(jq
             moreutils
             npm)
_archive="$_npmname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('926d5cfdfdb6c3451da8a2ce5c90b55334acf590eff59b48b169470f9a46ddab')

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

# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nodejs-sword-interface
_npmname=${pkgname/js}
pkgver=0.235.0
pkgrel=1
pkgdesc='Javascript (N-API) interface to SWORD library'
arch=(x86_64)
url="https://github.com/tobias-klein/$_npmname"
license=(GPL3)
depends=(nodejs
         nodejs-addon-api)
makedepends=(jq
             moreutils
             node-gyp
             npm
             sword)
_archive="$_npmname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('117cdebb7de90c8a0edbe30ea53163653b098b0fc434021c68a85a6c7121969f')

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
	export LINK_SYSTEM_SWORD=1
	npm install \
		--production \
		--global \
		--no-audit \
		--no-fund \
		--no-update-notifier \
		--cache "$srcdir/npm-cache" \
		--prefix "$pkgdir/usr" \
		$_archive.tgz
	rm -rf "$pkgdir/usr/lib/node_modules/$_npmname/"{node_modules,src,patch,scripts,sword_build,*.tgz,*.sh,*.txt,*.md,.git*,COPYING}

	# Use system provided deps
	pushd "$pkgdir/usr/lib/node_modules/$_npmname/" && ln -sf /usr/lib/node_modules

	find "$pkgdir" -type f -name package.json \
		-execdir sh -c "jq '.gypfile = false' {} | sponge {}" \;

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	chmod -R u=rwX,go=rX "$pkgdir"

	# npm installs package.json owned by build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}

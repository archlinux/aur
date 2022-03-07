# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=user_oidc
pkgname=nextcloud-app-${_appname/_/-}
pkgver=1.1.0
pkgrel=1
pkgdesc='OIDC connect user backend for Nextcloud'
arch=(x86_64)
url="https://github.com/nextcloud/$_appname"
license=(AGPL3)
depends=(nextcloud)
makedepends=(composer
             npm
             rsync)
_archive="$_appname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('77eb8729f36df0a89105d2091f2cc9168fec9e953d8624baeb1e1c66c28236a0')

prepare() {
	cd "$_archive"
	composer install --no-dev
	npm install --cache "$srcdir/npm-cache" --no-audit --no-fund
}

build() {
	cd "$_archive"
	npm run build --cache "$srcdir/npm-cache" --offline
}

package() {
	cd "$_archive"
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath \
		--include='appinfo/***' \
		--include='js/***' \
		--include='lib/***' \
		--include='templates/***' \
		--include='vendor/***' \
		--include=.php_cs.dist \
		--include=webpack.common.js \
		--include=webpack.prod.js \
		--exclude='*' \
	./ $_appdir/
}

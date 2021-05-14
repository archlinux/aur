# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=user_oidc
pkgname=nextcloud-app-${_appname/_/-}
pkgver=0.3.2
pkgrel=1
pkgdesc="OIDC connect user backend for Nextcloud"
arch=(x86_64)
url="https://github.com/nextcloud/$_appname"
license=(AGPL3)
depends=(nextcloud)
makedepends=(composer npm)
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cec152db9fb27658853bf5a626696e110f3207ad095a8bf6ae45a01e4531f214')

prepare() {
	cd "$_appname-$pkgver"
	composer install --no-dev
	npm install --cache "$srcdir/npm-cache" --no-audit --no-fund
}

build() {
	cd "$_appname-$pkgver"
	npm run build --cache "$srcdir/npm-cache" --offline
}

package() {
    cd "$_appname-$pkgver"
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

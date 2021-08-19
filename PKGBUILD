# Maintainer: Caleb Maclennan <caleb@alerque.com>

_appname=user_oidc
pkgname=nextcloud-app-${_appname/_/-}
pkgver=1.0.0
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
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1a4b15c08a14bc8384c338d474a11f9a8a3a6e81a616163faa4d808d710bcdd4')

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

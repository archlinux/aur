# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=twofactor_totp
pkgname=nextcloud-app-twofactor-totp
pkgver=6.2.0
pkgrel=1
pkgdesc="Second factor TOTP (RFC 6238) provider for Nextcloud"
arch=("any")
url="https://github.com/nextcloud/twofactor_totp"
license=('AGPL3')
depends=('nextcloud>=21' 'nextcloud<24')
makedepends=("npm" "composer")
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c351facdb38b0ff4683c11b15fbbf6aaa04e5893b161253afdc06af4f21690c77d67ad10557f2ebeadb9a616b989378b2b6ec5fb149e7cb045395d87f20f4be2')

build() {
	cd "$_appname-$pkgver"
	composer install --no-dev -o
	npm ci
	npm run build
}

package() {
	cd "$_appname-$pkgver"
	mkdir -p "$pkgdir/usr/share/webapps/nextcloud/apps"
	local _appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	cp -ar . "$_appdir"
	while read f; do
		rm -rf -- "$_appdir/$f"
	done < .nextcloudignore
	find "${pkgdir}" -name '*.js.map' -type f -exec sed -i -e "s|${srcdir}||g" {} \;
}

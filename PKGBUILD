# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=twofactor_totp
pkgname=nextcloud-app-twofactor-totp
pkgver=6.1.0
pkgrel=2
pkgdesc="Second factor TOTP (RFC 6238) provider for Nextcloud"
arch=("any")
url="https://github.com/nextcloud/twofactor_totp"
license=('AGPL3')
depends=('nextcloud>=21')
makedepends=("npm" "composer")
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('375450d38c3c19516ae9e680cd76c351b3997cc599f4a06eb0bd177fa458774bcab65e7fb947baf27fde211e5faf6cf7630b654ebe15a2e28e5d0054766197f5')

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
	while read f
	do
		rm -rf -- "$_appdir"/$f
	done < .nextcloudignore
	find "${pkgdir}" -name '*.js.map' -type f -exec sed -i -e "s|${srcdir}||g" {} \;
}

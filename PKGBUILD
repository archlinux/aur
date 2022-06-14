# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=twofactor_totp
pkgname=nextcloud-app-twofactor-totp
pkgver=6.4.0
pkgrel=1
pkgdesc="Second factor TOTP (RFC 6238) provider for Nextcloud"
arch=("any")
url="https://github.com/nextcloud/twofactor_totp"
license=('AGPL3')
depends=('nextcloud>=22' 'nextcloud<26')
makedepends=("npm" "composer")
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6eafcc39e165262353682eea4fec536a469a4ff2833b584ea3807a8c9e8285bcd8d452d9f008cf83cd7f5eae55258262efaebd4b8b4cdd89236c8ae6a59b969d')

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

# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=twofactor_totp
pkgname=nextcloud-app-twofactor-totp
pkgver=6.3.0
pkgrel=1
pkgdesc="Second factor TOTP (RFC 6238) provider for Nextcloud"
arch=("any")
url="https://github.com/nextcloud/twofactor_totp"
license=('AGPL3')
depends=('nextcloud>=21' 'nextcloud<25')
makedepends=("npm" "composer")
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9e9c85a5b121973f2bdc87674ae28b993b7489ff787ee7b38671039d89341ef9034785a0511cb32632fa90b6741803f0fd1153d26fa978cbe560459d299491fe')

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

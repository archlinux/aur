# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=twofactor_totp
pkgname=nextcloud-app-twofactor-totp
pkgver=6.4.1
pkgrel=1
pkgdesc="Second factor TOTP (RFC 6238) provider for Nextcloud"
arch=("any")
url="https://github.com/nextcloud/twofactor_totp"
license=('AGPL3')
makedepends=("npm" "composer" "yq")
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a1468e9e6ef2d1962b9682f84509ea22076c76fd06ae917b5ce93bec6af154c80043d620741875d4cfb5331be12bc67b00bbbe28cce653e801e686f14409827b')

build() {
	cd "$_appname-$pkgver"
	composer install --no-dev -o
	npm ci
	npm run build
}

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "${_appname}-${pkgver}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "${_appname}-${pkgver}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

package() {
	local _app_min_major_version
	local _app_max_major_version
	_get_nextcloud_versions
	depends=("nextcloud>=$_app_min_major_version" "nextcloud<$_app_max_major_version")

	cd "$_appname-$pkgver"
	mkdir -p "$pkgdir/usr/share/webapps/nextcloud/apps"
	local _appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	cp -ar . "$_appdir"
	while read f; do
		rm -rf -- "$_appdir/$f"
	done < .nextcloudignore
	find "${pkgdir}" -name '*.js.map' -type f -exec sed -i -e "s|${srcdir}||g" {} \;
}

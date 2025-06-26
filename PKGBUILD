# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Noctivivans <noctivivans@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Polichronucci <nick at discloud dot eu>
# Contributor: oguzkagan <me at oguzkaganeren dot com dot tr>

_appname=ocsms
pkgname=nextcloud-app-ocsms
pkgver=2.2.0
pkgrel=1
epoch=1
pkgdesc='Push your Android SMS to your Nextcloud instance'
arch=(any)
url="https://apps.nextcloud.com/apps/ocsms"
license=(AGPL-3.0-only)
makedepends=(nextcloud
             rsync
             yq)
_archive="$_appname-$pkgver"
source=("https://github.com/nextcloud/ocsms/releases/download/$pkgver/$_archive.tar.gz")
sha256sums=('4844ea1836be417f2ab635af46a54555d72d47962c5f44012793bad6690854c2')

# BEGIN boilerplate nextcloud app version clamping, see also other packages in group
# 1. Call respective function helpers in check() and package() *after* cd'ing to the source directory
# 2. Add makedepends+=(nextcloud yq)
_phps=(php-legacy php)
_get_supported_ranges() {
	_app_min_nextcloud="$(< appinfo/info.xml xq -r '.info.dependencies.nextcloud["@min-version"] | values')"
	_app_max_nextcloud="$(< appinfo/info.xml xq -r '.info.dependencies.nextcloud["@max-version"] | values | tonumber | .+1')"
	_app_min_php="$(< appinfo/info.xml xq -r '.info.dependencies.php["@min-version"] | values')"
	_app_max_php="$(< appinfo/info.xml xq -r '.info.dependencies.php["@max-version"] | values | tonumber | .+0.1')"
}
_unsupported_range() {
	printf "%s requires %s %s, but %s %s is provided.\n" "$pkgname" "$1" "$2" "$1" "$3"
	exit 1
}
_nextcloud_app_check() {
	_get_supported_ranges
	for _php in "${_phps[@]}"; do command -v "$_php" > /dev/null && break; done
	local _nextcloud_ver="$("$_php" <(cat /usr/share/webapps/nextcloud/version.php; echo 'print($OC_VersionString);'))"
	local _php_ver="$("$_php" -r 'print(phpversion());')"
	[[ "$(vercmp "${_app_min_nextcloud:-0}" "$_nextcloud_ver")" -le 0 ]] || \
		_unsupported_range nextcloud "=> $_app_min_nextcloud" "$_nextcloud_ver"
	[[ "$(vercmp "${_app_max_nextcloud:-999}" "$_nextcloud_ver")" -gt 0 ]] || \
		_unsupported_range nextcloud "< $_app_max_nextcloud" "$_nextcloud_ver"
	[[ "$(vercmp "${_app_min_php:-0}" "$_php_ver")" -le 0 ]] || \
		_unsupported_range php ">= $_app_min_php" "$_php_ver"
	[[ "$(vercmp "${_app_max_php:-999}" "$_php_ver")" -gt 0 ]] || \
		_unsupported_range php "< $_app_max_php" "$_php_ver"
}
_nextcloud_app_package() {
	_get_supported_ranges
	depends+=("nextcloud>=${_app_min_nextcloud:-0}" "nextcloud<${_app_max_nextcloud:-999}")
	depends+=("php-interpreter${_app_min_php:+>=$_app_min_php}" ${_app_max_php:+"php-interpreter<$_app_max_php"})
}
# END boilerplate nextcloud app version clamping

prepare() {
	cd "$_appname"
	sed -i -e '/max-version/s/20/31/' appinfo/info.xml
}

package() {
	cd "$_appname"
	_nextcloud_app_package
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath \
		./ $_appdir/
}

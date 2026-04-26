# Maintainer: Matthew Borger <matthew@borgerstudio.com>

_name=memories
pkgname=nextcloud-app-memories
pkgdesc="Fast, modern and advanced photo management suite for Nextcloud"
pkgver=8.0.1
pkgrel=1
arch=(any)
license=(AGPL-3.0-or-later)
url="https://github.com/pulsejet/$_name"
options=('!strip')
makedepends=(nextcloud
             yq)
source=("$url/releases/download/v$pkgver/$_name.tar.gz")
sha256sums=("07e3bbf2a8c141b98c9c502f1ffe5af98062bdefab9011bd00a4d7ec6dea351d")

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

check() {
	cd "$_name"
	_nextcloud_app_check
}

package() {
	cd "$_name"
	local appdir="$pkgdir/usr/share/webapps/nextcloud/apps"
	install -d "$appdir"
	cp -a "./" "$appdir/${pkgname##*-}"
}

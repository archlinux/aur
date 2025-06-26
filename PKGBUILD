# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: oguzkagan <me@oguzkaganeren.com.tr>
# Contributor: Polichronucci <nick at discloud dot eu>

_appname=ocsms
pkgname=nextcloud-app-ocsms-git
pkgver=2.2.0.r88.g8460530
pkgrel=1
pkgdesc='Push your Android SMS to your Nextcloud instance'
arch=(any)
url="https://apps.nextcloud.com/apps/ocsms"
license=(AGPL-3.0-only)
depends=(nextcloud)
makedepends=(git
             nextcloud
             rsync
             yq)
source=("git+https://github.com/nextcloud/ocsms.git")
sha256sums=('3c230fa7fd5515996849ee775675aad86cb95fdbb824c18425fbdceb076bce63')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
sha256sums=('SKIP')

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
	# https://github.com/nextcloud/ocsms/pull/340
	git cherry-pick -n f2070b29443c5a62d8a2ebf9d4ce26fc66d757f9
}

pkgver() {
	cd "$_appname"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

check() {
	cd "$_appname"
	_nextcloud_app_check
}

package() {
	cd "$_appname"
	_nextcloud_app_package
	_appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
	rsync -a --mkpath --exclude .git \
		./ $_appdir/
}

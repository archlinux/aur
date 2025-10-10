# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

_name=repod
pkgname=nextcloud-app-repod
pkgver=3.8.0
pkgrel=1
pkgdesc="Podcast manager for Nextcloud"
arch=(any)
url="https://git.crystalyx.net/Xefir/repod"
license=(AGPL-3.0-or-later)
depends=(nextcloud-app-gpoddersync)
makedepends=(nextcloud yq)
groups=(nextcloud-apps)
options=(!strip)
source=($pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_name.tar.gz)
sha256sums=('502db2555f53b21d109b6f413c9f3d702e7790efc0f78dfe49e30f54f2139082')
b2sums=('cb444c9c7b3e42d3979ec6339f5785e3984bb1ec0d901d3da2669388b069b8c548586326d38af5ff8235297394dd58fbfcbcea17885a1ebdd4205b2089dfc2d8')

# BEGIN boilerplate nextcloud app version clamping, see also other packages in group
# 1. Call respective function helpers in check() and package() *after* cd'ing to the source directory
# 2. Add makedepends+=(nextcloud yq)
_phps=(php php-legacy)
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
  cd $_name
  _nextcloud_app_check
}

package() {
  install -d "$pkgdir/usr/share/webapps/nextcloud/apps"
  cp -av $_name "$pkgdir/usr/share/webapps/nextcloud/apps/"
  cd $_name
  _nextcloud_app_package
}

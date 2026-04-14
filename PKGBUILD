# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

_name=gpoddersync
pkgname=nextcloud-app-gpoddersync
pkgver=3.16.0
pkgrel=1
pkgdesc="gpodder.net api for Nextcloud"
arch=(any)
url="https://github.com/thrillfall/nextcloud-gpodder"
license=(AGPL-3.0-or-later)
makedepends=(nextcloud yq)
groups=(nextcloud-apps)
options=(!strip)
source=($pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_name.tar.gz)
sha256sums=('f4171755ab99585966957b67c1d4a8e712126e186cb1aedaa39ba52a9ce23a75')
b2sums=('0ef11e9f0a7ae123fce9b5190c6a30cb6983892f12f64f3645f4853ffabe9d7088bc3732a250d27ee68309b3186f74e28798b72afe02a9ea7b2a1ace9140afef')

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

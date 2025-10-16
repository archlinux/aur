# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: David Runge <dave@sleepmap.de>

_name=files_antivirus
pkgname=nextcloud-app-files-antivirus
pkgver=6.1.0
pkgrel=1
pkgdesc="Antivirus app for Nextcloud"
arch=(any)
url="https://github.com/nextcloud/files_antivirus"
license=(AGPL-3.0-or-later)
depends=(clamav)
makedepends=(nextcloud yq)
groups=(nextcloud-apps)
options=(!strip)
source=(${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('37c772c832b752d28085aa431464ceaa0549901a70850d2a6208972963ba61a9')
b2sums=('d5a81a7072f3901d7d6fbc50a849e41a93c14787ff0a02137801fd12888602fc2807b428a9893198907f5ec0e5798e4fbb4187733a72c8eadfaa87fca07a36f9')

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
  cd $_name-$pkgver
  _nextcloud_app_check
}

package() {
  install -d "$pkgdir/usr/share/webapps/nextcloud/apps"
  cp -av $_name-$pkgver "$pkgdir/usr/share/webapps/nextcloud/apps/$_name"
  cd $_name-$pkgver
  _nextcloud_app_package
}

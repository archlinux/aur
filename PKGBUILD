# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Christian Steinhaus <aur@anwarias.de>

_name=end_to_end_encryption
pkgname=nextcloud-app-end_to_end_encryption
pkgver=1.16.2
pkgrel=1
pkgdesc="Nextcloud End-to-End-Encryption App"
arch=('any')
url="https://github.com/nextcloud/end_to_end_encryption"
license=('AGPLv3')
makedepends=('nextcloud' 'yq')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud-releases/${_name}/releases/download/v${pkgver/_/-}/${_name}-v${pkgver/_/-}.tar.gz")
sha512sums=('883ced9e7679f8626a2f445b01ffcf25d33ad529aa5b145887e59a8b94a39b883f24c1b797223135f58b2397b3d9ef3a4e8565d5a0880ee7d149cb20101d2715')


# BEGIN boilerplate nextcloud app version clamping, see also other packages in group
# 1. Call respective function helpers in check() and package() *after* cd'ing to the source directory
# 2. Add makedepends+=(nextcloud yq)
_phps=(php7 php php-legacy)
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
  install -vdm 755 "$pkgdir/usr/share/webapps/nextcloud/apps/"
  cp -av $_name "$pkgdir/usr/share/webapps/nextcloud/apps/"
  cd $_name
  _nextcloud_app_package
}

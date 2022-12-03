# Maintainer: William Hahn <bill@hahn3.com>

pkgname=nextcloud-app-rainloop
_name=rainloop
pkgver=7.2.6
pkgrel=1
pkgdesc="RainLoop Webmail for nextcloud"
arch=('any')
url="https://apps.nextcloud.com/apps/rainloop"
license=('AGPL')
makedepends=('nextcloud' 'php' 'ripgrep' 'yq')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pierre-alain-b/rainloop-nextcloud/releases/download/$pkgver-deprecated/rainloop.tar.gz")
sha256sums=('4d907d0d219840b13060c874f09245c8de1e062247fd887271c1cc204ccfb87e')

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "${_name}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "${_name}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

_get_php_versions() {
  local _phps=(php7 php)

  _app_min_php="$(xq '.info.dependencies.php["@min-version"]' "$_name/appinfo/info.xml"| sed 's/"//g')"
  _app_max_php="$(xq '.info.dependencies.php["@max-version"]' "$_name/appinfo/info.xml"| sed 's/"//g')"

  if [[ $_app_max_php != 'null' ]]; then
    _app_max_php="$(echo $_app_max_php | awk -F '.' '{print $1"."$2+1}')"
  fi

  _system_php=""
  for _php in "${_phps[@]}"; do
    if command -v "$_php" > /dev/null; then
      if [[ -z "$_system_php" ]]; then
        _system_php="$_php"
      fi
    fi
  done
}

check() {
  local _app_min_major_version
  local _app_max_major_version
  _get_nextcloud_versions
  _get_php_versions

  local _nextcloud_major_version="$(rg "OC_Version = " /usr/share/webapps/nextcloud/version.php |cut -d'(' -f2| cut -d ',' -f1)"
  if [[ "$(vercmp "${_nextcloud_major_version}" "${_app_min_major_version}")" -lt 0 ]] || [[ "$(vercmp "${_nextcloud_major_version}" "${_app_max_major_version}")" -gt 0 ]] ; then
    printf "%s requires nextcloud >= %s/ nextcloud <= %s, but nextcloud %s is provided.\n" "$pkgname" "${_app_min_major_version}" "${_app_max_major_version}" "${_nextcloud_major_version}"
    exit 1
  fi

  local _php_version="$($_system_php --version |head -n1 |cut -d ' ' -f2 |sed 's/.[0-9]*$//g')"
  if [[ "$(vercmp "$_php_version" "$_app_min_php" )" -lt 0 ]]; then
    printf "%s requires php-interpreter >= %s, but %s is provided\n" $pkgname $_app_min_php $_php_version
    exit 1
  fi
  if [[ $_app_max_php != 'null' ]]; then
    if [[ "$(vercmp "$_php_version" "$_app_max_php" )" -ge 0 ]]; then
      printf "%s requires php-interpreter < %s, but %s is provided\n" $pkgname $_app_max_php $_php_version
      exit 1
    fi
  fi
}

package() {
  _get_nextcloud_versions
  _get_php_versions

  depends=("nextcloud>=${_app_min_major_version}" "nextcloud<${_app_max_major_version}")
  if [[ "$_app_min_php" != 'null' ]]; then
    depends+=(
      "php-interpreter>=$_app_min_php"
    )
  fi
  if [[ "$_app_max_php" != 'null' ]]; then
    depends+=(
      "php-interpreter<$_app_max_php"
    )
  fi
  if [[ "$_app_min_php" == 'null' ]] && [[ "$_app_max_php" == 'null' ]]; then
    depends+=(php-interpreter)
  fi

  install -d ${pkgdir}/usr/share/webapps/nextcloud/apps
  cp -a ${srcdir}/rainloop ${pkgdir}/usr/share/webapps/nextcloud/apps/rainloop
}

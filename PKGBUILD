# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-maps
_name=maps
pkgver=1.7.1
pkgrel=2
pkgdesc="OpenStreetMap layers including POIs"
arch=('any')
url="https://github.com/nextcloud/maps"
license=('GPL')
depends=('nextcloud')
makedepends=('ripgrep' 'yq' 'composer' 'npm')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud-releases/maps/releases/download/v$pkgver/maps-v$pkgver.tar.gz")
sha256sums=('470b73a2ecf834415954ee95f18bc873d0b29ff28167e800632e427050ef46f7')

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "${_name}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "${_name}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

check() {
  local _app_min_major_version
  local _app_max_major_version
  _get_nextcloud_versions

  local _nextcloud_major_version="$(rg "OC_Version = " /usr/share/webapps/nextcloud/version.php |cut -d'(' -f2| cut -d ',' -f1)"
  if [[ "$(vercmp "${_nextcloud_major_version}" "${_app_min_major_version}")" -lt 0 ]] || [[ "$(vercmp "${_nextcloud_major_version}" "${_app_max_major_version}")" -gt 0 ]] ; then
    printf "%s requires nextcloud >= %s/ nextcloud <= %s, but nextcloud %s is provided.\n" "$pkgname" "${_app_min_major_version}" "${_app_max_major_version}" "${_nextcloud_major_version}"
    exit 1
  fi
}

package() {
  _get_nextcloud_versions
  depends=("nextcloud>=${_app_min_major_version}" "nextcloud<${_app_max_major_version}")

  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -r "${srcdir}"/maps "${pkgdir}"/usr/share/webapps/nextcloud/apps/maps
}

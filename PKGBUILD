# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-maps
_name=maps
pkgver=0.1.10
pkgrel=1
pkgdesc="OpenStreetMap layers including POIs"
arch=('any')
url="https://github.com/nextcloud/maps"
license=('GPL')
depends=('nextcloud')
makedepends=('ripgrep' 'yq')
options=('!strip')
source=("https://github.com/nextcloud/maps/releases/download/v$pkgver/maps-$pkgver.tar.gz")
sha256sums=('9bc8d8f09fe4918a1e075b658ce9bcb33eaef5f93162921e058e89e04cb0c6ec')

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
  cp -r "${srcdir}"/maps "${pkgdir}"/usr/share/webapps/nextcloud/apps/
}

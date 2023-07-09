# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-calendar_resource_management
pkgver=0.5.0
pkgrel=1
pkgdesc="Resource manager for nextcloud calendar app"
arch=('any')
url="https://github.com/nextcloud/calendar_resource_management"
license=('GPL')
depends=('nextcloud')
makedepends=('ripgrep' 'yq')
options=('!strip')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud-releases/calendar_resource_management/releases/download/v$pkgver/calendar_resource_management-v$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/calendar_resource_management/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d212ee80531f275bdbb8794b1d6e16e6baf1c0289e30017cb5616132c313b22')

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "calendar_resource_management-${pkgver}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "calendar_resource_management-${pkgver}/appinfo/info.xml"| sed 's/"//g')"
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
  cp -r "${srcdir}"/calendar_resource_management-${pkgver} "${pkgdir}"/usr/share/webapps/nextcloud/apps/calendar_resource_management
}

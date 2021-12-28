pkgname=nextcloud-app-forms
_name=forms
pkgver=2.4.0
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/forms"
license=('AGPL3')
depends=('nextcloud')
makedepends=('ripgrep' 'yq')
groups=('nextcloud-apps')
source=("forms-${pkgver}.tar.gz::https://github.com/nextcloud-releases/forms/releases/download/v$pkgver/forms-v$pkgver.tar.gz")
sha512sums=('03b443e467d58d161ed9b2813e3fc43ee09445a8e62515b935aca22a5cfcf6aa6d03c4c87b4dc3e115d7f4659f99088b40a4c432cac605307e220640bef53bbb')

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
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/forms" "${pkgdir}/usr/share/webapps/nextcloud/apps"
}

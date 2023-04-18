# Maintainer: Carlos Galindo <arch -at- cgj.es>

pkgname=nextcloud-app-files_retention
_appname=files_retention
pkgver=1.15.0
pkgrel=1
pkgdesc="Nextcloud app to delete files after a specified amount of days"
arch=('any')
url="https://github.com/nextcloud/files_retention"
license=('AGPL3')
makedepends=('npm' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('3de1e30dfdec33e6f0b0eb54dac597a802093a4b05afb3894118ab99159346d4671ba810f423c7367a80b36c17bffe0ad130eab17f66e716fc9a2ff1043a6a8a')

prepare() {
    mv "${srcdir}/${_appname}-${pkgver}" "${srcdir}/${_appname}"
}

build() {
    cd "${srcdir}/${_appname}"
    make -j1
}

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "${_appname}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "${_appname}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

package() {
    local _app_min_major_version
    local _app_max_major_version
    _get_nextcloud_versions
    depends=("nextcloud>=$_app_min_major_version" "nextcloud<$_app_max_major_version")

    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    tar -x --no-same-owner -C "${pkgdir}/usr/share/webapps/nextcloud/apps" \
        -f "${srcdir}/${_appname}/build/artifacts/${_appname}.tar.gz"
    rm -rf "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}/${_appname}-${pkgver}/"
}

# Maintainer: Carlos Galindo <arch -at- cgj.es>

pkgname=nextcloud-app-files_automatedtagging
_appname=files_automatedtagging
pkgver=1.19.0
pkgrel=1
pkgdesc="Nextcloud app that assigns tags to newly uploaded files based on some conditions"
arch=('any')
url="https://github.com/nextcloud/files_automatedtagging"
license=('AGPL3')
makedepends=('npm' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6bb35e10accfb324484220915ea232d34857c2654b7a6fa61c5f8a4c689d2e20237010e9c441c40d145c37cbc2b4016f845248ebb37f25966bd620359f7c4ee4')

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
    # rm -rf "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}/${_appname}-${pkgver}/"
}

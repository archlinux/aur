# Maintainer: Carlos Galindo <arch -at- cgj.es>

pkgname=nextcloud-app-files_automatedtagging
_appname=files_automatedtagging
pkgver=1.16.1
pkgrel=1
pkgdesc="Nextcloud app that assigns tags to newly uploaded files based on some conditions"
arch=('any')
url="https://github.com/nextcloud/files_automatedtagging"
license=('AGPL3')
makedepends=('npm' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6c695f31a0bfcab6099266137a4fba4c078acf3f00244bd6261d39ea713c3ee1931a95714c6735cd560a91d15339357bc19351c62791ef6d9860ce882a228671')

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

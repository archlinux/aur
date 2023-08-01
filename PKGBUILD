# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

pkgname=nextcloud-app-user-usage-report
_appname=user_usage_report
pkgver=1.11.0
pkgrel=1
pkgdesc="Provides a command which generates a report about all the users and their usage."
arch=('any')
url="https://github.com/nextcloud/user_usage_report"
license=('AGPL3')
makedepends=('yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('096061fab40396d59533a93a3fea7481d9a221c6c6ce30ed393d5306a80c73b4f4a6a7f185ecb124a1810810c4da7dfeabd540eecbebdbc121ef1260e68f6d7d')

# Boilerplate nextcloud version calculation adopted from other packages
_get_nextcloud_versions() {
    _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "${_appname}/appinfo/info.xml"| sed 's/"//g')"
    _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "${_appname}/appinfo/info.xml"| sed 's/"//g')"
    _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

prepare() {
    mv "${srcdir}/${_appname}-${pkgver}" "${srcdir}/${_appname}"

    local _app_min_major_version
    local _app_max_major_version
    _get_nextcloud_versions

    depends=("nextcloud>=${_app_min_major_version}" "nextcloud<${_app_max_major_version}")
}

build() {
    cd "${srcdir}/${_appname}"
    make -j1
}

package() {
    _install_dir="usr/share/webapps/nextcloud/apps"

    install -d "${pkgdir}/${_install_dir}"

    tar -x --no-same-owner -C "${pkgdir}/${_install_dir}" \
        -f "${srcdir}/${_appname}/build/artifacts/${_appname}.tar.gz"
}

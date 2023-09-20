# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

pkgname=nextcloud-app-files-accesscontrol
_appname=files_accesscontrol
pkgver=1.17.1
pkgrel=1
pkgdesc="Control access to files based on conditions."
arch=('any')
url="https://github.com/nextcloud/files_accesscontrol"
license=('AGPL')
makedepends=('yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b1662aa68cb09a1fc3c854e5d8b13a67281149f49f41473bc333e81e691dc146a32a8b93fc0731b13c7cda9e0b017dfbddf031964d36e2a379b1fd3d1d6146c9')

# Boilerplate nextcloud version calculation adopted from other packages
_get_nextcloud_versions() {
    _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "${_appname}/appinfo/info.xml"| sed 's/"//g')"
    _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "${_appname}/appinfo/info.xml"| sed 's/"//g')"
    _app_max_major_version=$(printf %i "$(( ${_app_min_major_version} + 1 ))") # Handles decimal versions
    #echo "Min: ${_app_min_major_version}; Max: ${_app_max_major_version}"
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

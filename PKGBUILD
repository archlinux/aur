# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

pkgname=nextcloud-app-groupfolders
_appname=groupfolders
pkgver=15.2.0
pkgrel=1
pkgdesc="Admin-configured folders shared by everyone in a group."
arch=('any')
url="https://github.com/nextcloud/groupfolders"
license=('AGPL')
makedepends=('npm' 'jq' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d6f4e1d3f2524eb696da9dc0156c225e03cb414c547c96f3257e621566bd1e1abd4d6db180e3685d923454988cee4c6d4682799aa2c99970989aa244b39ab9ea')

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

    # Fix incorrect version string in Makefile
    sed -i -e "s/\<version+=.*\>/version+=${pkgver}/g" "${srcdir}/${_appname}/Makefile"
    # Add version string to npm package.json
    _tmp=$(mktemp)
    _package_json="${srcdir}/${_appname}/package.json"
    jq --arg v "${pkgver}" '.version = $v' ${_package_json} > "${_tmp}" && mv "${_tmp}" "${_package_json}"
}

build() {
    cd "${srcdir}/${_appname}"
    make -j1 appstore
}

package() {
    _install_dir="usr/share/webapps/nextcloud/apps"

    install -d "${pkgdir}/${_install_dir}"

    tar -x --no-same-owner -C "${pkgdir}/${_install_dir}" \
        -f "${srcdir}/${_appname}/build/${_appname}-${pkgver}.tar.gz"
    rm -rf "${pkgdir}/${_install_dir}/groupfolders/build"
}

# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=groupfolders
pkgname=nextcloud-app-groupfolders
pkgver=20.1.6
pkgrel=1
pkgdesc="Admin-configured folders shared by everyone in a group."
arch=('any')
url="https://github.com/nextcloud/groupfolders"
license=('AGPL')
makedepends=('npm' 'jq' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('5329bfc2b3f00e690c22d83b1862938513a538bb80cc8e3e1e016c50bbe9659a9a2925ea2c085fe19d32a83b5192b8dda9cdb507d0e82744ea4cc8b412681ab4')

# Boilerplate nextcloud version calculation adopted from other packages
_get_nextcloud_versions() {
    _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"] | tonumber' "${_appname}/appinfo/info.xml")"
    _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"] | tonumber | .+1 | floor' "${_appname}/appinfo/info.xml")"
    #echo "Min: ${_app_min_major_version}; Max: ${_app_max_major_version}"
}

_nextcloud_app_package() {
    _get_nextcloud_versions
    depends=("nextcloud>=${_app_min_major_version:-0}" "nextcloud<${_app_max_major_version:-999}")
}
# END Boilerplate nextcloud app version clamping

prepare() {
    mv "${srcdir}/${_appname}-${pkgver}" "${srcdir}/${_appname}"

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
    rm -rf "${pkgdir}/${_install_dir}/${_appname}/build"

    _nextcloud_app_package
}

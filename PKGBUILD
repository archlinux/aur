# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=groupfolders
pkgname=nextcloud-app-groupfolders
pkgver=18.0.3
pkgrel=1
pkgdesc="Admin-configured folders shared by everyone in a group."
arch=('any')
url="https://github.com/nextcloud/groupfolders"
license=('AGPL')
makedepends=('npm' 'jq' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('43a2231a261ffca54e188ca88f59c679eae2431bb316759841876b0da8308287cf8b71bcd1943c8b8b985ae0dc5e88fd0e7e8163dadf044e5a6538448d2cb6df')

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

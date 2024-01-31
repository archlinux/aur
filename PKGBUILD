# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

pkgname=nextcloud-app-files-accesscontrol
_appname=files_accesscontrol
pkgver=1.18.0
pkgrel=1
pkgdesc="Control access to files based on conditions."
arch=('any')
url="https://github.com/nextcloud/files_accesscontrol"
license=('AGPL')
makedepends=('yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d621da568c11d525281de01d79121960e4819eea4ee3458fc2795fce97576c63b9af811ed147495454393047bc6b146685fac1ad66c26d4fd1af18cbe83823d9')

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

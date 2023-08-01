# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

pkgname=nextcloud-app-files-accesscontrol
_appname=files_accesscontrol
pkgver=1.17.0
pkgrel=1
pkgdesc="Control access to files based on conditions."
arch=('any')
url="https://github.com/nextcloud/files_accesscontrol"
license=('AGPL')
makedepends=('yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('7d7e87b924ed9066c35677e10871cef5600b96a14eefe0af6d982682a89c611c7c3bc871f4f604f9af91b8c2b1011607c13e394a9c6d6a974cb3f72e106a4472')

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

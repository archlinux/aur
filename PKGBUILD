# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=quota_warning
pkgname=nextcloud-app-quota-warning
pkgver=1.25.0
pkgrel=1
pkgdesc="Send notifications to users when they have reached 85, 90 and 95% of their quota."
arch=('any')
url="https://github.com/nextcloud/quota_warning"
license=('AGPL-3.0-or-later')
makedepends=('yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('32f63f50423aad115af1302fb23827465714bfb6d5c5db2909df80e40d3bb0f4e2e871ff04e3838872db3778b9c7bf9844e098a203835df36b8d537b68367fa1')

# BEGIN Boilerplate nextcloud version calculation adopted from other packages
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

    _nextcloud_app_package
}

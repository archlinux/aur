# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=quota_warning
pkgname=nextcloud-app-quota-warning
pkgver=1.19.0
pkgrel=2
pkgdesc="Send notifications to users when they have reached 85, 90 and 95% of their quota."
arch=('any')
url="https://github.com/nextcloud/quota_warning"
license=('AGPL-3.0-or-later')
makedepends=('yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('78b220b338faf0530001d4238a0a703943b21bb854c633594558f7f0bcf98ead10cb07303b6004ed60897bc5ac8839a6f4efebf3cde08ef36cd9669f46328cbc')

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

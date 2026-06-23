# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=user_usage_report
pkgname=nextcloud-app-user-usage-report
pkgver=5.0.0
pkgrel=1
pkgdesc="Provides a command which generates a report about all the users and their usage."
arch=('any')
url="https://github.com/nextcloud/user_usage_report"
license=('AGPL-3.0-or-later')
makedepends=('yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('0ab8a768c3522480ec9f066dc54e03809a04c4b5630310527ebe205d56603b9fc595e379073f27d977545cf2d3603b37edf709780421419ee360f535e685084a')

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

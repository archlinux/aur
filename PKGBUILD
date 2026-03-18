# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=files_retention
pkgname=nextcloud-app-files_retention
pkgver=4.0.1
pkgrel=1
pkgdesc="Nextcloud app to delete files after a specified amount of days"
arch=('any')
url="https://github.com/nextcloud/files_retention"
license=('AGPL3')
makedepends=('npm' 'yq' 'rsync')
groups=('nextcloud-apps')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('8e029d539b07aad4aa1d2edc40bcae895263918e7923c705b5ff74dffefe82d91a2b88a2c028e31e1fec06c0c18fcc8894bc81ac5dba019b3ae48c981df676dc')

# Boilerplate nextcloud version calculation adopted from other packages
_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"] | tonumber' "${_appname}/appinfo/info.xml")"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"] | tonumber | .+1 | floor' "${_appname}/appinfo/info.xml")"
  echo "Min: ${_app_min_major_version}; Max: ${_app_max_major_version}"
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
    rm -rf "${pkgdir}/${_install_dir}/${_appname}/${_appname}-${pkgver}/"

    _nextcloud_app_package
}

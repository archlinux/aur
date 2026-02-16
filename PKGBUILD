# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=files_retention
pkgname=nextcloud-app-files_retention
pkgver=4.0.0
pkgrel=1
pkgdesc="Nextcloud app to delete files after a specified amount of days"
arch=('any')
url="https://github.com/nextcloud/files_retention"
license=('AGPL3')
makedepends=('npm' 'yq' 'rsync')
groups=('nextcloud-apps')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c93be29aad2f61feb99b42932d8cda9655aac9b1b440c5225e7916f07ee0fd1d87b77039542bdb18a2962147c61a18b09b405f6e9f62d2e83c14d4f6f064f2d1')

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

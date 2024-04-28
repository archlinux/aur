# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

pkgname=nextcloud-app-files_retention
_appname=files_retention
pkgver=1.17.2
pkgrel=2
pkgdesc="Nextcloud app to delete files after a specified amount of days"
arch=('any')
url="https://github.com/nextcloud/files_retention"
license=('AGPL3')
makedepends=('npm' 'yq' 'rsync')
groups=('nextcloud-apps')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('f3685f3eb9750fdf2aeb2d4dbbe50a2bfb6841f00a7cd50b09bc689260da9949cbb8cb33bf11c5a9cb54e42e87744b3a2bee33bca5822462bf8c8739c20a4ebe')

# Boilerplate nextcloud version calculation adopted from other packages
_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"] | tonumber' "${_appname}/appinfo/info.xml")"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"] | tonumber | .+1 | floor' "${_appname}/appinfo/info.xml")"
  echo "Min: ${_app_min_major_version}; Max: ${_app_max_major_version}"
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
    rm -rf "${pkgdir}/${_install_dir}/${_appname}/${_appname}-${pkgver}/"
}

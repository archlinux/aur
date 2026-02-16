# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=files_automatedtagging
pkgname=nextcloud-app-files_automatedtagging
pkgver=4.0.0
pkgrel=1
pkgdesc="Nextcloud app that assigns tags to newly uploaded files based on some conditions"
arch=('any')
url="https://github.com/nextcloud/files_automatedtagging"
license=('AGPL3')
makedepends=('npm' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('142856736817d01a19b5cd11e3319cc05d5d7f10ca7c7700d83cf1971c56b45f2256b046b55ca3aa6db8dafa9ac56834403d9b7ec096f4b6ea3a3d19ed5e65ff')

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
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    tar -x --no-same-owner -C "${pkgdir}/usr/share/webapps/nextcloud/apps" \
        -f "${srcdir}/${_appname}/build/artifacts/${_appname}.tar.gz"
    # rm -rf "${pkgdir}/usr/share/webapps/nextcloud/apps/${_appname}/${_appname}-${pkgver}/"

    _nextcloud_app_package
}

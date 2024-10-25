# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=files_automatedtagging
pkgname=nextcloud-app-files_automatedtagging
pkgver=1.20.0
pkgrel=1
pkgdesc="Nextcloud app that assigns tags to newly uploaded files based on some conditions"
arch=('any')
url="https://github.com/nextcloud/files_automatedtagging"
license=('AGPL3')
makedepends=('npm' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('06dc9f4f871379bd3ef496442dde2a5fec3ffecc4b92114eeced4c020b7b9a0f76aa17a5edbc431f4fc9a0a0077211bc73ae373f46eb97637815063ec5fe592a')

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

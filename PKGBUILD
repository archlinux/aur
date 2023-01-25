# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
_appname=polls
pkgver=4.1.2
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
makedepends=('npm' 'composer' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ee9d36dbf6c9012e00fc74790f0be8f5b21d830fcf51bc84dbaea298c1ef70870a67cfacd47dc722c6fddc9951f7c8f7785b280f8c3526c8f0c7513fedf3dc8b')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make -j1
}

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "${_appname}-${pkgver}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "${_appname}-${pkgver}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

package() {
    local _app_min_major_version
    local _app_max_major_version
    _get_nextcloud_versions
    depends=("nextcloud>=$_app_min_major_version" "nextcloud<$_app_max_major_version")

    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}

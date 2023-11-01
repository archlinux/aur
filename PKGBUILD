# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
_appname=polls
pkgver=5.4.1
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
makedepends=('npm' 'composer' 'yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b81d6cceae02587cd499f474ed7ebc9971ed85a794985b5f62510e615e3fe622550819e4f70a620763df24955de52b97f786934351e3eea923679ea63bdaa3d2')

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

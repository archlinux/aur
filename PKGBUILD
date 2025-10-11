# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_appname=files_accesscontrol
pkgname=nextcloud-app-files-accesscontrol
pkgver=2.0.2
pkgrel=1
pkgdesc="Control access to files based on conditions."
arch=('any')
url="https://github.com/nextcloud/files_accesscontrol"
license=('AGPL-3.0-or-later')
makedepends=('yq' 'rsync')
source=("${_appname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d6a2777bfd9ff9573de306998160d975a546f2b7d1078aeb9bb8ae3781ef9d87b6de89deccc744a45fe358d18666d699e6a5a3b103f8caabb36bfce3a4d3b8a2')

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

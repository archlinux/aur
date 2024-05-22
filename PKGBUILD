# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Anty0 <anty150 at gmail dot com>

_appname=video_converter
pkgname=nextcloud-app-video-converter
pkgver=1.0.6
pkgrel=1
pkgdesc='Video converter app for Nextcloud'
arch=('any')
url="https://github.com/PaulLereverend/NextcloudVideo_Converter"
license=('AGPL-3.0-or-later')
makedepends=('yq')
depends=('ffmpeg')
source=("${_appname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_appname}.tar.gz")
sha512sums=('7b0b2f07fbbfc785d75b4729aefe0c9c394bb56143eab1635265d9845d3bd8fe94d21a349f8a8e7bae4a05165764fe51cd49d4ffeb8cda6171f77ddfd604433b')

# Boilerplate nextcloud version calculation adopted from other packages
_get_nextcloud_versions() {
    _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"] | tonumber' "${_appname}/appinfo/info.xml")"
    _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"] | tonumber | .+1 | floor' "${_appname}/appinfo/info.xml")"
    echo "Min: ${_app_min_major_version}; Max: ${_app_max_major_version}"
}

_nextcloud_app_package() {
    _get_nextcloud_versions
    depends+=("nextcloud>=${_app_min_major_version:-0}" "nextcloud<${_app_max_major_version:-999}")
}
# END Boilerplate nextcloud app version clamping

package() {
    _install_dir="usr/share/webapps/nextcloud/apps"

    install -d "${pkgdir}/${_install_dir}"
    cp -av $_appname "${pkgdir}/${_install_dir}"

    _nextcloud_app_package
}

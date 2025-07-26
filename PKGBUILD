# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-maps
_name=maps
pkgver=1.6.0
pkgrel=3
pkgdesc="OpenStreetMap layers including POIs"
arch=('any')
url="https://github.com/nextcloud/maps"
license=('GPL')
depends=('nextcloud')
makedepends=('ripgrep' 'yq' 'composer' 'npm')
options=('!strip')
source=("https://github.com/nextcloud/maps/releases/download/v$pkgver/maps-$pkgver.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/maps/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22ea51ca68ecf79e53894badce84d331e11235f066029e7597ea01699c1f74dd')

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "${_name}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "${_name}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

prepare() {
  cd "${srcdir}"/maps
return

  sed -i 's|composer bin all install --ansi|composer bin all install --ansi --ignore-platform-reqs -n|g' composer.json
}

build() {
  cd "${srcdir}"/maps
return

  composer install --ignore-platform-reqs -n
  npm ci
  npm run build

  rm -rf \
    .git \
    build \
    screenshots/addContacts.gif \
    screenshots/addFavorites.gif \
    screenshots/addPhotoFromFiles.gif \
    screenshots/addPhotosFromMap.gif \
    screenshots/addTracks.gif \
    screenshots/old-contacts.png \
    screenshots/old-start.png \
    screenshots/photoAlbumOnMap.gif \
    screenshots/shareMap.gif \
    tests \
    Makefile \
    *.log \
    phpunit*xml \
    composer.* \
    js/node_modules \
    node_modules \
    js/tests \
    js/test \
    js/*.log \
    js/package.json \
    js/bower.json \
    js/karma.* \
    js/protractor.* \
    babel.config.js \
    webpack.*.js \
    package.json \
    bower.json \
    karma.* \
    protractor\.* \
    translationfiles \
    .* \
    js/.*
}

check() {
  local _app_min_major_version
  local _app_max_major_version
  _get_nextcloud_versions

  local _nextcloud_major_version="$(rg "OC_Version = " /usr/share/webapps/nextcloud/version.php |cut -d'(' -f2| cut -d ',' -f1)"
  if [[ "$(vercmp "${_nextcloud_major_version}" "${_app_min_major_version}")" -lt 0 ]] || [[ "$(vercmp "${_nextcloud_major_version}" "${_app_max_major_version}")" -gt 0 ]] ; then
    printf "%s requires nextcloud >= %s/ nextcloud <= %s, but nextcloud %s is provided.\n" "$pkgname" "${_app_min_major_version}" "${_app_max_major_version}" "${_nextcloud_major_version}"
    exit 1
  fi
}

package() {
  _get_nextcloud_versions
  depends=("nextcloud>=${_app_min_major_version}" "nextcloud<${_app_max_major_version}")

  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -r "${srcdir}"/maps "${pkgdir}"/usr/share/webapps/nextcloud/apps/maps
}

# Maintainer: Carlos Galindo < arch -at_ cgj.es >

_appname=music
pkgname=nextcloud-app-music
pkgver=2.1.0
pkgrel=1
pkgdesc="Music app for Nextcloud and ownCloud"
arch=('any')
url="https://github.com/owncloud/music"
license=('AGPL-3.0-or-later')
makedepends=('npm' 'perl' 'perl-locale-po' 'unzip' 'zip' 'yq')
options=('!strip')
groups=('nextcloud-apps')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2fa499e6d2e2f3778d3b632dc917517734cc0aa412932a9720126b7129e981225013cc6955eeb458eb1da172180a8a6f0fdf68a5ce0f673ac8c1000d69d41c4b')

prepare() {
    # Generate music.zip that is used when packaging
    mv "$_appname-$pkgver" "$_appname"
    zip -qr "$_appname.zip" "$_appname/"
    # Remove creation of music.zip using git
    cd "$_appname/build"
    sed -i 's/^git/#git/' release.sh
}

build() {
    cd "$_appname"
    make -j1 -C build build
}

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "${_appname}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "${_appname}/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

package() {
    local _app_min_major_version
    local _app_max_major_version
    _get_nextcloud_versions
    depends=("nextcloud>=$_app_min_major_version" "nextcloud<$_app_max_major_version")

    cd "$_appname"
    _appsdir="$pkgdir/usr/share/webapps/nextcloud/apps"
    _appdir="$_appsdir/$_appname"

    mkdir -p "$_appsdir"
    cp "../$_appname.zip" "$_appname.zip"
    make -j1 -C build release
    cd "$_appsdir"
    unzip -q "$srcdir/music/music-nc.zip"
}


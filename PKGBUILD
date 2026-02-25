# Maintainer: Carlos Galindo < arch -at_ cgj.es >

_appname=music
pkgname=nextcloud-app-music
pkgver=3.0.0
pkgrel=1
pkgdesc="Music app for Nextcloud"
arch=('any')
url="https://github.com/nc-music/music"
license=('AGPL-3.0-or-later')
makedepends=('npm' 'perl' 'perl-locale-po' 'unzip' 'zip' 'yq')
options=('!strip')
groups=('nextcloud-apps')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7cb1da45d9882145ba84514f926e337f376d53d03e729477423c596c71698865b79e621a14078c872dd0d90f56959a685ecbbf782b3e661da68dd10dc947f5a4')

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
    unzip -q "$srcdir/music/music.zip"
}


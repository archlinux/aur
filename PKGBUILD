# Maintainer: Carlos Galindo < arch -at_ cgj.es >

_appname=music
pkgname=nextcloud-app-music
pkgver=1.8.1
pkgrel=1
pkgdesc="Music app for Nextcloud and ownCloud"
arch=('any')
url="https://github.com/owncloud/music"
license=('AGPL3')
makedepends=('npm' 'perl' 'perl-locale-po' 'unzip' 'zip' 'yq')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('494762fbd5cff67449e6565c3e980b1a55b91fa68b4c61ef3cbb479532474c8fbc90956be538c9a78bb07d47984c0329e65d1849b1e9056c941e9285ff64aa65')

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


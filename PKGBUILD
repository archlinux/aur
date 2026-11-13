# Maintainer: Carlos Galindo <arch -at- cgj.es>

_appname=phonetrack
pkgname="nextcloud-app-$_appname"
pkgver=1.6.1
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://github.com/julien-nc/$_appname"
license=('AGPL-3.0-or-later')
makedepends=('composer' 'npm' 'rsync' 'yq')
groups=('nextcloud-apps')
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f3c44488f392496ca56d1693587bb15a7bcb3003f62cd91cdf8ed7ddb5cf90a5da1b5e2aed25a99573617608cf5138179b10e6316333104ec9c0676b4d3e9148')

prepare() {
    cd "$srcdir/$_appname-$pkgver"
    sed -i 's/sudo rm/rm/' makefile
}

build() {
    cd "$srcdir/$_appname-$pkgver"
    make build
}

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "$_appname-$pkgver/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "$_appname-$pkgver/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

package() {
    local _app_min_major_version
    local _app_max_major_version
    _get_nextcloud_versions
    depends=("nextcloud>=$_app_min_major_version" "nextcloud<$_app_max_major_version")

    cd "$srcdir/$_appname-$pkgver"
    _destdir="$pkgdir/usr/share/webapps/nextcloud/apps"
    make build_dir=build sign_dir="$_destdir" version="v$pkgver" build_release

    # Remove auxiliary script
    rm -f "$_destdir/$_appname/l10n/descriptions/gen_info.xml.sh"
    # Remove references to $srcdir from *.js.map
    find "$pkgdir" -type f -name "*.js.map" | while read file; do
        sed -i "s|webpack://$_appname/$srcdir/$_appname-$pkgver/node_modules|webpack://$_appname/./node_modules|" $file
    done
}

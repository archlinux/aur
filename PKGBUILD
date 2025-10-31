# Maintainer: Carlos Galindo <arch -at- cgj.es>

_appname=phonetrack
pkgname="nextcloud-app-$_appname"
pkgver=0.8.2
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://github.com/julien-nc/$_appname"
license=('AGPL')
makedepends=('composer' 'npm' 'rsync' 'yq')
groups=('nextcloud-apps')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('d030b087573e015a73c3716ae40e8665056fa8b30e71671c73d58891df4475df9d9b8794c2dcf4b2e4043e5da0a2355040bd5091e6a5a56e0430446e6fc046d8')

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

# Maintainer: Carlos Galindo <arch -at- cgj.es>

_appname=phonetrack
pkgname="nextcloud-app-$_appname"
pkgver=0.8.1
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://github.com/julien-nc/$_appname"
license=('AGPL')
makedepends=('composer' 'npm' 'rsync' 'yq')
groups=('nextcloud-apps')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('c15d71d7d63d4bd9b61b056f366bb99530991388b4e4ac9711bed62cb9a5733ff7504246983573f63b7413296d9d27e7b430a9348ed8373d1bc5171d5f6d92bd')

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

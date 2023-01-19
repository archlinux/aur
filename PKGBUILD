# Maintainer: Carlos Galindo <arch -at- cgj.es>

_appname=phonetrack
_releasename=$_appname-oc
pkgname="nextcloud-app-$_appname"
pkgver=0.7.4
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/$_releasename"
license=('AGPL')
makedepends=('npm' 'rsync' 'yq')
source=("$url/-/archive/v$pkgver/$_releasename-v$pkgver.tar.gz")
sha512sums=('8f7dd8149fed4a87a067d0d314ddce3c5a1a34cb9d613e278b2a70bcce88920a6e1f69bfa8114db78c1bbd2a5484db1bfa4c8be88b3363525b1ae1566cbee62b')

prepare() {
    cd "$srcdir/$_releasename-v$pkgver"
    sed -i 's/sudo rm/rm/' makefile
}

build() {
    cd "$srcdir/$_releasename-v$pkgver"
    make build
}

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "$_releasename-v$pkgver/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "$_releasename-v$pkgver/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

package() {
    local _app_min_major_version
    local _app_max_major_version
    _get_nextcloud_versions
    depends=("nextcloud>=$_app_min_major_version" "nextcloud<$_app_max_major_version")

    cd "$srcdir/$_releasename-v$pkgver"
    _destdir="$pkgdir/usr/share/webapps/nextcloud/apps"
    make build_dir=build sign_dir="$_destdir" version="v$pkgver" build_release

    # Remove auxiliary script
    rm -f "$_destdir/$_appname/l10n/descriptions/gen_info.xml.sh"
    # Remove references to $srcdir from *.js.map
    find "$pkgdir" -type f -name "*.js.map" | while read file; do
        sed -i "s|webpack://$_appname/$srcdir/$_releasename-v$pkgver/node_modules|webpack://$_appname/./node_modules|" $file
    done
}

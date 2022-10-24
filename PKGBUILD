# Maintainer: Carlos Galindo <arch -at- cgj.es>

_appname=phonetrack
_releasename=$_appname-oc
pkgname=nextcloud-app-$_appname
pkgver=0.7.2
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/$_releasename"
license=('AGPL')
makedepends=('npm' 'rsync' 'yq')
source=("$url/-/archive/v$pkgver/$_releasename-v$pkgver.tar.gz")
sha512sums=('318893c565e1b9b14929e5b335a6975259ca17d87478a3d09a615a080d74b08d5a4d57e6ddeccbce644a955b3e3a22ac2accb506927269a7a1dc11c532673a12')

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
    make build_dir=build sign_dir="$_destdir" version="v$pkgver" appstore

    # Remove auxiliary script
    rm -f "$_destdir/$_appname/l10n/descriptions/gen_info.xml.sh"
    # Remove references to $srcdir from *.js.map
    find "$pkgdir" -type f -name "*.js.map" | while read file; do
        sed -i "s|webpack://$_appname/$srcdir/$_releasename-v$pkgver/node_modules|webpack://$_appname/./node_modules|" $file
    done
}

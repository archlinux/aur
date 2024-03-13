# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=1.6.1
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://github.com/eneiluj/cospend-nc"
license=('AGPL3')
makedepends=('npm' 'nodejs' 'rsync' 'yq' 'composer')
options=('!strip')
groups=('nextcloud-apps')
source=("cospend-nc-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('47cd88a0767af2c01bedf48dc0f882854ca454c798f474e59ebf161dcd9b2a3d82623086e7c71371a5b85beddc94bd085f14b76c33b191e312fde72851106857')
_releasename=cospend-nc
_appname=cospend

prepare() {
    cd "$srcdir/$_releasename-$pkgver"
    sed -i 's/sudo rm/rm/' makefile
    sed -i 's/^GITHUB_TOKEN :=/#GITHUB_TOKEN :=/' makefile
}

build() {
    cd "$srcdir/$_releasename-$pkgver"
    make
}

_get_nextcloud_versions() {
  _app_min_major_version="$(xq '.info.dependencies.nextcloud["@min-version"]' "$1/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version="$(xq '.info.dependencies.nextcloud["@max-version"]' "$1/appinfo/info.xml"| sed 's/"//g')"
  _app_max_major_version=$(expr ${_app_max_major_version} + 1)
}

package() {
    local _app_min_major_version
    local _app_max_major_version
    _get_nextcloud_versions "$srcdir/$_releasename-$pkgver"
    depends=("nextcloud>=$_app_min_major_version" "nextcloud<$_app_max_major_version")

    cd "$srcdir/$_releasename-$pkgver"
    _destdir="$pkgdir/usr/share/webapps/nextcloud/apps"
    make build_dir=build sign_dir="$_destdir" version="v$pkgver" build_release

    # Remove auxiliary script
    rm -f "$_destdir/$_appname/l10n/descriptions/gen_info.xml.sh"
    # Remove references to $srcdir from *.js.map
    find "$pkgdir" -type f -name "*.js.map" | while read file; do
        sed -i "s|$srcdir|/|g" $file
    done
}


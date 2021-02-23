# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=1.2.9
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://github.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud>=20.0.0')
makedepends=('npm')
options=('!strip')
source=("cospend-nc-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a1e8ebd40114fb4a3bf4539c8b7b9984afb999811c2969ce5a84c2a7114548872fc93bd3ce16d9fa6dbf132eb982f5f221dcb1f709177e38e594ae958795db06')
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

package() {
    cd "$srcdir/$_releasename-$pkgver"
    _destdir="$pkgdir/usr/share/webapps/nextcloud/apps"
    make build_dir=build sign_dir="$_destdir" version="v$pkgver" build_release

    # Remove auxiliary script
    rm -f "$_destdir/$_appname/l10n/descriptions/gen_info.xml.sh"
    # Remove references to $srcdir from *.js.map
    find "$pkgdir" -type f -name "*.js.map" | while read file; do
        sed -i "s|webpack://$_appname/$srcdir/$_releasename-$pkgver/node_modules|webpack://$_appname/./node_modules|" $file
    done
}


# Maintainer: Carlos Galindo <arch -at- cgj.es>

_appname=phonetrack
_releasename=$_appname-oc
pkgname=nextcloud-app-$_appname
pkgver=0.7.0
pkgrel=2
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/$_releasename"
license=('AGPL')
depends=('nextcloud>=20' 'nextcloud<25')
makedepends=('npm' 'rsync')
source=("$url/-/archive/v$pkgver/$_releasename-v$pkgver.tar.gz")
sha512sums=('8cdbc4cbec637dcaaac3a8a823bd52896ea6be2d4a45f22a9fa1e7f5b84bbfe2609f7e75bafa98a1c11aa116e978e6fed933d5e7eac7ec0a9b9f32cbbe66f964')

prepare() {
    cd "$srcdir/$_releasename-v$pkgver"
    sed -i 's/sudo rm/rm/' makefile
}

build() {
    cd "$srcdir/$_releasename-v$pkgver"
    make build
}

package() {
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

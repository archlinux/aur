# Maintainer: Carlos Galindo <arch -at- cgj.es>

pkgname=nextcloud-app-phonetrack
_releasename=phonetrack-oc
pkgver=0.6.7
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/$_releasename"
license=('AGPL')
depends=('nextcloud')
makedepends=('npm')
source=("$url/-/archive/v$pkgver/$_releasename-v$pkgver.tar.gz")
sha512sums=('5a0aeaa0ee3dec12310cc743e2f56a1d4cbe02332c0c0eeccad4d310301ff39ed82eae53dc26684813768453f2c5e66efd6385c476ef7d8bef7f5bc3c3da3bea')

prepare() {
    cd "$srcdir/$_releasename-v$pkgver"
    sed -i 's/sudo rm/rm/' makefile
}

build() {
    cd "$srcdir/$_releasename-v$pkgver"
    npm install babel-eslint --save
    make build
}

package() {
    cd "$srcdir/$_releasename-v$pkgver"
    _destdir="$pkgdir/usr/share/webapps/nextcloud/apps"
    make build_dir=build sign_dir="$_destdir" version="v$pkgver" appstore

    # Remove auxiliary script
    rm -f "$destdir/phonetrack/l10n/descriptions/gen_info.xml.sh"
    # Remove references to $srcdir from *.js.map
    find "$pkgdir" -type f -name "*.js.map" | while read file; do
        sed -i "s|webpack://phonetrack/$srcdir/node_modules|webpack://phonetrack/./node_modules|" $file
    done
}

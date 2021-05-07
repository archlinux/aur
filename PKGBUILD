# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=1.3.4
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://github.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud>=20.0.0')
makedepends=('npm')
options=('!strip')
source=("cospend-nc-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2ea58919e3aadd045c545f956d40570a671856be4d1215da36078e6dee6aa20d2be6cd964a81e9e2a44e6396908580caa557e1dbbf360f36ae8494013c8e3e25')
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

sha512sums=('996b3e56c0f1d9ebb4eb6f5c08ab357ededefac7245b9b45f71a02e40315ce037f888b23b007d633c6b217d5d4037d7fc555e6cec24b93f0885f01973583b72c')
sha512sums=('5bdc8e8f6bf9277a9c078d500dd4669963dc27dc85eeaa1744c1da3447c6b943a2e98b411014c4ddc84d2d28b17e17f162e899a0e52e2333b18a421505307747')

# Maintainer: Carlos Galindo < arch -at_ cgj.es >

pkgname=nextcloud-app-music
pkgver=1.2.0
pkgrel=1
pkgdesc="Music app for Nextcloud and ownCloud"
arch=('any')
url="https://github.com/owncloud/music"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'perl' 'perl-locale-po')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('abcef5840f8343cc916efd79d5af788356d4e74d08dd608e65402d4a292ebf20da02b48d512c8333437419c049ed202abc76edc48cfb78a2a080ad2d28cc5cf2')

prepare() {
    cd "music-$pkgver/build"
    sed -i 's|cd .. && \\|true|' Makefile
    sed -i 's|git archive HEAD --format=zip --prefix=music/ > music.zip && \\|true|' Makefile
    sed -i 's|zip -g music/music.zip music/dist/img|install -D -t $(DESTDIR)/usr/share/webapps/nextcloud/apps/music/dist/img ../dist/img|' Makefile
    sed -i 's|zip -g music/music.zip music|install -D -t $(DESTDIR)/usr/share/webapps/nextcloud/apps/music/dist ..|' Makefile
    sed -i 's|zip -d music/music.zip "music|rm -rf $(DESTDIR)/usr/share/webapps/nextcloud/apps/music|' Makefile
    sed -i 's|"||' Makefile
}

build() {
    cd "music-$pkgver"
    make -C build build l10n-extract l10n-compile
}

package() {
    cd "music-$pkgver"
    _appsdir="$pkgdir/usr/share/webapps/nextcloud/apps"
    mkdir -p "$_appsdir"
    tar -xf ../$pkgname-$pkgver.tar.gz -C "$_appsdir/"
    mv "$_appsdir/music-$pkgver" "$_appsdir/music"
    make -C build DESTDIR="$pkgdir/" release
    find "$pkgdir" -type d -empty -delete
    rm -rf "$_appsdir/music/l10n/.tx"
    rm -rf "$_appsdir/music/l10n/l10n.pl"
    rm -f  "$_appsdir/music/js/.eslint.json"
}

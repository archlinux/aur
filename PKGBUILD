# Maintainer: Carlos Galindo < arch -at_ cgj.es >

pkgname=nextcloud-app-music
pkgver=1.0.3
pkgrel=1
pkgdesc="Music app for Nextcloud and ownCloud"
arch=('any')
url="https://github.com/owncloud/music"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'perl' 'perl-locale-po')
optdepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a7d0a9b302cfa76eab9fa2e53a3916d1cc5da873c7815b08f0af16072b49bfb0199e8e944ccbeb32c082f2d439bd72a63e3aa841eb859923f032755e65ddc4da')

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

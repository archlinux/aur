# Maintainer: Carlos Galindo < arch -at_ cgj.es >

_appname=music
pkgname=nextcloud-app-music
pkgver=1.2.1
pkgrel=1
pkgdesc="Music app for Nextcloud and ownCloud"
arch=('any')
url="https://github.com/owncloud/music"
license=('AGPL3')
depends=('nextcloud')
makedepends=('npm' 'perl' 'perl-locale-po')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('23444780eb13b1a3b143e3a717bed3e87ddda68075b6e732bcfa20c1c288baab9906d5edf8cb1cc6a2c5d898ae728afcd5efd7e5ce84c0242577e05fd33116fc')

build() {
    cd "$_appname-$pkgver"
    make -C build build l10n-extract l10n-compile
}

package() {
    cd "music-$pkgver"
    _appsdir="$pkgdir/usr/share/webapps/nextcloud/apps"
    _appdir="$_appsdir/$_appname"

    # Create the base package from the release files
    mkdir -p "$_appsdir"
    tar -xf ../$pkgname-$pkgver.tar.gz -C "$_appsdir/"
    mv "$_appdir-$pkgver" "$_appdir"

    # Add the generated webpack files to the previously created package
    mkdir -p "$_appdir/dist/img"
    cp dist/*.js dist/*.css dist/*.json "$_appdir/dist/."
    cp dist/img/** "$_appdir/dist/img/."

    # Remove the front-end source files from the package as those are not
    # needed to run the app.
    rm -rf "$_appdir/build"
    rm -rf "$_appdir/css"
    rm -rf "$_appdir/img"
    rm -rf "$_appdir/js"
    find "$_appdir/l10n" -name music.po -delete
    rm -r  "$_appdir/l10n/.tx"
    rm -rf "$_appdir/l10n/templates"
    rm -r  "$_appdir/l10n/l10n.pl"
    rm -rf "$_appdir/tests"

    # Remove metadata and database schema for ownCloud
    rm -rf "$_appdir/appinfo/database.xml"

    # Remove empty directories
    find "$pkgdir" -type d -empty -delete
}

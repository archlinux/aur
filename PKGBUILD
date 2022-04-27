# Maintainer: Carlos Galindo < arch -at_ cgj.es >

_appname=music
pkgname=nextcloud-app-music
pkgver=1.5.1
pkgrel=1
pkgdesc="Music app for Nextcloud and ownCloud"
arch=('any')
url="https://github.com/owncloud/music"
license=('AGPL3')
depends=('nextcloud<24')
makedepends=('npm' 'perl' 'perl-locale-po' 'unzip' 'zip')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fa58e58b4519dbb79c669d292e3540b878f0a07dad68e9942c636206df88e103c9adf3d0d5a37bd85131942832887244bce0ddefd603e59e13e9ffc8f8ec58d0')

prepare() {
    # Generate music.zip that is used when packaging
    mv "$_appname-$pkgver" "$_appname"
    zip -qr "$_appname.zip" "$_appname/"
    # Remove creation of music.zip using git
    cd "$_appname/build"
    sed -i 's/^git/#git/' release.sh
}

build() {
    cd "$_appname"
    make -j1 -C build build
}

package() {
    cd "$_appname"
    _appsdir="$pkgdir/usr/share/webapps/nextcloud/apps"
    _appdir="$_appsdir/$_appname"

    mkdir -p "$_appsdir"
    cp "../$_appname.zip" "$_appname.zip"
    make -j1 -C build release
    cd "$_appsdir"
    unzip -q "$srcdir/music/music-nc.zip"
}


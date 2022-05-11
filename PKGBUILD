# Maintainer: Carlos Galindo < arch -at_ cgj.es >

_appname=music
pkgname=nextcloud-app-music
pkgver=1.5.2
pkgrel=1
pkgdesc="Music app for Nextcloud and ownCloud"
arch=('any')
url="https://github.com/owncloud/music"
license=('AGPL3')
depends=('nextcloud<25')
makedepends=('npm' 'perl' 'perl-locale-po' 'unzip' 'zip')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0bbf9ffc8578d77bf09184003ea1ee59dbf1f5efe798329e857f051fd16199ef3468df91b6016f33cf07321df0ba7eae86fc34e56cb71f05d01d710955764074')

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


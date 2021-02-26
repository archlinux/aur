# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=notify_push
pkgname=nextcloud-app-notify_push
pkgver=0.1.5
pkgrel=2
pkgdesc="Update notifications for nextcloud clients"
arch=("x86_64")
url="https://github.com/nextcloud/notify_push"
license=('AGPL3')
depends=('nextcloud>=21')
makedepends=('rust')
checkdepends=()
optdepends=('redis: use a local redis instance')
install=nextcloud-app-notify_push.install
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.service")
sha512sums=('9b489eccf1495b6f7a41085440f5caf4cbddff7720af339d52a69138cce83b866650dc2a300bdf83bc840fbefc9d70af3b2b6b615e6014725936bf0bbb41f94d'
            '1fe68df3a84770dfc708f1ad8fdf8077e45ea08e5312a5efbe5c4baa310bd4f926e793825c259a31398dc29dbf76ec47943d60aa386f9d64d880737be4004c16')
_target=$CARCH-unknown-linux-gnu

prepare() {
    sed -i "s/ARCH/$CARCH/" "$pkgname.service"
    cd "$_appname-$pkgver"
    cargo fetch --locked --target $_target
}

build() {
    cd "$_appname-$pkgver"
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "$_appname-$pkgver"
    cargo test --release --locked --target-dir=target -- --test-threads 1
}

package() {
    cd "$_appname-$pkgver"
    mkdir -p "$pkgdir/usr/share/webapps/nextcloud/apps"
    _appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
    cp -ar . "$_appdir"
    while read f
    do
        rm -rf -- "$_appdir"/$f
    done < .nextcloudignore
    install -m 755 -Dt "$_appdir/bin/$CARCH/" target/release/notify_push
    install -m 644 -Dt "$pkgdir/usr/lib/systemd/system/" "$srcdir/$pkgname.service"
}

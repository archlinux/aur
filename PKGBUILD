# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=notify_push
pkgname=nextcloud-app-notify_push
pkgver=0.2.2
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
sha512sums=('716d1e53da408e243e7cae7813ac3ffc3b66a1088b64c36b00ad821ab526787e9fe3cb379b2d70959b596a94d9913b9328e5d0da4d58e4f0565bb2227df80712'
            '1fe68df3a84770dfc708f1ad8fdf8077e45ea08e5312a5efbe5c4baa310bd4f926e793825c259a31398dc29dbf76ec47943d60aa386f9d64d880737be4004c16')

prepare() {
    sed -i "s/ARCH/$CARCH/" "$pkgname.service"
    cd "$_appname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_appname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_appname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features -- --test-threads 1
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

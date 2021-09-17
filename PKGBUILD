# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=notify_push
pkgname=nextcloud-app-notify_push
pkgver=0.2.4
pkgrel=1
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
sha512sums=('3faa2f5a95201824a4fb3653988ff96e180ad840b4545cdef55114c16118d510e0b7fbe396a38d6962db520fe9362380e9eac1e17df89f7ab3eda4d9deb3222b'
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

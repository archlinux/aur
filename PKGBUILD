# Maintainer: Jeremy Kescher <jeremy@kescher.at>

_appname=notify_push
pkgname=nextcloud-notify_push
pkgver=0.1.7
pkgrel=1
pkgdesc="Update notifications for nextcloud clients (standalone)"
arch=("x86_64")
url="https://github.com/nextcloud/notify_push"
license=('AGPL3')
makedepends=('rust')
checkdepends=()
optdepends=('redis: use a local redis instance')
install=nextcloud-notify_push.install
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.service.sample")
sha512sums=('f0aa285db50e054ebd76bd90d9dc0f3f1e8e4455e253c87e8698479dac9fd2b68751861da02eaa6ff207b89e5dfd3ecfa1b6d00fe8a8a2ad9445a4540a5a9ee7'
            '071fd59208b4e04bfe789dcdef02da8f3252ada148d0e39a0208927c967b4df07dba6a96e9db811588a52a8c081c3f9a0cbcf02d07ed998e41fff84a872803bb')
_target=$CARCH-unknown-linux-gnu

prepare() {
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
    mkdir -p "$pkgdir/usr/share"
    _appdir="$pkgdir/usr/share/$pkgname"
    install -m 755 -Dt "$_appdir/" target/release/notify_push
    install -m 644 -Dt "$_appdir/" "$srcdir/$pkgname.service.sample"
    install -m 644 -Dt "$_appdir/" "README.md"
}

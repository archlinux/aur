# Maintainer: Jeremy Kescher <jeremy@kescher.at>

_appname=notify_push
pkgname=nextcloud-notify_push
pkgver=0.1.5
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
sha512sums=('9b489eccf1495b6f7a41085440f5caf4cbddff7720af339d52a69138cce83b866650dc2a300bdf83bc840fbefc9d70af3b2b6b615e6014725936bf0bbb41f94d'
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

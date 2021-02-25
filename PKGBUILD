# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=notify_push
pkgname=nextcloud-app-notify_push
pkgver=0.1.4
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
sha512sums=('d96ad26fff3005e32bf5a9dff925776c56e90b5ff9d7ea212c4417743e64b24a9ee0fc93082a4cd118f3a0b06b8db82b6fce13a62035750c5d00448d64f1923f'
            'b1ca868d3345e7fea82128f6f193141a5401e20611e38fecbe7876e17b172668f11ce8bc9984a10c5582152b899d46606298cc24f721e251c015a5af6bc2a047')
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

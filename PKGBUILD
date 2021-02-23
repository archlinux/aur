# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=notify_push
pkgname=nextcloud-app-notify_push
pkgver=0.1.3
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
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
source_x86_64=("$pkgname-x86_64.service")
sha512sums=('c0e62769ae3cfc2f1091a459278a5ae70e69b4b1d49cd60469c51f6cedc7a26402465fe1406cf5ad83f7270a45ed5d0938248e489173783dbe3f20c04c8c8cf1')
sha512sums_x86_64=('be5b2e0fadaff8578882804a553a0da1c7305510548075dd06125832e88157adad4f15305aa3c6cfad9198bb8123d09706f19cfc77df8606bdd693ab240cb3aa')
_target=$arch-unknown-linux-gnu

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
    _appdir="$pkgdir/usr/share/webapps/nextcloud/apps/$_appname"
    mkdir -p "$_appdir"
    cp -ar lib appinfo README.md "$_appdir"
    mkdir -p "$_appdir/bin/$arch"
    install -m 755 -t "$_appdir/bin/$arch/" target/release/notify_push
    install -m 644 -D "$srcdir/$pkgname-$arch.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

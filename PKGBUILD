# Maintainer: niklassc <niklassc@niklassc.xyz>

pkgname=pass-secret-service-runit
_pkgname=pass-secret-service
pkgver=0.7.0
pkgrel=1
pkgdesc='Implementation of org.freedesktop.secrets using pass without systemd integration'
arch=('x86_64' 'aarch64')
url='https://github.com/niklassc-xyz/pass-secret-service'
license=('GPL-3.0-only')
depends=('dbus' 'gcc-libs' 'glibc' 'gnupg')
makedepends=('cargo' 'git')
provides=("$_pkgname=$pkgver" 'org.freedesktop.secrets')
conflicts=('pass-secret-service' 'pass-secret-service-bin' 'pass-secret-service-git')
_commit='2a77a58a5ac60f0e0567d1a7cb58feee8e2995ad'
source=("$_pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    cargo build --frozen --release
}

check() {
    cd "$_pkgname"
    cargo test --frozen
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 systemd/org.freedesktop.secrets.service "$pkgdir/usr/share/dbus-1/services/org.freedesktop.secrets.service"
    sed -i '/^SystemdService=/d' "$pkgdir/usr/share/dbus-1/services/org.freedesktop.secrets.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

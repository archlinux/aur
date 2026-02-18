# Maintainer: Lenar Imamutdinov <lenar dot imamutdinov at gmail dot com>
_pkgname=wlcontrol
pkgname=${_pkgname}-git
pkgver=0.1.0.r2.g14bc315
pkgrel=1
pkgdesc="WiFi and Bluetooth control app, built with GTK4/libadwaita"
arch=('x86_64')
url="https://github.com/neoden/wlcontrol"
license=('MIT')
depends=('gtk4' 'libadwaita' 'dbus')
makedepends=('git' 'cargo' 'blueprint-compiler' 'gcc' 'pkgconf')
optdepends=(
    'iwd: WiFi support'
    'bluez: Bluetooth support'
)
provides=('wlcontrol')
conflicts=('wlcontrol')
options=(!lto)
source=("git+https://github.com/neoden/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "data/dev.neoden.wlcontrol.desktop" "$pkgdir/usr/share/applications/dev.neoden.wlcontrol.desktop"
    install -Dm644 "data/icons/hicolor/scalable/apps/dev.neoden.wlcontrol.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.neoden.wlcontrol.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

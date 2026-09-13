# Maintainer: pentago <876756+pentago@users.noreply.github.com>

pkgname=waybar-niri-focused-workspaces
pkgver=0.1.0
pkgrel=1
pkgdesc='Waybar module showing the niri workspaces of the focused output on every bar'
arch=('x86_64')
url='https://github.com/pentago/waybar-niri-focused-workspaces-module'
license=('MIT')
depends=('gcc-libs' 'glib2' 'glibc' 'gtk3')
makedepends=('cargo' 'scdoc')
optdepends=('niri: the compositor this module talks to')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
    make man/waybar-niri-focused-workspaces.5
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    # Packages must stay under /usr; /usr/local is the local admin's territory.
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

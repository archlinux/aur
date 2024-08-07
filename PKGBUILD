# Maintainer: Felix Morgner <felix.morgner@gmail.com>

pkgname=inhibridge
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple daemon that bridges freedesktop.org ScreenSaver inhibitions to systemd-inhibit"
url="https://codeberg.org/Scrumplex/inhibridge"
license=("GPL-3.0-or-later AND AGPL-3.0-or-later AND CC0-1.0")
source=("https://codeberg.org/Scrumplex/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3c4abca51c75ead11985d81b7cffea1007c0e43a8bcefbd996085f9e4eb06add')
b2sums=('49f68165336320663d56f97018a4f00753fd233f56d002d0f81983615f5f12fd530cd430b95320a8b5e8a28ac58f7264c40891d753e0e35ec6a33301afd169d8')
arch=("x86_64")
depends=("dbus" "systemd")
makedepends=("cargo")

prepare() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSES/*
}

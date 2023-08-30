# Maintainer: FlorianNAdam

_pkgname=persistent-evdev-rs
pkgname=persistent-evdev-rs-git
pkgver=r9.a39594a
pkgrel=1
pkgdesc="Persistent proxy for evdev devices"
arch=("x86_64")
url="https://github.com/FlorianNAdam/persistent-evdev-rs"
license=("MIT")
provides=("persistent-evdev-rs")
conflicts=("persistent-evdev-rs")
makedepends=(cargo)
source=('git+https://github.com/FlorianNAdam/persistent-evdev-rs')
sha256sums=('SKIP')
backup=(
    "etc/persistent-evdev-rs/config.json"
)

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ${_pkgname}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${_pkgname}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd ${_pkgname}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${_pkgname}
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 config.json "$pkgdir/etc/persistent-evdev-rs/config.json"
    install -Dm644 systemd/persistent-evdev-rs.service "$pkgdir/usr/lib/systemd/system/persistent-evdev-rs.service"
    install -Dm644 udev/60-persistent-input-rs-uinput.rules "$pkgdir/usr/lib/udev/rules.d/60-persistent-input-rs-uinput.rules"
}

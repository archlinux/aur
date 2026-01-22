# Maintainer: Bruno Miguel <bruno@privacyrequired.com>
pkgname=kdotool-git
pkgver=0.2.1.1ad61ac
pkgrel=2
pkgdesc="xdotool-like for KDE Wayland"
arch=("x86_64")
url="https://github.com/jinliu/kdotool"
source=("git+https://github.com/jinliu/kdotool")
license=("Apache-2.0")
depends=("plasma-wayland-protocols")
makedepends=("git" "rust" "cargo")
depends=("dbus" "gcc-libs" "glibc")
makedepends=("cargo")
provides=("kdotool")
conflicts=("kdotool")
sha256sums=("SKIP")
md5sums=("SKIP")

pkgver() {
    cd "$provides"
    git describe --long --abbrev=7 | sed "s/^v//;s/\([^-]*-g\)//;s/-/./g"
}

prepare() {
    cd "$provides"
    export RUSTUP_TOOLCHAIN="stable"
    cargo fetch --locked --target "$(rustc -vV | sed -n "s/host: //p")" --manifest-path="Cargo.toml"
}

build() {
    cd "$provides"
    export RUSTUP_TOOLCHAIN="stable"
    export CARGO_TARGET_DIR="target"
    cargo build --release --frozen --all-features --manifest-path="Cargo.toml"
}

check() {
    cd "$provides"
    export RUSTUP_TOOLCHAIN="stable"
    export CARGO_TARGET_DIR="target"
    cargo test --frozen --all-features --manifest-path="Cargo.toml"
}

package() {
    install -Dm755 "$srcdir/$provides/target/release/kdotool" "$pkgdir/usr/bin/kdotool"
    install -Dm755 "$srcdir/$provides/LICENSE" "$pkgdir/usr/share/licenses/$provides/LICENSE"
}



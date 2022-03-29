# Maintainer: Wiktor Kwapisiewicz <wiktor@metacode.biz>

pkgname=oled-notifier-git
pkgver=0.1
pkgrel=1
license=('APL')
url="https://github.com/wiktor-k/oled-notifier"
# The package can be built on amd64 but will work only on aarch64
arch=('any')
makedepends=(cargo git clang)
source=("oled-notifier::git+https://github.com/wiktor-k/oled-notifier")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
sha512sums=('SKIP')
pkgdesc="Provides simple statistics for ODROID-HC4 with OLED device."

build() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_MUSL_RUSTFLAGS="-Clink-self-contained=yes -Clinker=rust-lld"
    export AR_aarch64_unknown_linux_musl=llvm-ar
    export CC_aarch64_unknown_linux_musl=clang
    cargo build --bin main --release --target aarch64-unknown-linux-musl

}

check() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --verbose --lib
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    cp "target/aarch64-unknown-linux-musl/release/main" "target/${pkgname%-git}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/${pkgname%-git}"
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "contrib/${pkgname%-git}.service"
}

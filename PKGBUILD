# Maintainer: Sienna <i@kals.dev>
pkgname=vollminputd-git
pkgver=0.1.1.3.g9c81bba
pkgrel=2
pkgdesc="LLM-based voice input method for Linux Wayland"
arch=('x86_64')
url="https://github.com/ad2248/vollminputd"
license=('Apache-2.0')
depends=('wl-clipboard' 'openssl' 'alsa-lib' 'libpipewire')
makedepends=('rust>=1:1.87' 'git' 'clang')
# GCC LTO objects in libspa's C shims cannot be linked by Rust's lld.
options=('!lto')
source=("vollminputd::git+https://github.com/ad2248/vollminputd.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/vollminputd"
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/./g' || echo "0.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/vollminputd"
    # Use the versioned distro dependency, not an older ~/.cargo/bin rustup shim.
    RUSTC=/usr/bin/rustc CARGO_TARGET_DIR=target /usr/bin/cargo build --locked --release
}

check() {
    cd "${srcdir}/vollminputd"
    RUSTC=/usr/bin/rustc RUSTDOC=/usr/bin/rustdoc CARGO_TARGET_DIR=target /usr/bin/cargo test --locked
}

package() {
    cd "${srcdir}/vollminputd"
    install -Dm755 "target/release/vollminputd" "${pkgdir}/usr/bin/vollminputd"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Maintainer: Will McCracken <tsa@lattefiend.com>
pkgname=tsa-git
pkgver=0.1.0.r0.g37da045
pkgrel=1
pkgdesc="CLI tool for managing Tailscale devices and users"
arch=('x86_64' 'aarch64')
url="https://github.com/wmccracken/tsa"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
optdepends=('tailscale: required for signing locked-out devices')
provides=('tsa')
conflicts=('tsa')
options=(!debug !lto)
source=("$pkgname::git+https://github.com/wmccracken/tsa.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    #cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/tsa" "$pkgdir/usr/bin/tsa"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

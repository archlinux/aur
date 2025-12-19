
# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=feluda
pkgver=1.10.3
pkgrel=4
_commit=4b55730
pkgdesc='Detect license usage restrictions in your project'
arch=('x86_64' 'aarch64')
url="https://github.com/anistark/$pkgname"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url#commit=${_commit}?signed")
sha256sums=('1e02ac671f0ba4ab7e28a0c1bac0a6e5e1f4a5258cd20a80f57bdab74667504e')
validpgpkeys=('40B91E0A4E89F8434EA16C9E9864F6B815BC2B00') # Kumar Aniruhda
options=('!lto')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=false
    export CARGO_PROFILE_RELEASE_STRIP=symbols
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/ --remap-path-prefix=$(pwd)=/"
    export OPENSSL_NO_VENDOR=1
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export OPENSSL_NO_VENDOR=1
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

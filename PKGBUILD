# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=bitbucket-cli
pkgver=0.3.18
pkgrel=1
pkgdesc="A powerful command-line interface for Bitbucket Cloud - manage repos, PRs, issues, and pipelines from your terminal with OAuth 2.0"
arch=('x86_64' 'aarch64')
url="https://github.com/quinnjr/bitbucket-cli"
license=('MIT')
depends=('dbus' 'gcc-libs' 'glibc')
makedepends=('cargo' 'dbus' 'pkgconf')
options=('!lto')
optdepends=(
    'gnome-keyring: store credentials in GNOME Keyring via Secret Service'
    'kwallet: store credentials in KDE Wallet via Secret Service'
)
provides=('bitbucket')
source=("$pkgname-$pkgver.tar.gz::https://github.com/quinnjr/bitbucket-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69a4e88c1f39cb1622aba31293723f1bb9e87937a40076523fef8c77af4734b0')

_rust_env() {
    export RUSTUP_TOOLCHAIN=stable
    # Upstream enables release LTO; disable for distro builds to avoid LLVM
    # bitcode mismatches when CC points at system clang (LLVM 22) vs rustc (LLVM 21).
    export CARGO_PROFILE_RELEASE_LTO=false
    unset CC CXX CFLAGS CXXFLAGS LDFLAGS
}

prepare() {
    cd "$pkgname-$pkgver"
    _rust_env
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    _rust_env
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    _rust_env
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/bitbucket" "$pkgdir/usr/bin/bitbucket"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

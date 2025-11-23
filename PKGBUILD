# Maintainer: os-guy-original <https://github.com/os-guy-original>

pkgname=khazaur
pkgver=0.2.0beta
pkgrel=1
pkgdesc='Unified package manager for Arch Linux supporting AUR, repos, Flatpak, Snap, and Debian packages'
arch=('x86_64' 'aarch64')
url='https://github.com/os-guy-original/khazaur'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libgit2' 'libssh2' 'openssl' 'zlib')
makedepends=('cargo' 'git')
optdepends=(
    'flatpak: Flatpak application support'
    'snapd: Snap package support'
    'debtap: Debian package conversion support'
    'pkexec: Privilege escalation (polkit)'
    'sudo: Privilege escalation (alternative to pkexec)'
    'doas: Privilege escalation (alternative to pkexec/sudo)'
)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install binary
    install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
    
    # Install documentation
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname"
    
    # Install license
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

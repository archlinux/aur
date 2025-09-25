# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=pam-ssh-agent
pkgver=0.9.5
pkgrel=1
pkgdesc='PAM module for ssh-agent based authentication'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://crates.io/crates/pam-ssh-agent'
license=('MIT')
makedepends=('cargo')
depends=('pam' 'sudo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('20cc16dd1d841590ac2006abd44cc63c2d6c5dbd654c0cc6e36f28933afd8c00')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cd $pkgname-$pkgver
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-$pkgver
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/libpam_ssh_agent.so -T "$pkgdir/usr/lib/security/pam_ssh_agent.so"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}

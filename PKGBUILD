# Maintainer: Zachary <zacharyftw@users.noreply.github.com>
pkgname=ironkey-git
pkgver=0.1.3.r30.g30e251c
pkgrel=1
pkgdesc="An encrypted terminal password manager with AES-256-GCM vault and Argon2id key derivation"
arch=('x86_64')
url="https://github.com/zacharyftw/IronKey"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=('wl-clipboard: Wayland clipboard support')
provides=('ironkey')
conflicts=('ironkey')
source=("git+https://github.com/zacharyftw/IronKey.git")
sha256sums=('SKIP')

pkgver() {
    cd IronKey
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.1.3.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd IronKey
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd IronKey
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd IronKey
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test
}

package() {
    cd IronKey
    install -Dm755 "target/release/ironkey" "$pkgdir/usr/bin/ironkey"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

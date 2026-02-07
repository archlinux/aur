# Maintainer: Ninso112 <Ninso112@pm.me>
pkgname=rustwhy-git
pkgver=r4.78c2fb1
pkgrel=1
pkgdesc="Unified Linux system diagnostics - understand WHY things happen"
arch=('x86_64')
url="https://github.com/Ninso112/rustwhy"
license=('GPL-3.0')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
optdepends=('nvidia-utils: For NVIDIA GPU support')
provides=('rustwhy')
conflicts=('rustwhy')
source=("$pkgname::git+https://github.com/Ninso112/rustwhy.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --offline --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --offline
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/rustwhy" "$pkgdir/usr/bin/rustwhy"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

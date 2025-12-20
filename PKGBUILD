# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=purrcrypt
_commit=793d83a
pkgver=r15.$_commit
pkgrel=2
pkgdesc='An encryption tool that disguises secrets as adorable cat and dog sounds'
arch=('aarch64' 'armv7h' 'i686' 'pentium4' 'riscv64' 'x86_64')
url="https://github.com/vxfemboy/$pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
source=("git+$url#commit=$_commit")
b2sums=('d24a1aea5a746cc7e5635c1a951af673b9116f263f9d0721c998ed615a47e43c6acef55b97e67c73806ec36567553a5b7b389598dbb3b79aba90ad8cbbd5f255')

prepare() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target $(rustc --print host-tuple)
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname
    install -Dm755 target/release/purr "$pkgdir/usr/bin/purr"
    install -Dm644 $pkgname-demo.gif "$pkgdir/usr/share/doc/$pkgname/demo.gif"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

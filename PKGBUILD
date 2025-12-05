# Maintainer: Breno Rocha <bhrochamail at gmail dot com>
pkgname=expresso-kit
pkgver=0.1.0
pkgrel=1
pkgdesc='Automated project validator for local/cloud environments with TUI and CLI support'
arch=('x86_64' 'aarch64')
url='https://github.com/amindWalker/expresso-kit'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=(
    'docker: container runtime support'
    'docker-compose: multi-container orchestration'
    'git: repository cloning and validation'
)
conflicts=('expresso-kit-bin' 'expresso-kit-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
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
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

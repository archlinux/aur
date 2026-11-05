# Maintainer: Jordon de Hoog <jordon.dehoog@gmail.com>
pkgname=dfdu
pkgver=0.6.0
pkgrel=1
pkgdesc="Disk usage browser for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/jordond/dfdu"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0641c4bb07727c84baa33c3fcad5008619972b9f7036c35d9a6369893a7741a3')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p dfdu
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/dfdu "$pkgdir/usr/bin/dfdu"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 assets/man/*.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 assets/completions/dfdu.bash "$pkgdir/usr/share/bash-completion/completions/dfdu"
    install -Dm644 assets/completions/_dfdu "$pkgdir/usr/share/zsh/site-functions/_dfdu"
    install -Dm644 assets/completions/dfdu.fish "$pkgdir/usr/share/fish/vendor_completions.d/dfdu.fish"
}

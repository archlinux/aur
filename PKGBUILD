# Maintainer: Jordon de Hoog <jordon.dehoog@gmail.com>
pkgname=dfdu
pkgver=0.5.2
pkgrel=1
pkgdesc="Disk usage browser for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/jordond/dfdu"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a4522d100818224f9fd93ca4048eef391ad174b1d55414932aefb0047bfb51fd')

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

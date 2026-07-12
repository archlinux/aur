# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=pyproject-udeps
pkgver=0.3.3
pkgrel=1
pkgdesc='Find unused dependencies in pyproject.toml'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/pyproject-udeps'
license=('BlueOak-1.0.0')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('pyproject-udeps-bin')
# !debug: cargo --release already strips; the auto-generated -debug
#   subpackage is noise for AUR distribution.
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lukehsiao/pyproject-udeps/archive/v$pkgver.tar.gz")
sha256sums=('2781151911ac663b519b0938c16527d56cc920b40d9f82075c67043ba23edf60')

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
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/pyproject-udeps "$pkgdir/usr/bin/pyproject-udeps"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

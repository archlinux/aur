# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=CodeSnap
pkgname=codesnap
pkgver=0.8.2
pkgrel=1
pkgdesc="Pure Rust tool for generating beautiful code snapshots"
arch=('x86_64' 'aarch64')
url="https://github.com/mistricky/$_pkgname"
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ec290aa2d7ae4ca42ed9752829ec922dc830a0e2756e785548d80a0823a1fb5a')
makedepends=('rustup' 'gcc-libs')
depends=('glibc' 'oniguruma')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C link-arg=/usr/lib/libonig.so"
    cd "$_pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# Contributor: mcp <mcp@praeger.org>

pkgname=tztail-git
pkgver=1.2.0.r4.g6c94e13
pkgrel=1
pkgdesc='Allows you to view logs in the timezone you want'
arch=('x86_64')
url='https://github.com/thecasualcoder/tztail'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('tztail')
conflicts=('tztail')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/.r/;s/-/./g';
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/tztail"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
}

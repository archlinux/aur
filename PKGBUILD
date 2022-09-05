# Maintainer: Jeff Dickey <releases at chim dot sh>

pkgname=chim
pkgver=1.0.2
pkgrel=1
pkgdesc='Cross-platform binary shims with optional remote fetching'
arch=('x86_64' 'aarch64')
url='https://chim.sh'
license=('MIT')
makedepends=('cargo' 'git')
provides=('chim')
conflicts=('chim')
source=("git+https://github.com/jdxcode/chim.git")
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    cd $pkgname
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $pkgname
    install -Dm755 "target/release/$pkgname" \
        -t "$pkgdir/usr/bin"
    install -Dm644 LICEN?E \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

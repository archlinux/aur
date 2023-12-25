# Maintainer: Michael Bromilow <dev at mail subdomain of bromilow dot uk>

pkgname=oxeylyzer-git
pkgver=r364.d40c28f
pkgrel=1
pkgdesc="Alternative keyboard layout analyzer"
url="https://github.com/O-X-E-Y/oxeylyzer"
license=('Apache')
arch=('x86_64')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/O-X-E-Y/oxeylyzer')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/${pkgname%-git}"
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm0755 -t "$pkgdir/usr/bin" "target/release/${pkgname%-git}"
}

# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=galette-git
pkgver=r189.af52987
pkgrel=1
pkgdesc='A GAL assembler for the 21st Century'
arch=('x86_64')
url='https://github.com/simon-frankau/galette'
license=('MIT')
depends=(gcc-libs glibc)
makedepends=(cargo git)
provides=(galette)
conflicts=(galette)
source=("$pkgname::git+https://github.com/simon-frankau/galette.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

check() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/galette"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

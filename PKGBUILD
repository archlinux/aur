# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=pizauth-git
_pkgname="${pkgname%-git}"
pkgver=1.0.3.r19.gf32cb2f
pkgrel=1
pkgdesc="OAuth2 token requester daemon"
arch=('i686' 'x86_64')
url="https://github.com/ltratt/${_pkgname}"
license=('custom')
provides=("$_pkgname")
makedepends=(cargo)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags \
        | sed "s/^$_pkgname-//;"'s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    make \
        PREFIX='/usr' \
        EXAMPLESDIR='/usr/share/' \
        DESTDIR="$pkgdir/" \
        install
}

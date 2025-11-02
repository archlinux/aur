# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=pizauth-git
_pkgname="${pkgname%-git}"
pkgver=1.0.8.r0.g617fff4
pkgrel=1
pkgdesc="OAuth2 token requester daemon"
arch=('i686' 'x86_64')
url="https://github.com/ltratt/${_pkgname}"
license=('MIT' 'Apache-2.0')
provides=("$_pkgname")
makedepends=(git cargo)
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
    #cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS+=('-ffat-lto-objects')
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
        USESYSTEMD=1 \
        PREFIX='/usr' \
        EXAMPLESDIR='/usr/share/' \
        DESTDIR="$pkgdir/" \
        install
}

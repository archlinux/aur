# Maintainer: chitaotao <chotaotao1qaz2wsx at gmail dot com>

_name='awatcher'
pkgname="$_name-git"
pkgver=r85.cba6687
pkgrel=1
pkgdesc="Activity and idle watchers"
arch=('x86_64')
url="https://github.com/2e3s/$_name"
license=('MPL2')

depends=(
    activitywatch
)
makedepends=(
    git
    cargo
)
provides=(${_name})
conflicts=(
    ${_name}
    aw-${_name}
)

source=("${_name}::git+$url")
sha256sums=('SKIP')


pkgver() {
    cd "${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_name}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_name}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release

    mv ./target/release/${_name} ./target/release/aw-${_name} 
}

package() {
    cd "${_name}"
    install -Dm0755 ./target/release/aw-${_name} -t "${pkgdir}/usr/bin"
}


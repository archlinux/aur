# Maintainer: chitaotao <chotaotao1qaz2wsx at gmail dot com>

_name='awatcher'
pkgname="$_name-git"
pkgver=0.3.0.r3.ga045780
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
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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


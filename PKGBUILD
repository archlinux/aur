# Maintainer: ScreamsInJank <screamsinjank@proton.me>

_name='aw-watcher-window-wayland'
pkgname="$_name-git"
pkgver=r33.6108ad3
pkgrel=1
pkgdesc="window and afk watcher for wayland"
arch=('x86_64')
url="https://github.com/ActivityWatch/$_name"
license=('MPL2')
depends=(
    activitywatch-bin
    aw-client
    gcc-libs
)
makedepends=(
    git
    rust
)
optdepends=()

provides=(${_name})
conflicts=(
    ${_name}
    aw-watcher-window
    aw-watcher-afk
)

source=("${_name}::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "${_name}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
prepare() {
    cd "${_name}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {

    cd "${_name}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release

}
package() {
    cd "${_name}"
    install -Dm0755 ./target/release/aw-watcher-window-wayland -t "${pkgdir}/usr/bin/"
}

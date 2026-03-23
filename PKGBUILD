# Maintainer: Jimmy Bonney <jimmy at furtivebot dot com>
pkgname=scrollshot-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland scrolling screenshot tool for wlroots-based compositors"
arch=('x86_64')
url="https://github.com/jbonney/scrollshot"
license=('MIT')
depends=('wayland')
makedepends=('cargo' 'git')
provides=('scrollshot')
conflicts=('scrollshot')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd scrollshot
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd scrollshot
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd scrollshot
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd scrollshot
    install -Dm755 "target/release/scrollshot" "${pkgdir}/usr/bin/scrollshot"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

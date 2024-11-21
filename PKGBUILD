# Maintainer: Trevor Last <trevorclast at gmail dot com>
pkgname=fir-git
pkgver=0.1.0
pkgrel=2
pkgdesc='Simple image viewer for Wayland.'
arch=('x86_64')
url='https://github.com/Treecase/fir'
license=('GPL-3.0-or-later')
groups=()
depends=(
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'sdl2'
)
makedepends=(
    'cargo'
    'git'
    'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('!debug')
install=
source=('git+https://github.com/Treecase/fir.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    cargo metadata --no-deps --format-version=1 | jq -r .packages[0].version
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm0644 -t "${pkgdir}/usr/share/applications" "data/com.github.treecase.fir.desktop"
    install -Dm0644 -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps" "data/com.github.treecase.fir.png"
    install -Dm0644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" "data/com.github.treecase.fir.svg"
}

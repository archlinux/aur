# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tusic-git
_pkgname=tusic
pkgver=0.1.3.r0.g7ce5e33
pkgrel=1
pkgdesc='Lightweight TUI Music Player. Play from YouTube or ~/Music folder easily.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/eminfedar/tusic'
license=('MIT')
depends=('yt-dlp')
makedepends=(
    'git'
    'cargo'
    'patch'
)
options=(
    !debug
    !lto
)
provides=('tusic')
conflicts=('tusic' 'tusic-bin')
source=(
    "${_pkgname}-main::git+$url.git#branch=main"
    '0001-use-yt-dlp-from-system.patch'
)
sha256sums=(
    'SKIP'
    'a5d50a8f71978732320819126fc745c296c04c6c2721b79c931e3e1d25f35df5'
)

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    patch -p1 < ../0001-use-yt-dlp-from-system.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/tusic "$pkgdir/usr/bin/tusic"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:

# Maintainer: Gallifreyan <gallifreyan at protonmail dot ch>

pkgname=ngrrram-git
pkgver=1.0.3.r2.gac122c3
pkgrel=1
pkgdesc='A TUI tool to help you type faster and learn new layouts. Includes a free cat.'
arch=(
    'i686'
    'x86_64'
)
url="https://github.com/wintermute-cell/ngrrram"
license=("GPL-3.0-only")

depends=(
    'gcc-libs'
    'glibc'
)
makedepends=(
    'cargo'
    'git'
)
provides=('ngrrram')
conflicts=('ngrrram')

source=("$pkgname::git+https://github.com/wintermute-cell/ngrrram.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-features
}

package() {
    install -Dm755 "$pkgname/target/release/ngrrram" "$pkgdir/usr/bin/ngrrram"
}

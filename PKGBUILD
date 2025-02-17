# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Henrik Laxhuber <henrik at laxhuber dot com>

_pkgname=texlab
pkgname=$_pkgname-git
pkgver=5.12.0.r0.b4c5d27
pkgrel=1
pkgdesc='An implementation of the Language Server Protocol for LaTeX'
arch=(any)
url=https://github.com/latex-lsp/texlab
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(git cargo)
source=(git+$url)
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --tags --long --abbrev=7 |\
        sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$srcdir"/$_pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build () {
    cd "$srcdir"/$_pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir"/$_pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace --all-features
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname CHANGELOG.md README.md
}

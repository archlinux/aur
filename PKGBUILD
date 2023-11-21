# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Henrik Laxhuber <henrik at laxhuber dot com>

_pkgname=texlab
pkgname=$_pkgname-git
pkgver=5.11.0.r16.867dbc91
pkgrel=3
pkgdesc='An implementation of the Language Server Protocol for LaTeX'
arch=(any)
url=https://github.com/latex-lsp/texlab
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname $_pkgname-bin)
makedepends=(git cargo)
source=(git+$url)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --tags --long | \
        sed -e 's/\([^-]*-\)g/r\1/' -e 's/-/./g' -e 's/^v//'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir"/$_pkgname
    cargo update
    cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build () {
    cd "$srcdir"/$_pkgname
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir"/$_pkgname
    cargo test --frozen --workspace --all-features
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm 755 -t "$pkgdir"/usr/bin target/release/$_pkgname
    install -Dm 644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    mkdir -p "$pkgdir"/usr/share/doc/$_pkgname
    install -Dm 644 CHANGELOG.md README.md "$pkgdir"/usr/share/doc/$_pkgname
}

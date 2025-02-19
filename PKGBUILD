# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Henrik Laxhuber <henrik at laxhuber dot com>

_pkgname=texlab
pkgname=$_pkgname-git
pkgver=5.22.1.r4.1f08c3a
pkgrel=2
pkgdesc='An implementation of the Language Server Protocol for LaTeX'
arch=(any)
url=https://github.com/latex-lsp/texlab
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname)
depends=(gcc-libs glibc)
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
    cargo build --frozen --release
}

check() {
    cd "$srcdir"/$_pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname CHANGELOG.md README.md
}

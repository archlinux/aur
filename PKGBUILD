# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=zola
pkgname=$_pkgname-git
pkgver=0.20.0.r3.38a5a72
pkgrel=1
pkgdesc='A fast static site generator in a single binary with everything built-in'
arch=(x86_64)
url=https://github.com/getzola/zola
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname)
depends=(gcc-libs glibc)
makedepends=(git cargo)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --tags --long --abbrev=7 |\
        sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$srcdir"/$_pkgname
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"/$_pkgname
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir"/$_pkgname
    cargo test --frozen --workspace
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname CHANGELOG.md README.md
}

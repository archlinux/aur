# Maintainer: Sergio Carmine <me@sergiocarmi.net>

_pkgname=baseic
pkgname=baseic-git
pkgver=0.1.0.r0.b8f68be
pkgrel=1
pkgdesc='A simple numeric conversion tool'
arch=(x86_64)
url=https://github.com/carmisergio/baseic
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname)
depends=(gcc-libs glibc)
makedepends=(git cargo)
source=(git+$url)
sha256sums=(SKIP)
options=(!lto)

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --tags --long --abbrev=7 |\
        sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$srcdir"/$_pkgname
    cargo update
    cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
    cd "$srcdir"/$_pkgname
    cargo build --frozen --release 
}

check() {
    cd "$srcdir"/$_pkgname
    cargo test --frozen
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname \
        README.md
}


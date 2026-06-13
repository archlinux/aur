# Maintainer: kekmacska <kekmacska2@proton.me>
pkgname=subrandr-git
pkgver=1.3.0.r20.g0418ae3
pkgrel=1
pkgdesc="A subtitle rendering library for SRV3 (YouTube) and WebVTT (development build)"
arch=('x86_64')
url="https://github.com/afishhh/subrandr"
license=('MPL-2.0')
depends=()
makedepends=('cargo' 'git')
provides=('subrandr')
conflicts=('subrandr')
source=("git+https://github.com/afishhh/subrandr.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/subrandr"
    git describe --long --tags --always | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
    cd "$srcdir/subrandr"

    cargo rustc --release -- \
        -C target-cpu=native \
        -C opt-level=3 \
        -C codegen-units=1 \
        -C strip=symbols \
        -C lto=no \
        -C link-arg=-fno-plt \
        -C link-arg=-Wl,-O1 \
        -C link-arg=-Wl,--as-needed \
        -C link-arg=-Wl,--sort-common \
        -C link-arg=-Wl,--gc-sections
}

package() {
    cd "$srcdir/subrandr"

    install -Dm755 "target/release/libsubrandr.so" \
        "$pkgdir/usr/lib/libsubrandr.so"
}

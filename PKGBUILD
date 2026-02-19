# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=rustanka-git
pkgver=v0.0.26.r4.g05885aa
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/grafana/rustanka"
license=('MIT')
depends=('mimalloc')
makedepends=('cargo' 'nasm' 'mold' 'mimalloc')
source=("git+https://github.com/grafana/rustanka.git#branch=master")
sha512sums=('SKIP')

provides=(rustanka)
conflicts=(rustanka)

pkgver() {
    cd "$srcdir/rustanka"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/rustanka"

    # Force use of mold linker instead of lld to fix ring crate linking issues
    export RUSTFLAGS="-C link-arg=-fuse-ld=mold -C link-arg=-lmimalloc"
    cargo build --release --locked --package rtk
}

check() {
    cd "$srcdir/rustanka"

    export RUSTFLAGS="-C link-arg=-fuse-ld=mold -C link-arg=-lmimalloc"
    cargo test --release --locked --package rtk
}

package() {
    cd "$srcdir/rustanka"

    install -Dm755 "target/release/rtk" "$pkgdir/usr/bin/rtk"
}

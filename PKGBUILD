# Submitter: Eric Rodrigues Pires <archlinux@ericpires.com.br>
pkgname='sandhole'
pkgver='0.9.5'
pkgrel=1
pkgdesc='Expose HTTP/SSH/TCP services through SSH port forwarding'
arch=('x86_64' 'aarch64')
url='https://sandhole.com.br'
license=('MIT')
depends=()
makedepends=('cargo' 'cmake' 'clang' 'perl')
checkdepends=('cargo-nextest')
provides=('sandhole')
conflicts=('sandhole-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EpicEric/sandhole/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77c5214f1acf4c4a1af721f48dc15eaf630f03e8ed4be8985bb3235c7cf6ec39')

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"

    export CARGO_TARGET_DIR=target
    export CC=clang
    export CXX=clang++

    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"

    export CARGO_TARGET_DIR=target

    cargo nextest run --release --profile no-network
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

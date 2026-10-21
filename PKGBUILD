# Submitter: Eric Rodrigues Pires <archlinux@ericpires.com.br>
pkgname='sandhole'
pkgver='0.10.4'
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
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/sandhole/sandhole/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f8fc353aa4a3fbc77feca7dfcc32986577e66834ad9262bc9724786b8919517')

prepare() {
    cd "$pkgname"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"

    export CARGO_TARGET_DIR=target
    export CC=clang
    export CXX=clang++

    cargo build --frozen --release
}

check() {
    cd "$pkgname"

    export CARGO_TARGET_DIR=target

    cargo nextest run --release --profile no-network
}

package() {
    cd "$pkgname"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

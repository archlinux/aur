# Maintainer: Alexis Etcheverria <ae.av32000@gmail.com>

_pkgname="omcp"
pkgname="$_pkgname-git"
pkgver=1.0.0
pkgrel=1
pkgdesc='A powerful CLI client that connects Ollama language models to Model Context Protocol servers'
url='https://github.com/Av32000/OMCP'
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'openssl')
arch=('x86_64')
options=(!debug !lto)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('aa2dda65c15ede6c7131eefd03eaddf2c62037d3535ece88b79af147da3797ce')

prepare() {
    cd "$srcdir/OMCP-$pkgver"

    export CARGO_HOME=$srcdir/.cargo
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/OMCP-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_HOME=$srcdir/.cargo
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
    cargo build --frozen --release
}

package() {
    cd "$srcdir/OMCP-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
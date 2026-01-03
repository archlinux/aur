# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=dsc
pkgver=0.11.0
pkgrel=1
pkgdesc="Docspell command line interface"
arch=('x86_64' 'aarch64')
url="https://github.com/docspell/dsc"
license=('GPL-3.0-only')
depends=()
optdepends=()
makedepends=('cargo')
# disable link time optimization as that breaks linking of libgit2
options=(!lto)
source=(
	"https://github.com/docspell/dsc/archive/refs/tags/v$pkgver.tar.gz"
	"Cargo.lock.patch"
)
sha512sums=('a210d42ce29f933de22a53b4bf071001bb7bbd1763397df4d8fcd30546b6ec5929de5595108038bc298c62350213ac8c6c2a427ff9942cfe6a6ab2626948daf4'
            '0630160f61297908e0d98d09dbca0e6922f5ffb253804374e8537e91f01b13cc93d037c1032c3662ccc30ffc1cc1962b7cd6454768031894a49bf8d29ed55cbc')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    patch Cargo.lock "${srcdir}/Cargo.lock.patch"
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen #--all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Do not run tests as they need a docspell server
    #cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

# Maintainer: tblFlip <root@tblflip.de
# Contributor: Dominik Schwaiger <mail@dominik-schwaiger.ch>

pkgname=surrealdb
pkgver=3.2.0
pkgrel=1
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=("BUSL-1.1")
depends=("gcc-libs" "glibc" "llvm-libs")
makedepends=("rustup" "curl" "llvm" "cmake" "binutils" "clang" "qemu-user-static" "musl" "openssl" "pkgconf" "base-devel" "protobuf")
provides=("surrealdb")
conflicts=("surrealdb-bin")

source=(
	"https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver//_/-}/LICENSE"
	"${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
)

sha256sums=(
	"98a94ac615f88370865016487b436fa404560910bd329794ed7502277a94b805"
	"669f077b43c8a2910a2e0091d2cf2f4082e3279d4f6d2d3fbba0e5e30a0f15f6"
)

prepare() {
	cd "$pkgname-${pkgver//_/-}" || exit
	rustup toolchain install 1.94
	rustup override set 1.94
	rustup target add "$CARCH-unknown-linux-gnu"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
	cd "$pkgname-${pkgver//_/-}" || exit
    export CFLAGS="${CFLAGS//-flto=[^ ]*/ }"
    export CXXFLAGS="${CXXFLAGS//-flto=[^ ]*/ }"
    export LDFLAGS="${LDFLAGS//-flto=[^]*/ }"
    export LLVM_LINK_SHARED=1
    export RUSTFLAGS="-C link-arg=-lLLVM"
    cargo build --release --locked --target x86_64-unknown-linux-gnu
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgname-${pkgver//_/-}" || exit
	install -Dm755 "target/$CARCH-unknown-linux-gnu/release/surreal" "$pkgdir/usr/bin/surreal"
}

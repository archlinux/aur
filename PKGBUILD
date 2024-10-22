# Maintainer: tblFlip <root@tblflipde>

pkgname=woomer
pkgver=0.1.0
pkgrel=1

pkgdesc="Zoomer application for Wayland inspired by tsoding's boomer"
url="https://github.com/coffeeispower/woomer"
license=("MIT")
arch=("i686" "x86_64")

depends=(
	gcc-libs
	glfw
	glibc
)

makedepends=(
	cargo
	clang
	cmake
	compiler-rt
	pkgconf
	wayland
)

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)

sha256sums=(
	"0e53ca0576c71a5931e75a45e734f2acacc0592260a06316b4b5a82a19faadac"
)

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	export CFLAGS="${CFLAGS//-flto=auto/}"
    cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

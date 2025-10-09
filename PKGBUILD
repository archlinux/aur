# Maintainer: qeezzo <root@qeezzo>

pkgname=woomer-sway
pkgver=1.0.1
pkgrel=1

pkgdesc="Zoomer application for Wayland inspired by tsoding's boomer"
url="https://github.com/qeezzo/woomer"
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
options=('!debug')

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('e2a385481a17fbf16d04629e40a2fb5fb3431e428cc19794f8e9513a16d976c1')

prepare() {
	cd "woomer-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "woomer-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	export CFLAGS="${CFLAGS//-flto=auto/}"
    cargo build --frozen --release
}

# check() {
# 	cd "woomer-$pkgver"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen --release
# }

package() {
	cd "woomer-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/woomer"
}

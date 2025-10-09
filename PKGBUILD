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

sha256sums=('979aa9255ac70078a382119ed64d9923af70029ca72dc481d6c68647fada8309')

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

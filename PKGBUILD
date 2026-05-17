# Maintainer: NorthWestWind <nw@northwestw.in>
_pkgname=cls
pkgname=$_pkgname-rs
pkgver=3.3.0
pkgrel=1
pkgdesc="cls - Command-Line Soundboard written in Rust"
arch=("i686" "x86_64")
url="https://codeberg.org/NorthWestWind/cls"
license=('GPL3')
depends=()
makedepends=("cargo")
optdepends=(
	"ffmpeg: fallback audio decoding"
	"pulse-native-provider: null sink and auto audio loopback"
)
replaces=("cls-soundboard")
conflicts=("cls-rs-git" "cls-rs-bin")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("a4faba6112ce6bb583122ef47f3e2059c60b869258ef20206e938aff348fe7fe")

prepare() {
  export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$srcdir/$_pkgname"
	cargo build --locked --frozen --release --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$_pkgname/target/release/$_pkgname"
}

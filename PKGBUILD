# Maintainer: NorthWestWind <nw@northwestw.in>
_pkgname=cls
pkgname=$_pkgname-rs
pkgver=3.1.0
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
sha256sums=("a2847fe6c0b3fe05cbb27e9f75694ed01d10f0c92f0e20f8db81afb7d205dbb3")

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

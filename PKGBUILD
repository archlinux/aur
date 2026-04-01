# Maintainer: NorthWestWind <nw@northwestw.in>
_pkgname=cls
pkgname=$_pkgname-rs
pkgver=3.1.1
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
sha256sums=("467100fd1d8e2d941ddcd775208339d4db7a7b1a671383e8efc618d8b7a10db7")

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

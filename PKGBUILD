# Maintainer: NorthWestWind <nw@northwestw.in>
_pkgname=cls
pkgname=$_pkgname-rs
pkgver=4.0.0
pkgrel=1
pkgdesc="cls - Command-Line Soundboard written in Rust"
arch=("i686" "x86_64")
url="https://codeberg.org/NorthWestWind/cls"
license=('GPL3')
depends=("ffmpeg")
makedepends=("cargo")
optdepends=(
	"pulse-native-provider: null sink and auto audio loopback"
)
replaces=("cls-soundboard")
conflicts=("cls-rs-git" "cls-rs-bin")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("fe9363a86b39fe8c986bc03f82e4c8219adbba002702d539d28fbb6b30d738ed")

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

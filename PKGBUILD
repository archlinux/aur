# Maintainer: NorthWestWind <wsyn148@gmail.com>
_pkgname=cls
pkgname=$_pkgname-rs-git
pkgver=2.0.1.r0.ge510566
pkgrel=1
pkgdesc="cls - Command-Line Soundboard written in Rust"
arch=("i686" "x86_64")
url="https://codeberg.org/NorthWestWind/cls"
license=('GPL3')
depends=("ffmpeg" "pulse-native-provider")
makedepends=("cargo")
replaces=("cls-soundboard")
conflicts=("cls-rs" "cls-rs-bin")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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

# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=flamelens-git
pkgver=0.1.0.r5.ge15be2f
pkgrel=1
pkgdesc="Flamegraph viewer in the terminal"
arch=('x86_64')
url="https://github.com/YS-L/flamelens"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libunwind')
optdepends=(
  "py-spy: Display a live flamegraph of a running Python program using py-spy as the profiler"
  )
makedepends=('git' 'cargo')
provides=('flamelens')
conflicts=('flamelens')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd $pkgname
	cargo test --frozen
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname/target/release/flamelens"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

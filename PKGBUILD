# Maintainer: xiretza <aur@xiretza.xyz>
_pkgname=engage
pkgname=$_pkgname-git
pkgver=0.2.0.r15.g0a901f4
pkgrel=1
pkgdesc="A task runner with DAG-based parallelism"
arch=(x86_64)
url="https://gitlab.computer.surgery/charles/engage"
license=('Apache-2.0 OR MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_pkgname"

	install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT.md LICENSE-Apache-2.0.md
}

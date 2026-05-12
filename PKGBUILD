# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=ssgg
pkgname="$_pkgbase-git"
pkgver=r421.ac66c59
pkgrel=1
pkgdesc='Open-source SteelSeries GG replacement for Linux'
arch=('x86_64')
url='https://github.com/Ven0m0/steelseriesgg-rs'
license=('MIT')
depends=('hidapi')
makedepends=('git' 'cargo' 'cmake')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/Ven0m0/steelseriesgg-rs.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --bin $_pkgbase
}

check() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen
}

package() {
	cd "$_pkgbase"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgbase"
	install -Dm0644 "assets/99-steelseries.rules" "$pkgdir/usr/lib/udev/rules.d/99-steelseries.rules"
	install -Dm0644 "assets/ssgg.service" "$pkgdir/usr/lib/systemd/user/ssgg.service"
	install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}

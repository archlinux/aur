# Maintainer: fossdd <fossdd@pwned.life>
pkgname=mpris-notifier-git
_pkgname=${pkgname%-git}
pkgver=r41.a4ea1ca
pkgrel=1
pkgdesc='Dependency-light, highly-customizable, XDG desktop notification generator for 🎶🎵 MPRIS status changes 🎹'
arch=('x86_64')
url='https://github.com/l1na-forever/mpris-notifier'
license=('unknown')
depends=()
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url"
)
sha512sums=(
	'SKIP'
)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

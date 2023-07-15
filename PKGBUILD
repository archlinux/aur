# Maintainer: éclairevoyant

_pkgname=wayshot
pkgname="$_pkgname-git"
pkgver=1.3.0.r5.43fae61e
pkgrel=1
pkgdesc="Screenshot tool for wlroots compositors"
arch=(x86_64)
url="https://git.sr.ht/~shinyzenith/$_pkgname"
license=(BSD)
depends=(gcc-libs glibc)
makedepends=(cargo git scdoc)
optdepends=('slurp: for area selection')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("git+$url")
b2sums=('SKIP')

prepare() {
	cd $_pkgname

	# don't waste time zipping manpages
	rm -rfv build.rs

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd $_pkgname/$_pkgname
	git blame -s -L"/^version =/,+1" Cargo.toml | awk '{
		ver = gensub(/[^0-9.]/, "", "g", $5);
		"git rev-list --count "$1"..HEAD" | getline commit_count;
		print ver".r"commit_count"."$1
	}'
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd $_pkgname
	install -vDm755 target/release/$_pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 docs/$_pkgname.1.scd "$pkgdir/usr/share/man/man1/$_pkgname.1"
	install -vDm644 docs/$_pkgname.7.scd "$pkgdir/usr/share/man/man7/$_pkgname.7"
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

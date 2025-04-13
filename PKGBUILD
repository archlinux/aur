# Maintainer: claymorwan <claymorwan@fembois.dev>

_pkgname=vertd

pkgname=vertd-git
pkgver=r70.743f69b
pkgrel=1
pkgdesc="VERT's solution to crappy video conversion services."
arch=(x86_64)
url="https://github.com/VERT-sh/vertd"
license=('GPL-3.0-only')
makedepends=('git' 'cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/$_pkgname"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features 
}

check() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm0755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$_pkgname/"

}

# Maintainer: mexanoz <mexanoz at proton dot me>

_pkgname=shuck
pkgname="$_pkgname-git"
pkgver=0.2.9.r0.g8611d2df
pkgrel=1
pkgdesc="A lightning fast shell linter/formatter/LSP server with zsh support"
arch=(x86_64)
url="https://github.com/ewhauser/$_pkgname"
license=(MIT)
depends=(glibc libgcc)
makedepends=(cargo git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd $_pkgname
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm755 target/release/$_pkgname -t "$pkgdir/usr/bin/"
}

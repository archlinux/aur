# Maintainer: Hunter Brodie <hunterbrodie@gmail.com>
pkgname='aurora-git'
pkgver=r6.0e6df8b
pkgrel=1
pkgdesc="A minimal AUR helper written in Rust"
arch=('x86_64')
url="https://gitlab.com/hunterbrodie/aurora"
license=('GPL')
depends=('pacman')
makedepends=('cargo')
source=("$pkgname::git+https://gitlab.com/hunterbrodie/aurora.git")
md5sums=('SKIP')

pkgver()
{
	cd "$pkgname"
	
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
	cd "$pkgname"

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build()
{
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check()
{
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package()
{
	cd "$pkgname"

	install -Dm0755 -t "$pkgdir/usr/bin" "target/release/aurora"
}

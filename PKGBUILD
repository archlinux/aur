# Maintainer: éclairevoyant

_pkgname=evremap
pkgname="$_pkgname-git"
pkgver=r30.85f10af
pkgrel=1
pkgdesc='Systemwide keyboard input remapper (written by @wez)'
arch=(x86_64)
url="https://github.com/wez/$_pkgname"
license=(MIT)
depends=(libevdev)
makedepends=(cargo git rust)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable

	cd $_pkgname
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd $_pkgname
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable

	cd $_pkgname
	cargo test --frozen --all-features
}

package() {
	cd $_pkgname
	install -Dm755 target/release/$_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 $_pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

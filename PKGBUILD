# Maintainer: Trumpetrespas <email [at] trumpetrespas [dot] com>
_name=zapp
pkgname=zsa-$_name
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="Flash ZSA keyboards from your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/zsa/zapp"
license=('LicenseRef-MIT-Commons-Clause')
groups=()
depends=(
	'glibc'
	'libgcc'
	# For libudev.so
	'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zsa/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bb11f5efcb240bbe9a97a2dde7121c548405527ffaf4a94d078b382268730bf6')

prepare() {
	cd "$_name-$pkgver"
	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target host-tuple
}
# Both build and package functions were originally 
# taken from https://aur.archlinux.org/packages/zsa-zapp-git
build() {
	cd "$_name-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	unset CFLAGS CXXFLAGS LDFLAGS
	cargo build --release --offline --manifest-path zapp/Cargo.toml
}

package() {
	cd "$_name-$pkgver"
	install -vDm 755 "target/release/zapp" "$pkgdir/usr/bin/zapp"
	install -vDm 644 "udev/50-zsa.rules" "$pkgdir/usr/lib/udev/rules.d/50-zsa-zapp.rules"
	install -vDm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	depends+=(libudev.so)
}

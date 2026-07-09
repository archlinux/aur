# Maintainer: Trumpetrespas <email [at] trumpetrespas [dot] com>
_name=zapp
pkgname=zsa-$_name
pkgver=1.0.1
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
sha256sums=('c4e03dba5d87295d565c6681b3b13956160c364be637bd6756d438fdb3959e4e')

prepare() {
	cd "$_name-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	
	# Unfortunetly needed for v1.0.1.
	# Next update should be tried without "cargo update",
	# as upstream may have fixed this issue.
	cargo update
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

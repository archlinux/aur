# Maintainer: Paski <paski@paski.dev>
#
# Canonical copy. The AUR repository is a mirror of this directory — edit
# here, never there. `pkgver` and the checksums are rewritten by
# ../update.sh; the rest is hand-maintained.

pkgname=gitorii
pkgver=0.16.1
pkgrel=1
pkgdesc='Human-first Git client: simpler commands, a TUI, snapshots, multi-platform mirrors and a secret scanner'
arch=('x86_64' 'aarch64')
url='https://gitorii.com'
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
checkdepends=('git')
optdepends=('git: needed by torii grep, archive, notes, patch and subtree, which shell out to it')
conflicts=('gitorii-bin')
# The C dependencies (vendored libgit2, aws-lc) are built by cc/cmake from
# the cargo build script. makepkg's global -flto does not reach them and
# only confuses the link step; the release profile does its own thin LTO.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/paskidev/gitorii/-/archive/v$pkgver/gitorii-v$pkgver.tar.gz")
sha256sums=('379a42bd1ceff724a9110d8e5c99859e6e749b37fd7b4bd553db8b78093babe4')

_srcdir="gitorii-v$pkgver"

prepare() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "$_srcdir"
	install -Dm0755 target/release/torii "$pkgdir/usr/bin/torii"
	install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm0644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 COMMANDS.md "$pkgdir/usr/share/doc/$pkgname/COMMANDS.md"
}

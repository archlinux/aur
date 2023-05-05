# Maintainer: VitalyR <vr@vitalyr.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sergey A. <murlakatamenka@disroot.org>
# This package tries to co-exist with community/rustup

pkgname=rust-analyzer-vitalyr-git
pkgver=0.0.0.24987.ge461e53f0
pkgrel=1
epoch=1
pkgdesc="An experimental Rust compiler front-end for IDEs"
arch=('x86_64' 'i686')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
optdepends=()
source=($pkgname::git+https://github.com/rust-analyzer/rust-analyzer.git)
sha256sums=('SKIP')

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

pkgver() {
	cd $pkgname
	echo $(grep '^version =' crates/rust-analyzer/Cargo.toml | head -n1 | cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	CFG_RELEASE=1 cargo build --release --locked
}

package() {
	cd $pkgname
	install -Dt "$pkgdir"/usr/bin target/release/rust-analyzer
	install -Dm644 -t "$pkgdir"/usr/share/licenses/rust-analyzer LICENSE-MIT
}

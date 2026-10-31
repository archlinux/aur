# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=cloud-image-inspector
pkgver=0.1.0
pkgrel=1
_tag=v$pkgver
_srcdir="cloud-image-inspector-$pkgver"
pkgdesc="Read qcow2 and raw cloud disk images without booting or mounting them: OS, login shells, sudo/doas, init system, sshd and cloud-init facts, plus ls/cat/export of files inside"
arch=('x86_64')
url="https://github.com/virtainer/cloud-image-inspector"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/virtainer/cloud-image-inspector/archive/refs/tags/$_tag.tar.gz")
sha256sums=('28ac3ade6e4ef17d38b9b2be4171afdf84772fcc750187b6be34d7de64d6bbfc')

build() {
	cd "$_srcdir"
	# rust-toolchain.toml fija 1.95.0; se usa el toolchain estable del sistema
	export RUSTUP_TOOLCHAIN=stable
	export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/build"
	cargo build --release --locked
}

check() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/build"
	cargo test --release --locked
}

package() {
	cd "$_srcdir"
	install -Dm755 target/release/cloud-image-inspector "$pkgdir/usr/bin/cloud-image-inspector"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

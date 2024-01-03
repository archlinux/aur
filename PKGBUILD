# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=projclean
pkgver=0.7.0
pkgrel=1
pkgdesc='project dependencies & build artifacts cleanup tool'
arch=(x86_64)
url="https://github.com/sigoden/$pkgname"
license=(MIT Apache)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('2528257ee66fd740d01180a4ac0e01dbff885ceeb209286d4d24815391f71cbe')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-*
}

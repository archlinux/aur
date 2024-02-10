# Maintainer: Caleb Maclennan <caleb@alerque.com>

BUILDENV+=(!check)

pkgname=nixpacks
pkgver=1.21.1
pkgrel=1
pkgdesc='App source + Nix packages + Docker = Image'
arch=(x86_64)
url="https://$pkgname.com"
_url="https://github.com/railwayapp/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc
         docker)
makedepends=(cargo
             nix
             systemd)
checkdepends=(go
              zig)
optdepends=('go: support go projects'
            'zig: support zig projects')
options=('!lto')
_archive="$pkgname-$pkgver"
source=("$_url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e3df7388a5526b865546f5c1e81ca69cddc4bf263e6d4a063e5e3eaa29eb162a')

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
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features -- \
		--skip 'test_get_default_cache_key' \
		--skip 'docker_run_tests'
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

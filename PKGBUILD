# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nixpacks
pkgver=1.37.0
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
sha256sums=('30875dccc05532feadb303ce7ed62a6c60edeec8f845d9dfbbb28fd0999acdf4')

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
	local skipped=(
		'test_get_default_cache_key'
		'docker_run_tests'
	)
	# Test suite is a disaster, probably needs a *lot* more checkdepends
	# and a bunch of special case path handling...
	# cargo test --frozen --all-features -- \
	# 	${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tincan
_pkgname=$pkgname-cli
pkgver=0.3.3
pkgrel=1
pkgdesc='Serverless peer-to-peer voice and text chat for your terminal'
arch=(x86_64)
url="https://github.com/bilalyazicioglu/$_pkgname"
license=(MIT)
depends=(alsa-lib
         glibc # libc.so libm.so
         libgcc
         libopusenc)
makedepends=(cargo)
_archive="$_pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('593cd70756c1dde0c34bedb32586dd89e16f1762c0fd8a8afce68075ab663488')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-lto'
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	local skipped=(
	)
	cargo test --frozen --release -- ${skipped[@]/#/--skip }
}

_compgen() {
	cd "$_archive"
	"target/release/$pkgname" completions $1
}

package() {
	depends+=(libasound.so
	          libgcc_s.so
	          libopus.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 <(_compgen bash) "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm0644 <(_compgen fish) "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm0644 <(_compgen zsh)  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

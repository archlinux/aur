# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tincan
_pkgname=$pkgname-cli
pkgver=0.4.0
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
sha256sums=('d7f548770114ced57d20917da7a147b73139013a4bc6e77c3b95f7a4b40ad550')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	if check_option debug y; then
		export CARGO_PROFILE_RELEASE_DEBUG=2
		export CARGO_PROFILE_RELEASE_STRIP=false
	fi
	if check_option lto y; then
		export CARGO_PROFILE_RELEASE_LTO=thin
		export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	fi
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

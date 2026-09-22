# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=badness
pkgver=0.24.0
pkgrel=1
pkgdesc='A language server, formatter, and linter for LaTeX'
arch=(x86_64)
url="https://github.com/jolars/$pkgname"
license=(MIT)
depends=(glibc # glibc.so
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('06a414c0f96c9d78939566df1e40cd44fd133fe9d3b95d1ca1345e97732d5d78')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-fto'
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
	cargo test --frozen
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "target/completions/$pkgname.fish"
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" "target/completions/_$pkgname"
	install -Dm0644 "target/completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

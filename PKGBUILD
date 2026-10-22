# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=badness
pkgver=0.28.0
pkgrel=2
pkgdesc='A language server, formatter, and linter for LaTeX'
arch=(x86_64)
url="https://github.com/jolars/$pkgname"
license=(MIT)
depends=(glibc # glibc.so
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('a0c575b793d06e2a907b26f869386c00770498b95030e6f210034a8d9ee3bfd8')

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

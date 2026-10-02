# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tincan-git
_pkgname=${pkgname%-git}-cli
pkgver=0.3.3.r0.g8d47968
pkgrel=1
pkgdesc='Serverless peer-to-peer voice and text chat for your terminal'
arch=(x86_64)
url="https://github.com/bilalyazicioglu/$_pkgname"
license=(MIT)
depends=(alsa-lib
         glibc # libc.so libm.so
         libgcc
         libopusenc)
makedepends=(cargo
             git)
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_srcenv() {
	cd "${pkgname%-git}"
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
	_srcenv
	"target/release/${pkgname%-git}" completions $1
}

package() {
	depends+=(libasound.so
	          libgcc_s.so
	          libopus.so)
	cd "${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 <(_compgen bash) "$pkgdir/usr/share/bash-completion/completions/${pkgname%-git}"
	install -Dm0644 <(_compgen fish) "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname%-git}.fish"
	install -Dm0644 <(_compgen zsh)  "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-git}"
}

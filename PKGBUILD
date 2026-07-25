# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Agustin <agustinballesteros04@gmail.com>

pkgname=llmfit
pkgver=1.1.6
pkgrel=2
pkgdesc='CLI tool to tell which LLM models will run best on your hardware'
arch=(x86_64 aarch64)
url="https://github.com/AlexsJones/$pkgname"
license=(MIT)
depends=(glibc # libc.so libm.so
         libgcc libgcc_s.so)
makedepends=(cargo
             git)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('93d9d2c2b79bb07d827baa88087d73d6a40dd0ac859757281260f7680b535a65')

_srcenv() {
	cd "$pkgname"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -ffat-lto-objects'
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --release --locked
}

check() {
	_srcenv
	cargo test --release --locked
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

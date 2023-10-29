# Maintainer: éclairevoyant
# Contributor: tectonic-deploy <sasha+tectonic at hackafe dot net>
# Contributor: Daniel M. Capella <polyzen at archlinux dot org>
# Contributor: Jan Tojnar <jtojnar at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

_pkgname=tectonic
pkgname="$_pkgname-git"
pkgver=0.0.2.r1250.41168a9f
pkgrel=1
epoch=1
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
arch=(x86_64)
url=https://tectonic-typesetting.github.io/
license=(MIT)
depends=(fontconfig harfbuzz-icu openssl)
makedepends=(rust gcc pkg-config git)
conflicts=(tectonic)
provides=(tectonic)
source=(
	"git+https://github.com/tectonic-typesetting/tectonic.git"
	"git+https://github.com/tectonic-typesetting/tectonic-staging.git"
)
b2sums=('SKIP'
        'SKIP')
options=(!lto !makeflags)

prepare() {
	cd $_pkgname
	git submodule init reference_sources
	git submodule set-url reference_sources "$srcdir/tectonic-staging"
	git submodule init reference_sources

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	git -C $_pkgname describe --tags | sed 's/^cfg_support-v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --features external-harfbuzz
}

package() {
	cd $_pkgname
	install -Dm755 target/release/tectonic -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

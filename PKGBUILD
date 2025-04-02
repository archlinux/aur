# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=complgen
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate bash/fish/zsh completions from a single declarative grammar"
arch=('x86_64')
url="https://github.com/adaszko/complgen"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4535c14ea603745f5bf3f00887cddf15c94eb865dbf64576a26b47bcecfe8f64ce8f76178652969b05ed5657ee0e8067a2a7b4f4f895a7f444728f60d29bae78')

prepare() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

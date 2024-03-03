# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=complgen
pkgver=0.1.8
pkgrel=1
pkgdesc="Generate bash/fish/zsh completions from a single declarative grammar"
arch=('any')
url="https://github.com/adaszko/complgen"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b1b2f4509a9db1d7245b28121388e0374387f8081f693cf562d467df6aec06de46d86db2086b1b735b0c9b59f9b16d03012ff1e7529df1bc33ac64aafb58092a')

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

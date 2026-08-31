# Maintainer:  shtrophic <aur at shtrophic dot net>
# Contributor: Albert Sebastian <albertsebe2 at gmail dot com>

pkgname=wstunnel
pkgver=10.7.0
pkgrel=1
pkgdesc="tunnel all your traffic over Websocket or HTTP2"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
options=('!lto')
url="https://github.com/erebe/wstunnel"
license=('BSD-3-Clause')
provides=('wstunnel')
conflicts=('wstunnel-bin' 'nodejs-wstunnel' 'haskell-wstunnel-bin')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "01-wstunnel-src-protocols-tcp-server_rs.patch")
sha256sums=('90025bc4ee46c8b1abffebb057a59fb0b3a4668eba58822c1b3889b5badce92d'
            '9639f931e47f510950108633d483fb77a26a97a34577030a13149cbc8546f6f8')

prepare() {
	cd $pkgname-$pkgver

	RUSTUP_TOOLCHAIN=stable \
		cargo fetch \
		--locked \
		--target "$(rustc -vV | sed -n 's/host: //p')"

	for p in $srcdir/*.patch; do
		patch -p0 <$p
	done
}

build() {
	cd $pkgname-$pkgver

	CARGO_TARET_DIR=target \
		RUSTUP_TOOLCHAIN=stable \
		cargo build \
		-p $pkgname-cli \
		--frozen \
		--release
}

check() {
	cd $pkgname-$pkgver

	CARGO_TARGET_DIR=check \
		RUSTUP_TOOLCHAIN=stable \
		cargo test \
		--frozen \
		--release
}

package() {
	cd $pkgname-$pkgver

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

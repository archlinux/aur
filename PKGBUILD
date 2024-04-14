# Maintainer: Jose Fernandez <josefernandez.dev@gmail.com>
pkgname=below
pkgver=0.8.1
pkgrel=1
pkgdesc="A time traveling resource monitor for modern Linux systems"
arch=(x86_64)
url="https://github.com/facebookincubator/below"
license=('Apache-2.0')
depends=(glibc gcc-libs libelf zlib)
makedepends=(cargo clang)
options=('!lto' '!debug')
install=below.install
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.zip"
	"below.install"
)
sha256sums=('7b47d6d66167bb991b92a8eab3ff2b1d51339045ace190cdc09ab045f1f2e8cb'
            'af3057fcf8bf411522d76cf5def98b6c871687002b44236a9fe34bf8a47d95c2')

prepare() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "etc/below.service" "${pkgdir}/usr/lib/systemd/system/below.service"
}

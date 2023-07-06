# Maintainer: Your Name <youremail@domain.com>
pkgname=aliyundrive-webdav
pkgver=2.2.2
pkgrel=1
pkgdesc="阿里云盘 WebDAV 服务"
arch=('x86_64' 'aarch64')
provides=('aliyundrive-webdav')
url="https://github.com/messense/aliyundrive-webdav/"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
#options=('!lto')
source=("https://github.com/messense/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f6ab6b2dddc628c4e39a6b34ff6dc1f9e64931270d97bb7ab3eb6b6ebf9fb43d')

# template start; name=rust; version=1;
prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}
# template end;
package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "systemd.service" -T "${pkgdir}/usr/lib/systemd/system/$pkgname.service"
}

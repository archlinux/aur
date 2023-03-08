# Maintainer: Your Name <youremail@domain.com>
pkgname=aliyundrive-webdav
pkgver=2.0.4
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
sha256sums=('c83452c47e33dae1784629c922fe4ce9ac64a9eb1a09fc2c437c6828c57c4188')

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

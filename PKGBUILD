# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus
pkgver=1.1.1
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('any')
license=('GPL')
depends=('docker')
makedepends=('cargo')
source=("https://github.com/threadexio/zeus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41068f3b10a14165982287b276d07300c89ce6926506fb24cac9a06d64b1cd91')
conflicts=(zeus-bin podman-docker)

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target

	make BUILD_TYPE=release build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	install -Dm755 target/release/zeus "$pkgdir"/usr/bin/zeus
	install -Dm644 builder.tar.gz "$pkgdir"/usr/share/zeus/builder.tar.gz
	mkdir -p "$pkgdir"/var/cache/aur
	chmod 0777 "$pkgdir"/var/cache/aur
}

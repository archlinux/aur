# Maintainer: Leo Papadakos <jpegxguy@outlook.com>

pkgname=ksmbd-tools
pkgver=3.4.0
pkgrel=1
pkgdesc="Userspace tools for the ksmbd kernel SMB server"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd-tools"
license=('GPL2')
depends=('ksmbd-dkms' 'libnl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "ksmbd.service")
sha256sums=("e701936f7c8f04fc89704cd78bea4e9d7038c67523506ddfc89d176d71b0463e"
            "c97ef1a0fcd4357d3352b0e174547c02ce91563c342df10eec2bf2eba2c4a392")

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

	install -Dm 644 "${srcdir}/ksmbd.service" "${pkgdir}/usr/lib/systemd/system/ksmbd.service"
}

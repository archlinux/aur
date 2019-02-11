# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=snapcast
pkgver=0.15.0
pkgrel=4
pkgdesc="Synchronous multi-room audio player"
arch=('x86_64' 'armv6h' 'armv7h')
url="https://github.com/badaix/snapcast"
license=('GPL')
depends=(alsa-lib avahi libvorbis flac)
makedepends=(alsa-utils asio aixlog popl)
backup=('etc/default/snapserver' 'etc/default/snapclient')
source=("https://github.com/badaix/snapcast/archive/v${pkgver}.tar.gz"
        "snapcast.sysusers"
        "snapcast.tmpfiles")
sha256sums=('7c584fad4941a299339fe060174e33c4d810b1cbe80d6efbee54da3dafb252cc'
            '9fe6e9e07adb77f555a617b772e6d01e098e1dfaad1e8075e03a7d7ba76141de'
            '1c58fef5d3e2de64c1df52138f0f3c841773e7881b9cbc76f23312deeebc11b5')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 server/snapserver "${pkgdir}/usr/bin/snapserver"
	install -Dm644 server/snapserver.1 "${pkgdir}/usr/share/man/man1/snapserver.1"

	install -Dm755 client/snapclient "${pkgdir}/usr/bin/snapclient"
	install -Dm644 client/snapclient.1 "${pkgdir}/usr/share/man/man1/snapclient.1"

	install -Dm644 server/debian/snapserver.service "${pkgdir}/usr/lib/systemd/system/snapserver.service"
	install -Dm644 server/debian/snapserver.default "${pkgdir}/etc/default/snapserver"
	install -Dm644 client/debian/snapclient.service "${pkgdir}/usr/lib/systemd/system/snapclient.service"
	install -Dm644 client/debian/snapclient.default "${pkgdir}/etc/default/snapclient"

	install -Dm644 "${srcdir}/snapcast.sysusers" "${pkgdir}/usr/lib/sysusers.d/snapclient.conf"
	install -Dm644 "${srcdir}/snapcast.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/snapclient.conf"
}


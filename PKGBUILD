# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.3.0
pkgrel=2
pkgdesc="Tools for using PIV smartcards/Yubikeys with ssh-agent and disk encryption"
url="https://github.com/arekinath/pivy"
license=('MPL2')
source=(
	"zfs-pivy.hook"
	"zfs-pivy.install"
	"https://github.com/arekinath/pivy/archive/v$pkgver.tar.gz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.7.4.tar.gz"
	"https://github.com/arekinath/mini-pcsc/archive/v0.1.0.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
optdepends=('cryptsetup: LUKS encrypted disk support (pivy-luks)'
	    'zfs-utils: ZFS encrypted pool/fs support (pivy-zfs)')
makedepends=(pkgconf cryptsetup zfs-utils json-c)
sha256sums=('404e1ba4ab21e030f1661898d21c6a64a7dda5ad12cee678e33ad77856557f1b'
            '44b5a004a06ffe214df2810bb2d58a3ecb2bdcf1c892411a8d574afac935f678'
            'f29ae879030bcd72a04df71b1854d1cf9ecda130825efc80ab7fe3b74d3735b8'
            '1e3a9fada06c1c060011470ad0ff960de28f9a0515277d7336f7e09362517da6'
            'aff68661c77bde91d67bfe3a132fab1bfa6e445281c7362caa59e5238b228e66')

prepare() {
	mv "libressl-2.7.4" "$pkgname-$pkgver/libressl"
}

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr USE_ZFS=yes USE_LUKS=yes
	cd "../mini-pcsc-0.1.0"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" USE_ZFS=yes USE_LUKS=yes install

	cd "../mini-pcsc-0.1.0"
	install -o root -g root -m 0755 -d "${pkgdir}/usr/lib"
	install -o root -g root -m 0755 libminipcsc.so "${pkgdir}/usr/lib/libminipcsc.so"

	cd "$srcdir"
	hookdir="${pkgdir}/usr/lib/initcpio/hooks"
	hookinsdir="${pkgdir}/usr/lib/initcpio/install"
	install -o root -g root -m 0755 -d "$hookdir"
	install -o root -g root -m 0644 zfs-pivy.hook "${hookdir}/zfs-pivy"
	install -o root -g root -m 0755 -d "$hookinsdir"
	install -o root -g root -m 0644 zfs-pivy.install "${hookinsdir}/zfs-pivy"
}

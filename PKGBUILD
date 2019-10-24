# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.3.1
pkgrel=1
pkgdesc="Tools for using PIV smartcards/Yubikeys with ssh-agent and disk encryption"
url="https://github.com/arekinath/pivy"
license=('MPL2')
source=(
	"zfs-pivy.hook"
	"zfs-pivy.install"
	"https://github.com/arekinath/pivy/archive/v$pkgver.tar.gz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.7.4.tar.gz"
	"https://github.com/arekinath/mini-pcsc/archive/v0.2.0.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
optdepends=('cryptsetup: LUKS encrypted disk support (pivy-luks)'
	    'zfs-utils: ZFS encrypted pool/fs support (pivy-zfs)')
makedepends=(pkgconf cryptsetup zfs-utils json-c)
sha256sums=('404e1ba4ab21e030f1661898d21c6a64a7dda5ad12cee678e33ad77856557f1b'
            '44b5a004a06ffe214df2810bb2d58a3ecb2bdcf1c892411a8d574afac935f678'
            'e0fdfd6c39fab493c57dccc236a8e775b7b8933f0876c28f495af5fe240b6acd'
            '1e3a9fada06c1c060011470ad0ff960de28f9a0515277d7336f7e09362517da6'
            'a2c23b7b9e3dc976b54627a08da68b76fd6194ba45d211959dedf4700879379e')

prepare() {
	mv "libressl-2.7.4" "$pkgname-$pkgver/libressl"
}

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr USE_ZFS=yes USE_LUKS=yes
	cd "../mini-pcsc-0.2.0"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" USE_ZFS=yes USE_LUKS=yes install

	cd "../mini-pcsc-0.2.0"
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

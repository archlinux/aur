# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.2.0
pkgrel=1
pkgdesc="Tools for using PIV smartcards/Yubikeys with ssh-agent and disk encryption"
url="https://github.com/arekinath/pivy"
license=('MPL2')
source=(
	"https://github.com/arekinath/pivy/archive/v$pkgver.tar.gz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.7.4.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
optdepends=('cryptsetup: LUKS encrypted disk support (pivy-luks)'
	    'zfs-utils: ZFS encrypted pool/fs support (pivy-zfs)')
makedepends=(cryptsetup zfs-utils json-c)
sha256sums=('51e3651a0fae8fe150157130c7380efb29c57b00ba6371c765484e0ae82a9906'
            '1e3a9fada06c1c060011470ad0ff960de28f9a0515277d7336f7e09362517da6')

prepare() {
	mv "libressl-2.7.4" "$pkgname-$pkgver/libressl"
}

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr USE_ZFS=yes USE_LUKS=yes
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" USE_ZFS=yes USE_LUKS=yes install
}

# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.2.1
pkgrel=1
pkgdesc="Tools for using PIV smartcards/Yubikeys with ssh-agent and disk encryption"
url="https://github.com/arekinath/pivy"
license=('MPL2')
source=(
	"zfs-pivy.hook"
	"zfs-pivy.install"
	"https://github.com/arekinath/pivy/archive/v$pkgver.tar.gz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.7.4.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
optdepends=('cryptsetup: LUKS encrypted disk support (pivy-luks)'
	    'zfs-utils: ZFS encrypted pool/fs support (pivy-zfs)')
makedepends=(cryptsetup zfs-utils json-c)
sha256sums=('c7c0bb3179388caa8ac6c20864183dd8b305e1865988f487a691278a8900e9a3'
            '32bfff1f6f395c70556b0f7eb364973c70cf795b25fc83aaf85aa81cd48c3b7f'
            'e1fff2b195f63448d16e837735f34810206e2843d49430b0243229378be72d26'
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

	cd "$srcdir"
	hookdir="${pkgdir}/usr/lib/initcpio/hooks"
	hookinsdir="${pkgdir}/usr/lib/initcpio/install"
	install -o root -g root -m 0755 -d "$hookdir"
	install -o root -g root -m 0644 zfs-pivy.hook "${hookdir}/zfs-pivy"
	install -o root -g root -m 0755 -d "$hookinsdir"
	install -o root -g root -m 0644 zfs-pivy.install "${hookinsdir}/zfs-pivy"
}

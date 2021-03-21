# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Phillip Smith <pkgbuild@phs.id.au>
# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=freeipmi
pkgver=1.6.7
pkgrel=1
pkgdesc="Provides in-band and out-of-band IPMI software based on the IPMI v1.5/2.0 specification."
arch=('x86_64' 'aarch64')
url="https://www.gnu.org/software/freeipmi"
license=('GPL')
depends=('libgcrypt')
provides=('libipmimonitoring.so=6' 'libipmidetect.so=0' 'libipmiconsole.so=2'
          'libfreeipmi.so=17')
backup=("etc/$pkgname/$pkgname.conf"
        "etc/$pkgname/${pkgname}_interpret_sel.conf"
        "etc/$pkgname/${pkgname}_interpret_sensor.conf"
        "etc/$pkgname/ipmidetect.conf"
        "etc/$pkgname/ipmidetectd.conf"
        "etc/$pkgname/ipmiseld.conf"
        "etc/$pkgname/libipmiconsole.conf")
options=('!libtool')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('bb8519313933656c1e55e4f1ab3204748c26671d058e8aadd8e30a8053eadebf'
            'SKIP')
validpgpkeys=('A865A9FB6F0387624468543A3EFB7C4BE8303927') # Albert Chu <chu11@llnl.gov>

build() {
	cd "$pkgname-$pkgver"

	if [[ "$CARCH" == "x86_64" ]]; then
	./configure \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--mandir=/usr/share/man \
		--sbindir=/usr/bin
	else
	./configure \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--mandir=/usr/share/man \
		--sbindir=/usr/bin \
		--build-arm
	fi

	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	# Move init scripts and config to Arch paths
	mv "$pkgdir"/etc/sysconfig "$pkgdir"/etc/conf.d
}

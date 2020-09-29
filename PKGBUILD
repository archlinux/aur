# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Phillip Smith <pkgbuild@phs.id.au>
# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=freeipmi
pkgver=1.6.6
pkgrel=1
pkgdesc="Provides in-band and out-of-band IPMI software based on the IPMI v1.5/2.0 specification."
arch=('x86_64' 'aarch64')
url="https://www.gnu.org/software/freeipmi"
license=('GPL')
depends=('libgcrypt')
provides=('libipmimonitoring.so=6' 'libipmidetect.so=0' 'libipmiconsole.so=2'
          'libfreeipmi.so=17')
backup=("etc/$pkgname/*.conf")
options=('!libtool')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cfa30179b44c582e73cf92c2ad0e54fe49f9fd87f7a0889be9dc2db5802e6aab')

build() {
	cd "$pkgname-$pkgver"

	if [[ "$CARCH" == "x86_64" ]]; then
	./configure \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--mandir=/usr/share/man
	else
	./configure \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--mandir=/usr/share/man \
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

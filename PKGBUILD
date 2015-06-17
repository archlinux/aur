# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname=mactel-boot
pkgver=0.9
pkgrel=3
pkgdesc='Utility to bless EFI bootloaders in Apple-Intel Macs'
url='https://bugzilla.redhat.com/show_bug.cgi?id=755093'
license=(GPL)
arch=(i686 x86_64)
source=(http://www.codon.org.uk/~mjg59/mactel-boot/mactel-boot-$pkgver.tar.bz2
        mactel-boot-setup)
sha256sums=('7c58df71b4c8fe3bdb719063a34265fe8e338d6cb5db024fc90ae716cbbf52f6'
            'd74b68d3a7dde589a03779b3a245d66a04dda8247d876f5aea56e3fe365fc8f7')

prepare() {
	# Build should respect CFLAGS from Arch build system
	# and do not put files into /usr/sbin
	sed -e 's/$(CC) -g -o hfs-bless bless.c/$(CC) $(CFLAGS) -o hfs-bless bless.c/' \
	    -e 's|/usr/sbin/hfs-bless|/usr/bin/hfs-bless|' \
	    -i "$srcdir/mactel-boot-$pkgver/Makefile"
}

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver

	make DESTDIR="$pkgdir" install
	
	install -D -m0755 "$srcdir/mactel-boot-setup" "$pkgdir/usr/bin/mactel-boot-setup"
	install -d "$pkgdir/usr/share/mactel-boot"
	install -D -m0644 "$srcdir/mactel-boot-$pkgver/SystemVersion.plist" "$pkgdir/usr/share/mactel-boot/SystemVersion.plist"
}

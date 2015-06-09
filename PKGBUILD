# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=clamav-light
_pkgname=clamav
pkgver=0.98.4
pkgrel=1
pkgdesc="ClamAV manual scanner"
arch=('i686' 'x86_64')
url="http://www.clamav.net/"
license=('GPL')
depends=('bzip2' 'gcc-libs' 'libltdl')
makedepends=('intltool' 'autoconf')
conflicts=('clamav')
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-${pkgver}.tar.gz)
md5sums=('6d409eab6c311de05a0a591fccd2ec83')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	sed -i '/clamsubmit/s/^/#/ ; /^pkgconfig/s/^/#/ ; /^bin_SCRIPTS/s/^/#/ ; s/^SUBDIRS.*/SUBDIRS = libclamav clamscan freshclam docs/' ./Makefile.am
	sed -i 's/^man_MANS.*/man_MANS = man\/clamscan.1 man\/freshclam.1 man\/freshclam.conf.5/' ./docs/Makefile.am
	autoreconf -fi
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --with-dbdir=/var/lib/clamav \
		    --disable-clamav --enable-dns-fix --with-gnu-ld --without-included-ltdl \
		    --disable-milter --disable-ipv6 --disable-clamdtop --disable-fanotify \
		    --disable-unrar --enable-llvm=no
	make
}

package() {
	cd "$srcdir/clamav-$pkgver"
	mkdir -p -m755 "$pkgdir/etc"
	mkdir -p -m777 "$pkgdir/var/lib/clamav"
	make DESTDIR="$pkgdir" install-strip

	# config file for freshclam
	echo "IyBmcmVzaGNsYW0gY29uZmlnIGZpbGUgKGNsYW1B
              VikKCkRhdGFiYXNlRGlyZWN0b3J5IC92YXIvbGli
              L2NsYW1hdgpEYXRhYmFzZU1pcnJvciBkYXRhYmFz
              ZS5jbGFtYXYubmV0CkZvcmVncm91bmQgeWVzClRl
              c3REYXRhYmFzZXMgeWVzCg==" | tr -d " " | base64 -d >"$pkgdir/etc/freshclam.conf"
}

# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=clamav-light
_pkgname=clamav
pkgver=0.99.2
pkgrel=1
pkgdesc="ClamAV manual scanner"
arch=('i686' 'x86_64')
url="http://www.clamav.net/"
license=('GPL')
depends=('bzip2' 'gcc-libs' 'libltdl')
makedepends=('intltool' 'autoconf')
conflicts=('clamav')
source=("https://www.clamav.net/downloads/production/${_pkgname}-${pkgver}.tar.gz"
	'make_it_compile_against_openssl_1_1_0.patch')
sha256sums=('167bd6a13e05ece326b968fdb539b05c2ffcfef6018a274a10aeda85c2c0027a'
            '0a8e02a91bc3f2c99bd52dc475592637376baa991fe3f899b7745b840fc586c5')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	patch -Np1 -i ../make_it_compile_against_openssl_1_1_0.patch
	sed -i '/clamsubmit/s/^/#/ ; /^pkgconfig/s/^/#/ ; /^bin_SCRIPTS/s/^/#/ ; s/^SUBDIRS.*/SUBDIRS = libclamav clamscan freshclam docs/' ./Makefile.am
	sed -i 's/^man_MANS.*/man_MANS = man\/clamscan.1 man\/freshclam.1 man\/freshclam.conf.5/' ./docs/Makefile.am
	autoreconf -fi
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --with-dbdir=/var/lib/clamav \
		    --disable-clamav --enable-dns-fix --with-gnu-ld --without-included-ltdl \
		    --disable-milter --disable-ipv6 --disable-clamdtop --disable-fanotify \
		    --disable-unrar --enable-llvm=no --disable-zlib-vcheck
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

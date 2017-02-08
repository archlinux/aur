# Maintainer=alive4ever
pkgname=libressl-netcat
pkgver=2.5.1
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Low level UDP/TCP connection tool with support for TLS protocol"
url=http://www.libressl.org
license=('isc' 'custom:Openssl')
depends=('glibc' 'ca-certificates')
provides=('netcat')
conflicts=('openbsd-netcat' 'gnu-netcat')
source=("http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz"
	"http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz.asc")
sha256sums=('f71ae0a824b78fb1a47ffa23c9c26e9d96c5c9b29234eacedce6b4c7740287cd'
            'SKIP')
## To automatically validate the gpg key during build, add 'keyserver_options auto_key_retrieve' line to your local build account ~/.gnupg/gpg.conf
## Alternatively, fetch the key manually before running makepkg: 'gpg --keyserver pgp.mit.edu --receive-key A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5'
## Note that building package should not be run as root. Run the build on standard account or run the build inside chroot or systemd-nspawn container.
validpgpkeys=('A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5') # Brent Cook <bcook@openbsd.org>

build() {
cd $srcdir/libressl-${pkgver}/
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-nc --disable-static \
	--disable-shared --with-pic=yes
make
}

check() {
cd $srcdir/libressl-${pkgver}/
make -k check
}

package() {
cd $srcdir/libressl-${pkgver}
install -Dm 755 ./apps/nc/nc $pkgdir/usr/bin/nc
ln -s nc $pkgdir/usr/bin/netcat
install -Dm 644 ./apps/nc/nc.1 $pkgdir/usr/share/man/man1/nc.1
install -Dm 644 ./COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


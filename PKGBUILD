# Maintainer=alive4ever
pkgname=libressl-netcat
pkgver=2.8.3
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Low level UDP/TCP connection tool with support for TLS protocol"
url=https://www.libressl.org
license=('isc' 'custom:Openssl')
depends=('ca-certificates')
provides=('netcat')
conflicts=('openbsd-netcat' 'gnu-netcat')
source=("https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz.asc")
sha256sums=('9b640b13047182761a99ce3e4f000be9687566e0828b4a72709e9e6a3ef98477'
            'SKIP')

## To verify the package signature, import the public key manually before
## building the package.
# curl -LO https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl.asc 
# gpg --import ./libressl.asc

## Note that building package should not be run as root. Run the build using
## standard user, either locally or inside container (systemd-nspawn, docker, or
## lxc)

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


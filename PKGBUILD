# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: K0n24d <konrad AT knauber DOT net>
pkgname=urbackup2-server
pkgver=2.0.37
pkgrel=2
pkgdesc="Client Server backup system"
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url="http://www.urbackup.org/"
license=('GPL')
makedepends=('gcc-libs' 'gcc' 'make')
depends=('sqlite' 'crypto++' 'curl' 'fuse' 'zlib')
conflicts=('urbackup-server')
source=("https://www.urbackup.org/downloads/Server/${pkgver}/urbackup-server-${pkgver}.tar.gz")
install='urbackup.install'
sha512sums=('5976a1567b1a86de84a3214f3ac89081bf761eeb3e04419437223ee32dfcd568b65a039ab13df7e117d74ff346621fda133df2cc910f0daeae0a67d7465818e2')

CFLAGS="-march=native -O2 -pipe -fstack-protector-strong -ansi"
CXXFLAGS="${CFLAGS}"
MAKEFLAGS="-j$(nproc)"

build() {
	sed  -i '/\#include \"cryptopp_inc.h\"/a #include "assert.h"' "${srcdir}/urbackup-server-${pkgver}.0/cryptoplugin/AESGCMDecryption.h"
	cd "${srcdir}/urbackup-server-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc \
		--localstatedir=/var --enable-packaging \
		--with-mountvhd --with-zlib --with-libcurl
	make
}

package() {
	cd "${srcdir}/urbackup-server-${pkgver}"

	make DESTDIR=$pkgdir install

	# Correct some file mode bits, thanks cfstras
	chmod a+x "${pkgdir}/usr/share/urbackup/www/"{css,fonts,js,images,}

	install -Dm644 "${srcdir}/urbackup-server-${pkgver}"/urbackup-server.service \
		"${pkgdir}"/usr/lib/systemd/system/urbackup-server.service
	install -Dm644 "${srcdir}/urbackup-server-${pkgver}"/urbackup-server-firewalld.xml \
		"${pkgdir}"/usr/lib/firewalld/services/urbackup-server-firewalld.xml
	install -Dm644 "${srcdir}/urbackup-server-${pkgver}"/logrotate_urbackupsrv \
		"${pkgdir}"/etc/logrotate.d/urbackupsrv
	install -Dm644 "${srcdir}/urbackup-server-${pkgver}"/docs/urbackupsrv.1 \
		"${pkgdir}"/usr/share/man/man1/urbackupsrv.1
	install -Dm644 "${srcdir}/urbackup-server-${pkgver}"/defaults_server \
		"${pkgdir}"/etc/default/urbackupsrv
}
# vim: ts=2

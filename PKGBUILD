# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: K0n24d <konrad AT knauber DOT net>
pkgname=urbackup2-server
pkgver=2.4.11
pkgrel=2
pkgdesc="Client Server backup system"
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url="http://www.urbackup.org/"
license=('GPL')
makedepends=('gcc-libs' 'gcc' 'make')
depends=('sqlite' 'crypto++' 'curl' 'fuse' 'zlib')
conflicts=('urbackup-server')
source=(
    "https://www.urbackup.org/downloads/Server/${pkgver}/urbackup-server-${pkgver}.tar.gz"
    "md5-bytes.patch"
)
install='urbackup.install'
sha512sums=(
    '4d8dc31164fc089ec4db1dc3639ddec946f6d239e55df3668338732720951eb150eaaef722bb2dbd07436fa2df252c9dcad5766123f330fb9464b1f595968fe7'
    '34e25c868cf4572414fbc6c693877127152f9a97edf8865b4263a55cf16f71a5045ba96b1a9af8244ed49c35cab56e3fdb44348d191e9f85e2efb66392907132'
)

CFLAGS="-march=native -O2 -pipe -fstack-protector-strong"
CXXFLAGS="${CFLAGS}"
CPPFLAGS="${CPPFLAGS} -DNDEBUG"
MAKEFLAGS="-j$(nproc)"

build() {
    sed  -i '/\#include \"cryptopp_inc.h\"/a #include "assert.h"' "${srcdir}/urbackup-server-${pkgver}/cryptoplugin/AESGCMDecryption.h"

    patch -d"${srcdir}/urbackup-server-${pkgver}" -p0 < "${srcdir}/md5-bytes.patch"

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

# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: K0n24d <konrad AT knauber DOT net>
pkgname=urbackup2-server
pkgver=2.5.35
pkgrel=1
pkgdesc="Client Server backup system"
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url="http://www.urbackup.org/"
license=('GPL')
makedepends=('gcc-libs' 'gcc' 'make')
depends=('sqlite' 'crypto++' 'curl' 'fuse' 'zlib')
conflicts=('urbackup-server')
backup=("etc/default/urbackupsrv")
source=(
    "https://hndl.urbackup.org/Server/${pkgver}/urbackup-server-${pkgver}.tar.gz"
    "md5-bytes.patch"
)
install='urbackup.install'
sha512sums=('d1e8ea3713f288fe349721b85ccc4c45eefe83b9fe6a80df9baf961c5a74a9a933ad8aa1b1c3e2f4d67846555f02438fd1ab1d8bebe594f6a287a5490fbbfe41'
            '34e25c868cf4572414fbc6c693877127152f9a97edf8865b4263a55cf16f71a5045ba96b1a9af8244ed49c35cab56e3fdb44348d191e9f85e2efb66392907132')

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
    --with-mountvhd --with-zlib --with-libcurl \
    --enable-embedded-cryptopp

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

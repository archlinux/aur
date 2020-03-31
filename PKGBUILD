# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=znapzend
pkgver=0.20.0
pkgrel=1
pkgdesc="ZnapZend is a ZFS centric backup tool. It relies on snapshot, send and receive todo its work. It has the built-in ability to manage both local snapshots as well as remote copies by thining them out as time progresses."
arch=('any')
url="http://www.znapzend.org/"
license=('GPL')
depends=('perl' 'zfs')
optdepends=('mbuffer: stream buffering')
source=("https://github.com/oetiker/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c0a1ab9df5d6c4936560b5f8f08d393d4e99313da190fa404cd8ee5df420a7ca')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i 's:@BINDIR@:/usr/bin:' "init/znapzend.service.in"
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix="/opt/${pkgname}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/share/man/man1"
    ln -s "/opt/${pkgname}/bin/znapzend" "${pkgdir}/usr/bin/znapzend"
    ln -s "/opt/${pkgname}/bin/znapzendzetup" "${pkgdir}/usr/bin/znapzendzetup"
    ln -s "/opt/${pkgname}/bin/znapzendztatz" "${pkgdir}/usr/bin/znapzendztatz"
    install -m 644 "init/znapzend.service" "${pkgdir}/usr/lib/systemd/system/znapzend.service"
    install -m 644 "man/znapzend.1" "man/znapzendzetup.1" "man/znapzendztatz.1" "${pkgdir}/usr/share/man/man1"
}

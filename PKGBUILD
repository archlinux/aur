# Maintainer: Prurigro

pkgname=dawnoftime
pkgver=1.69q
pkgrel=2
pkgdesc="A Mud codebase developed by Kalahn originally based on ROM"
url="http://www.dawnoftime.org"
license=('custom')
depends=('gcc' 'zlib')
makedepends=('make')
options=('!emptydirs')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
install="${pkgname}.install"

source=("http://www.dawnoftime.org/download/${pkgver}/dawn${pkgver}-src.tgz"
        "http://www.dawnoftime.org/download/${pkgver}/dawn${pkgver}-support.tgz"
        "build_fix.patch"
        "${pkgname}.service"
        "${pkgname}.tmpfiles.conf")
sha512sums=('19d35c4dca17f5a73b63148a862c3172c641073751bf25c89144a1e762c70187a74bf55dde37680aeb3dc8af1c8035ee103e7266b76ec8de1ddf6c8f0307f6aa'
            '0483b7d008221349b05d41fed3bc201cf466443b67190d6e621178a599400a804178ddf7320383cef13aefc6c3fa58364070fc0bd6b2657c6ee10d58e572772f'
            '12985aa3268841245a4b1afd644eb123a45f491f00934d6d006ed246045b10d3b92cd5049dc3d0a1869c400ce0e0ee478cb3ad67597391ec8fb6f53d64ec594e'
            '7d1efa0bb4d028fa815c7fe4f432a5b4ab3513c86e3304d6782c964aade2db634cfa3e120c404c7ef9072d6440a7b47f0d90c3567ed3a3f1e4d63f76f1115ced'
            '6ea80e353551791abbe1693754918d7bb0b9fa72450f254e682843bd3cc7ccfa8a238cde2809130115459b05cc8548a30197c3af0416d69efb6250cc5c199e4d')

_installdir="/usr/share/${pkgname}/"

prepare() {
    cd dawn${pkgver}
    patch -p1 < ../build_fix.patch
}

build() {
    cd dawn${pkgver}/src/configure
    ./configure --prefix=/usr; cd ..
    make -f makefile
}

package() {
    # Install license
    install -Dm644 dawn${pkgver}/src/docs/licenses.txt "${pkgdir}/usr/share/licenses/${pkgname}/licenses.txt"

    # Install base config and data files
    install -d "${pkgdir}${_installdir}"
    cp -R dawn${pkgver}/area "${pkgdir}${_installdir}/"
    cp -R dawn${pkgver}/help "${pkgdir}${_installdir}/"
    cp -R dawn${pkgver}/system "${pkgdir}${_installdir}/"

    # Install binaries
    install -Dm755 dawn${pkgver}/dawn "${pkgdir}/usr/bin/dawn"
    install -Dm755 dawn${pkgver}/resolver "${pkgdir}/usr/bin/resolver"

    # Install systemd service
    install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    # Install tmpfiles config
    install -Dm644 ${pkgname}.tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

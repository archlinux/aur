# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=pcsc-cyberjack
_sp=SP17
pkgver=3.99.5_${_sp}
_pkgver=3.99.5final.${_sp}
pkgrel=2
pkgdesc="PCSC Driver for Reiner SCT cyberjack Cardreaders"
arch=('i686' 'x86_64' 'aarch64')
url="https://help.reiner-sct.com/de/support/solutions/articles/101000480008"
license=('GPL-2.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-later')
replaces=('ctapi-cyberjack')
conflicts=('ctapi-cyberjack')
depends=('gcc-libs' 'glibc' 'libusb' 'pcsclite')
options=('!libtool' '!docs')
source=("https://support.reiner-sct.de/downloads/LINUX/V${pkgver}/pcsc-cyberjack-${_pkgver}.tar.bz2" "libifd-cyberjack6.udev")
sha256sums=('f1a8e15db3a4268b0d79c32a76195b34d79518bb891685443e253311f9e9d30a'
            '76603bda8b3b2b444706a697b937bf6d86a0891751fa8bd48ae0cd0cb9e82ce5')

prepare() {
    cd "${pkgname}-${_pkgver}"

    autoreconf -i
}

build() {
    cd "${pkgname}-${_pkgver}"

    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man/man8 \
        --sysconfdir=/etc/"${pkgname}"  \
        --enable-udev \
        --with-usbdropdir=$(pkg-config libpcsclite --variable=usbdropdir)

    make
}

package() {
    pushd "${pkgname}-${_pkgver}"
    make DESTDIR="${pkgdir}" install
    popd
    install -Dm 0644 libifd-cyberjack6.udev "${pkgdir}"/usr/lib/udev/rules.d/60-libifd-cyberjack6.rules
}


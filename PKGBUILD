# Author (initial package): Patrick Auernig <patrick.auernig@gmail.com>
# Author (fixes): Marco Neumann <marco@crepererum.net>

pkgname=sixfireusb-dkms
pkgver=0.6.2
pkgrel=6
pkgdesc="Kernel modules for the Terratec DMX6FireUSB soundcard, including firmware"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sixfireusb"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel')
makedepends=(
    'p7zip'
    'wget'
)
source=(http://sourceforge.net/projects/sixfireusb/files/sixfireusb-$pkgver.tar.bz2
        http://sourceforge.net/projects/sixfireusb/files/tools/fwinst.sh
        fwinst.patch
        dkms.conf
        blacklist-sixfireusb-dkms.conf
)
sha512sums=(
    'e79e4a62762626d966fa8c169b8666a0cfa3af8516e6f8a97e1a1d211d1deb1ed26bd2c5c8a4b563e03718c232e832686be783abbb66e5b49c8cc31858752068'
    '2cf369af6f8628796cbc47732335c2c00de8454f20ef06014bf11ba967dd791b3074c85f171964a77a72dd835917f84a85e073ca7194cfdd3a86e841efac0005'
    'f4c6765a93475c48a5865179bfaaa29dddd5f942a8219a51662a16f454c03e99fad4a2b1d3f567cd7d2dd3d8c061d42b0b30a3850feffaadcc9ac276f025a797'
    'e15302d1b589296ddc234f1836438bdfc0b864d1a6f2cf808d99dc5ed8f82b3fcdf7a097128af1f4f2e90258c9c0f9098b6d73698147ca830e08acdec64d85fb'
    '154150d5f6959c174a883504464e15e0c728ed71fa7f18ee3e75fa6e6810b7cdb87fae4a9df50587f7324943b5027096f9ef6b98e33bdcf147039fca1049dbd5'
)

build() {
    patch -Np1 -i fwinst.patch -o fwinst-patched.sh --follow-symlink
    cd "${srcdir}"/sixfireusb-$pkgver
}

package() {
    cd ${srcdir}

    install -dm755 ${pkgdir}/usr/lib/firmware
    sh ./fwinst-patched.sh ${pkgdir}

    install -dm755 "${pkgdir}/usr/src/sixfireusb-${pkgver}"
    for f in `find sixfireusb-${pkgver} -type f`
    do
        f2=`basename ${f}`
        install -m644 ${srcdir}/sixfireusb-${pkgver}/${f2} "${pkgdir}/usr/src/sixfireusb-${pkgver}/${f2}"
    done

    install -m644 ${srcdir}/dkms.conf "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"
    sed -i -e "s/@VERSION@/${pkgver}/" "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"

    install -dm755 "$pkgdir/etc/modprobe.d"
    install -m644 "$srcdir/blacklist-sixfireusb-dkms.conf" "$pkgdir/etc/modprobe.d"
}


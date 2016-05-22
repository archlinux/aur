# Author (initial package): Patrick Auernig <patrick.auernig@gmail.com>
# Author (fixes): Marco Neumann <marco@crepererum.net>

pkgname=sixfireusb-dkms
pkgver=0.6.2
pkgrel=2
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
)
sha512sums=(
    'e79e4a62762626d966fa8c169b8666a0cfa3af8516e6f8a97e1a1d211d1deb1ed26bd2c5c8a4b563e03718c232e832686be783abbb66e5b49c8cc31858752068'
    '2cf369af6f8628796cbc47732335c2c00de8454f20ef06014bf11ba967dd791b3074c85f171964a77a72dd835917f84a85e073ca7194cfdd3a86e841efac0005'
    'f4c6765a93475c48a5865179bfaaa29dddd5f942a8219a51662a16f454c03e99fad4a2b1d3f567cd7d2dd3d8c061d42b0b30a3850feffaadcc9ac276f025a797'
    '43880b03da504b390471084e140e3b119080621792a9aad41e92e7372fb56fe88321289419f04ce33687955d45dfff049d3ba9b2df5eefee3d061ecb597372d8'
)
install=sixfireusb.install

build() {
    patch -Np1 -i fwinst.patch -o fwinst-patched.sh --follow-symlink
    cd "${srcdir}"/sixfireusb-$pkgver
}

package() {
    cd ${srcdir}

    install -dm755 ${pkgdir}/usr/lib/firmware
    sh ./fwinst-patched.sh ${pkgdir}

    install -dm755 "${pkgdir}/usr/src/sixfireusb-${pkgver}"

    cp -r ${srcdir}/sixfireusb-${pkgver}/* "${pkgdir}/usr/src/sixfireusb-${pkgver}/"
    cp ${srcdir}/dkms.conf "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"
    sed -i -e "s/@VERSION@/${pkgver}/" "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"
}


# Author (initial package): Patrick Auernig <patrick.auernig@gmail.com>
# Author (fixes): Marco Neumann <marco@crepererum.net>

pkgname=sixfireusb-dkms
pkgver=0.6.1
pkgrel=3
pkgdesc="Kernel modules for the Terratec DMX6FireUSB soundcard, including firmware"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sixfireusb"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel')
source=(http://sourceforge.net/projects/sixfireusb/files/sixfireusb-$pkgver.tar.bz2
        http://sourceforge.net/projects/sixfireusb/files/tools/fwinst.sh
        kernel-3.16.patch
        grsecurity.patch
        fwinst.patch
        dkms.conf
)
sha512sums=(
    '6428fe074dd2717bcf6f2bdb38b5612694d66254021cc5a627ef5bccf2a7cbfd0e8cb9ca4be4f9855fe89d9be47a9943bbf368d8aec45eda08e4290ede9e9d34'
    '84aabf90510c1a42e25e9c07eb4e41f45fa967c1bbf4e89c4f4355a0adcab58727f3f759cecbed078e6f2a17e8eaafc8c55aad77e164ef0539b4eec162e5b5cc'
    '9d612518c48873d1ae9bd28a55b7a54cbb8e4836a87cf9c8870ae5038850107539b3b13684610f31aa2543dae3123cc88f02e477a891d2c3baae6157b0151083'
    '1c5ed0652f83f68c12c05b6675af85ded4b31696db0c07047555ee028f82ecf5c69a1de3d452e82ee137187254f6c27305ee650cc636e003ba1ebeedc007017a'
    'f900df734deaab5070fdc7daf43700307259fb82a6846eb3765eff9fbd041eb12fb2f04158105c749f6a06217cd44097e08cc230c5fc76ef3bad078d697ed6b8'
    '43880b03da504b390471084e140e3b119080621792a9aad41e92e7372fb56fe88321289419f04ce33687955d45dfff049d3ba9b2df5eefee3d061ecb597372d8'
)
install=sixfireusb.install

build() {
    patch -Np1 -i fwinst.patch -o fwinst-patched.sh --follow-symlink
    cd "${srcdir}"/sixfireusb-$pkgver
    patch -Np1 -i ../kernel-3.16.patch
    patch -Np1 -i ../grsecurity.patch
}

package() {
    cd ${srcdir}

    install -dm755 ${pkgdir}/lib/firmware
    sh ./fwinst-patched.sh ${pkgdir}

    install -dm755 "${pkgdir}/usr/src/sixfireusb-${pkgver}"

    cp -r ${srcdir}/sixfireusb-${pkgver}/* "${pkgdir}/usr/src/sixfireusb-${pkgver}/"
    cp ${srcdir}/dkms.conf "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"
    sed -i -e "s/@VERSION@/${pkgver}/" "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"
}


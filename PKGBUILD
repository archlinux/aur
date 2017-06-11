# Maintainer: Stephan Henrichs <kilobyte @@ kilobyte22 .. de>
pkgname=leds-apu2-dkms
pkgver=1.0
pkgrel=1
pkgdesc="Kernel Driver for exposing the APU2/3 LEDs via the sysfs, also usermode tools"
arch=(i686 x86_64)
url="https://daduke.org/linux/apu2/"
license=(GPL2)
depends=('dkms')
source=('https://daduke.org/dl/apu2-leds.tgz' 'dkms.conf' 'makefile.patch')
sha256sums=('4eb4251681e6ae671294e7c3209c5c9f02a26f4c49c33f7bfe0d94e18713e7aa'
            '19bb519cbd1875deaab264fb7b1d0bf936bec8dfde989ac9ba57e5c438969373'
            'f9d52a39ae9e3835ffa091632431bf051566ddd5a695d110274af61c22d7d895')

prepare() {
    patch apu2/Makefile -i makefile.patch
}

build() {
    cd "${srcdir}"/apu2
    make apu2led
}

package() {

    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf
    install -Dm755 apu2/apu2led "${pkgdir}"/usr/bin/apu2led

    sed -e "s/@PKGNAME@/${pkgname}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf
    cp -r "${srcdir}"/apu2/* "${pkgdir}"/usr/src/${pkgname}-${pkgver}/
}

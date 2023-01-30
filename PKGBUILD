# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=goodfet-git
pkgver=r84.1750cc1
pkgrel=1
pkgdesc="An embedded bus adapter for various microcontrollers and radios."
arch=('x86_64')
license=('BSD')
depends=('gcc-msp430' 'msp430-libc' 'msp430mcu' 'python2-pyserial')
makedepends=('git')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/travisgoodspeed/goodfet.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/opt/goodfet"

    msg2 "Staging full release into /opt/goodfet"
    cp -a * "${pkgdir}/opt/goodfet/"

    msg2 "Linking client binaries into /usr/bin"
    cd "${pkgdir}/opt/goodfet/client"
    for c in goodfet goodfet.* facedancer*; do
	    ln -sf -T "/opt/goodfet/client/${c}" "${pkgdir}/usr/bin/${c%%.py}"
    done
}

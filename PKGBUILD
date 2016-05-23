# Author: Ido Rosen <ido@kernel.org>
# Contributor: Florian Knodt <arch@adlerweb.info>

pkgname='tn40xx'
pkgdesc="Tehuti Networks tn40xx network driver."
pkgver='0.3.6.12.2'
pkgrel=2
_extramodules=extramodules-4.4-lts
arch=('x86_64')
url='http://www.tehutinetworks.net/'
license=('custom')
depends=('linux-lts>=4.4' 'linux-lts<4.5')
makedepends=('linux-lts-headers>=4.4' 'linux-lts-headers<4.5')
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("http://www.tehutinetworks.net/images/UL240756/${pkgname}-${pkgver}.tgz"
        "tn40xx.install")
install=tn40xx.install
sha512sums=('a9e1eb3bb0b4a2f538dc79add45e764750d30f6b271865eeda2552a7623eead84dd48cb56179bbb9982922d696fec4e00f85787cdde4c47ad863dd0f3f34fe17'
            'a847a67fbf39cbb1fc5094e4f032c15be2521970527991b0f8e32574859df274308e90ef89fd0c79a80547e24af77d0b3088393b9802791c3bab84c63177fad5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    make KVERSION="${_kernver}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    #Upstream doesn't supply LICENSE file
    #install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    #install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 Readme release_notes \
            "${pkgdir}/usr/share/doc/${pkgname}"

    install -dm755 "${pkgdir}"/usr/lib/{modules/${_extramodules},modules-load.d}
    install -m755 ${pkgname}.ko "${pkgdir}/usr/lib/modules/${_extramodules}/"

    gzip "${pkgdir}"/usr/lib/modules/${_extramodules}/${pkgname%-*}.ko
    echo ${pkgname%-*} > "${pkgdir}"/usr/lib/modules-load.d/${pkgname}.conf

    install -dm755 "${pkgdir}/etc/pm/config.d/"
    echo "SUSPEND_MODULES=${pkgname}" > "${pkgdir}/etc/pm/config.d/${pkgname}"
}


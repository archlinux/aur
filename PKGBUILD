# Author: Ido Rosen <ido@kernel.org>
# Contributor: Florian Knodt <arch@adlerweb.info>

pkgname='tn40xx'
pkgdesc="Tehuti Networks NIC driver for MV88X3120,QT2025,TLK10232 and AQR105 10GbE-Cards"
pkgver='0.3.6.13'
pkgrel=1
_extramodules=extramodules-4.4-lts
arch=('x86_64')
url='http://www.tehutinetworks.net/'
license=('GPL2')
depends=('linux-lts>=4.4' 'linux-lts<4.5')
makedepends=('linux-lts-headers>=4.4' 'linux-lts-headers<4.5')
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("http://www.tehutinetworks.net/images/UL240756/${pkgname}-${pkgver}.tgz"
        "tn40xx.install")
install=tn40xx.install
sha512sums=('3737d58e2d50c712177385f53330120dc69dbeda3939a0273f354964cb9b5fd8889240bb9f9ad4deb12bc6bfdae5a2bdca594b645c6012088c6b88dc2971ae7b'
            'b47d366c5bacd8a9308eef013a973ef0ceedea8a27bff23ff3587e435a1798b8a01f08ff0c066d898e443069c17f4035570284a59ac6406f88f3506e5b274d98')

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


# Maintainer: David P. <megver83@openmailbox.org>

pkgname=pm-utils
pkgver=1.4.1
pkgrel=1
pkgdesc="Utilities and scripts for suspend and hibernate power management"
arch=('any')
url="https://pm-utils.freedesktop.org"
license=('GPL')
depends=('bash' 'pm-quirks' 'procps')
makedepends=('docbook-xml' 'docbook-xsl' 'xmlto')
source=("${pkgname}-${pkgver}::https://pm-utils.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz"
    02-logging-append.patch
    12-fix-intel-audio-powersave-hook.patch
    13-49bluetooth-sync.patch
    14-disable-sata-alpm.patch
    11netcfg)
sha256sums=('8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b'
            '5622a42167a5f6b725ecbe473d8f0994c4b3ac32e5c6607ce1fab0888894f139'
            '16d5355d1c5cff6316fef11768673434394582c67039c79e8b86aafe2d2f7797'
            '2af763812d609f384c818635028791c875e3e56a1fa387e80b7f1ca5afc3c4e3'
            'c995912f25fd1f0c30c90136c36ac49e2d3a5fdb94ef1710a7e0426dd10dad8a'
            'bbb646d8a657ef18962bfc956eba54ea59b77cc623841d31cd683bc7220d7074')

prepare() {
    cd "${pkgname}-${pkgver}"

    # patches
    for patch in ../*.patch; do
        msg "Applying ${patch} ..."
        patch -Np1 -i $patch
    done
}

build() {
    cd "${pkgname}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --localstatedir=/var

    make
}

package() {
    cd "${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # install additional hooks
    install -m755 "${srcdir}/11netcfg" "${pkgdir}/usr/lib/pm-utils/sleep.d/"

    # nm >=0.8.2 has native udev suspend/resume support
    rm -f "${pkgdir}/usr/lib/pm-utils/sleep.d/55NetworkManager"

    # Remove hooks that cause hardware failure or don't make sense at all
    rm -f "${pkgdir}/usr/lib/pm-utils/power.d/"{harddrive,disable_wol}
}

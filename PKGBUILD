# Maintainer: artoo <artoo@manjaro.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_date=20100619
_extra=pm-quirks

pkgname=pm-utils
pkgver=1.4.1
pkgrel=7
pkgdesc="Utilities and scripts for suspend and hibernate power management"
arch=('i686' 'x86_64')
url="http://pm-utils.freedesktop.org"
license=('GPL')
depends=('bash' 'procps')
conflicts=('pm-quirks')
replaces=('pm-quirks')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
source=("http://pm-utils.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz"
        '02-logging-append.patch'
        '12-fix-intel-audio-powersave-hook.patch'
        '13-49bluetooth-sync.patch'
        '14-disable-sata-alpm.patch'
        "http://pm-utils.freedesktop.org/releases/${_extra}-${_date}.tar.gz")
sha256sums=('8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b'
            '5622a42167a5f6b725ecbe473d8f0994c4b3ac32e5c6607ce1fab0888894f139'
            '16d5355d1c5cff6316fef11768673434394582c67039c79e8b86aafe2d2f7797'
            '2af763812d609f384c818635028791c875e3e56a1fa387e80b7f1ca5afc3c4e3'
            'c995912f25fd1f0c30c90136c36ac49e2d3a5fdb94ef1710a7e0426dd10dad8a'
            '14a50518928c27417cdc8bcbabb32b3d986931de105149aa248d8883e56c61ec')

prepare(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/02-logging-append.patch"
    patch -Np1 -i "${srcdir}/12-fix-intel-audio-powersave-hook.patch"
    patch -Np1 -i "${srcdir}/13-49bluetooth-sync.patch"
    patch -Np1 -i "${srcdir}/14-disable-sata-alpm.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --localstatedir=/var
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install

    # nm >=0.8.2 has native udev suspend/resume support
    rm -f "${pkgdir}/usr/lib/pm-utils/sleep.d/55NetworkManager"

    # Remove hooks that cause hardware failure or don't make sense at all
    rm -f "${pkgdir}/usr/lib/pm-utils/power.d/"{harddrive,disable_wol}

    install -m755 -d "${pkgdir}/usr/lib/pm-utils/video-quirks"
    install -m644 ${srcdir}/video-quirks/*.quirkdb "${pkgdir}/usr/lib/pm-utils/video-quirks/"
}

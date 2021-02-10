# Maintainer: Jat <chat@jat.email>

_pkgname=magewell-pro-capture
pkgname=${_pkgname}-dkms
pkgver=4227
pkgrel=1
pkgdesc='Driver for Magewell Pro Capture Family'
arch=('x86_64')
url='https://www.magewell.com/downloads/pro-capture#/driver/linux-x86'
license=('unknown')
conflicts=("${_pkgname}")
depends=('dkms' 'alsa-lib')
source=("ProCaptureForLinux_${pkgver}.tar.gz::https://www.magewell.com/files/drivers/ProCaptureForLinux_${pkgver}.tar.gz"
        "dkms.conf")
sha256sums=('99538DD7C76408D85CCF71A02137484CFB3ABCF610C0881BA8C61DEAAC3465E2'
            '0ED4336FE8F5ECC42F6285ACC634B21BCF32137596BD2EF8A44D6936E7A78551')

package() {
    cd ProCaptureForLinux_${pkgver}

    install -Dm644 src/res/* -t ${pkgdir}/usr/share/ProCapture/res
    sed -i 's#/usr/local/share/ProCapture/src/res#/usr/share/ProCapture/res#g' scripts/ProCapture.conf
    install -Dm644 scripts/ProCapture.conf -t ${pkgdir}/usr/lib/modprobe.d
    install -Dm644 scripts/10-procatpure-event-dev.rules -t ${pkgdir}/usr/lib/udev/rules.d

    install -Dm755 bin/mwcap-control_64 ${pkgdir}/usr/bin/mwcap-control
    install -Dm755 bin/mwcap-info_64 ${pkgdir}/usr/bin/mwcap-info

    srcdir=${pkgdir}/usr/src/${_pkgname}-${pkgver}
    install -Dm644 ../dkms.conf src/Makefile src/ProCaptureLib_64.lib -t ${srcdir}
    cp -r src/public src/sources ${srcdir}
}

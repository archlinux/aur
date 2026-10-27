# Maintainer: Ismaïl Bahloul <i.bahloul01@gmail.com>

# snd-usb-babyface-pro (DKMS) — Linux driver for the RME Babyface Pro FS,
# proprietary USB mode (VID:PID 2a39:3fc0).
#
# DKMS rebuilds the module automatically on every kernel upgrade; you
# still need the matching *-headers package installed for your kernel
# (linux-headers, linux-lts-headers, linux-cachyos-headers, ...).
#
# When a new version is tagged on GitHub, update pkgver and the source
# tarball checksum below.

pkgname=snd-usb-babyface-pro-dkms
pkgver=0.2.2
pkgrel=1
pkgdesc="DKMS driver for the RME Babyface Pro FS (proprietary USB mode)"
arch=('any')
url="https://github.com/ismail-bahloul/babyface-pro-linux"
license=('GPL2')
depends=('dkms')
optdepends=(
    'linux-headers: build against the stock kernel'
)
source=("${url}/archive/v${pkgver}/babyface-pro-linux-${pkgver}.tar.gz")
sha256sums=('7f58e55a636e01f43b625d3dbea1eed505bb8cd88435dc8415038c6cf179c23a')

package() {
    cd "${srcdir}/babyface-pro-linux-${pkgver}"

    local _dkms_src="${pkgdir}/usr/src/snd-usb-babyface-pro-${pkgver}"
    install -Dm644 tools/kernel/babyfacepro.c "${_dkms_src}/babyfacepro.c"
    install -Dm644 tools/kernel/babyfacepro.h "${_dkms_src}/babyfacepro.h"
    install -Dm644 tools/kernel/babyfacepro-ctl.c "${_dkms_src}/babyfacepro-ctl.c"
    install -Dm644 tools/kernel/Makefile "${_dkms_src}/Makefile"
    install -Dm644 tools/kernel/dkms.conf "${_dkms_src}/dkms.conf"

    sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" \
        "${_dkms_src}/dkms.conf"

    # Latency-profile template. Every line in it is commented out, so
    # installing it changes nothing by itself — it exists so the
    # low-latency profiles are discoverable instead of buried in a
    # README. Users opt in by overriding in /etc/modprobe.d/.
    install -Dm644 tools/kernel/snd-usb-babyface-pro.conf \
        "${pkgdir}/usr/lib/modprobe.d/snd-usb-babyface-pro.conf"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=chromiumos-firmware-git
pkgver=20160113.aee8eb8
pkgrel=1
pkgdesc="Chromium OS firmware files for Linux"
makedepends=('git')
arch=('any')
url="https://chromium.googlesource.com/chromiumos/third_party/linux-firmware"
license=('GPL2' 'GPL3' 'custom')
conflicts=('linux-firmware'
           'linux-firmware-git')
provides=("linux-firmware=$pkgver")
options=(!strip)
source=("${pkgname}::git+https://chromium.googlesource.com/chromiumos/third_party/linux-firmware")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    echo "$(date -I | tr -d -).$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    make DESTDIR="${pkgdir}" FIRMWAREDIR=/usr/lib/firmware install
    rm "${pkgdir}/usr/lib/firmware/"{Makefile,README,configure,GPL-3}

    install -d "${pkgdir}/usr/share/licenses/linux-firmware"
    install -Dm644 LICEN* WHENCE "${pkgdir}/usr/share/licenses/linux-firmware/"

    # Trigger a microcode reload for configurations not using early updates
    install -d "${pkgdir}/usr/lib/tmpfiles.d"
    echo 'w /sys/devices/system/cpu/microcode/reload - - - - 1' \
      >"${pkgdir}/usr/lib/tmpfiles.d/linux-firmware.conf"
}

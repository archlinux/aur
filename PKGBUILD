# Maintainer: Maxime Dirksen <dirksen.maxime@gmail.com>
# Co-Maintener: supdrewin <supdrewin@outlook.com>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Nikolay Bryskin <nbryskin@gmail.com>

pkgname=linux-enable-ir-emitter-git
pkgver=3.2.0.r0.g2a3d6ff
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=(MIT)
arch=(x86_64)

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter chicony-ir-toggle)

makedepends=(git)
depends=(python python-opencv python-yaml usbutils)

source=("git+https://github.com/EmixamPP/linux-enable-ir-emitter")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname/-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C "${srcdir}/linux-enable-ir-emitter/sources/driver/uvc"
}

package() {
    cd "${srcdir}/${pkgname/-git}"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    # software
    install -Dm 644 sources/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/
    install -Dm 644 sources/command/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/command/
    install -Dm 644 sources/driver/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/

    install -Dm 755 sources/driver/uvc/*query  -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/uvc/
    install -Dm 755 sources/driver/uvc/*query.o  -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/uvc/

    # boot service
    install -Dm 644 sources/linux-enable-ir-emitter.service -t ${pkgdir}/usr/lib/systemd/system/

    install -d "${pkgdir}"/usr/bin/
    chmod +x "${pkgdir}"/usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py
    ln -fs /usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py \
    "${pkgdir}"/usr/bin/linux-enable-ir-emitter
}

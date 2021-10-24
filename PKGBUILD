# Maintainer: Maxime Dirksen <dirksen.maxime@gmail.com>
# Co-Maintener: Supdrewin <supdrewin@outlook.com>
# Co-Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
# Co-Maintainer: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>

pkgname=linux-enable-ir-emitter
pkgver=3.2.0
pkgrel=1
epoch=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box."
url='https://github.com/EmixamPP/linux-enable-ir-emitter'
license=('MIT')
arch=('x86_64')

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter-git chicony-ir-toggle)

depends=(python python-opencv python-yaml usbutils)

install=linux-enable-ir-emitter.install

source=("https://github.com/EmixamPP/linux-enable-ir-emitter/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    make -C "${srcdir}/${pkgname}-${pkgver}/sources/uvc"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    # software
    install -Dm 644 sources/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/
    install -Dm 644 sources/command/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/command/
    install -Dm 644 sources/driver/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/

    install -Dm 755 sources/driver/uvc/*query  -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/uvc/
    install -Dm 755 sources/driver/uvc/*query.o  -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/uvc/

    # boot service
    install -Dm 644 sources/linux-enable-ir-emitter.service -t ${pkgdir}/usr/lib/systemd/system/

    # executable
    install -d "${pkgdir}"/usr/bin/
    chmod +x "${pkgdir}"/usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py
    ln -fs /usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py \
    "${pkgdir}"/usr/bin/linux-enable-ir-emitter
}

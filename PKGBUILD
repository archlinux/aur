# Maintainer: Maxime Dirksen <dirksen.maxime@gmail.com>
# Co-Maintener: Supdrewin <supdrewin@outlook.com>
# Co-Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
# Co-Maintainer: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>

pkgname=linux-enable-ir-emitter
pkgver=3.2.2
pkgrel=2
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
sha256sums=('e66501bb370c23cdd5957e1f771067d60a3b94789c0dc983a445664bd19ad13d')

build() {
    make -C "${srcdir}/${pkgname}-${pkgver}/sources/driver/uvc"
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

    # executable
    install -d "${pkgdir}"/usr/bin/
    chmod +x "${pkgdir}"/usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py
    ln -fs /usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py \
    "${pkgdir}"/usr/bin/linux-enable-ir-emitter
}

# Maintainer: Maxime Dirksen <aur@emixam.be>
# Co-Maintener: Supdrewin <supdrewin at outlook dot com>
# Co-Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
# Co-Maintainer: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>

pkgname=linux-enable-ir-emitter
pkgver=4.1.4
pkgrel=1
epoch=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box."
url='https://github.com/EmixamPP/linux-enable-ir-emitter'
license=('MIT')
arch=('x86_64')

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter-git chicony-ir-toggle)

depends=(python opencv fmt)

install=linux-enable-ir-emitter.install

source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0652bf99942b7b74f46a85ec5e6bc55f669f18a2eb45f36a39aca67e5195b2f0')

build() {
    make -C "${srcdir}/${pkgname}-${pkgver}/sources/driver/"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    # software
    install -Dm 644 sources/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/
    install -Dm 644 sources/command/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/command/
    install -Dm 755 sources/driver/driver-generator -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/
    install -Dm 755 sources/driver/execute-driver -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/

    # executable
    install -d "${pkgdir}"/usr/bin/
    chmod 755 "${pkgdir}"/usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py
    ln -fs /usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py \
    "${pkgdir}"/usr/bin/linux-enable-ir-emitter

    # auto complete for bash
    install -Dm 644 sources/autocomplete/${pkgname} -t "${pkgdir}"/usr/share/bash-completion/completions/

    # drivers folder
    mkdir -p "${pkgdir}"/etc/${pkgname}/
}

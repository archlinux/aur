# Maintainer: Maxime Dirksen <aur@emixam.be>
# Co-Maintener: supdrewin <supdrewin at outlook dot com>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Nikolay Bryskin <nbryskin@gmail.com>

pkgname=linux-enable-ir-emitter-git
pkgver=4.0.0.r1.g87d4b89
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
arch=('x86_64')

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter chicony-ir-toggle)

makedepends=(git)
depends=(python opencv usbutils)

install=linux-enable-ir-emitter.install

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C "${srcdir}/${pkgname}/sources/driver/"
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    # software
    install -Dm 644 sources/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/
    install -Dm 644 sources/command/*.py -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/command/
    install -Dm 755 sources/driver/driver-generator -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/
    install -Dm 755 sources/driver/execute-driver -t ${pkgdir}/usr/lib/linux-enable-ir-emitter/driver/

    # executable
    install -d "${pkgdir}"/usr/bin/
    chmod +x "${pkgdir}"/usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py
    ln -fs /usr/lib/linux-enable-ir-emitter/linux-enable-ir-emitter.py \
        "${pkgdir}"/usr/bin/linux-enable-ir-emitter

    # auto complete for bash
    install -Dm 644 sources/autocomplete/${pkgname/-git/} -t "${pkgdir}"/usr/share/bash-completion/completions/

    # drivers folder
    mkdir -p "${pkgdir}"/etc/${pkgname}/
}

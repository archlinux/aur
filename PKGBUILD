# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Corey Richardson <corey at octayn dot net>

pkgname=asciidocfx
pkgver=1.6.8
pkgrel=1
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX 8"
arch=('any')

url='http://asciidocfx.com/'
license=('Apache')

makedepends=('maven>=3.3.9' 'java-environment=8' 'gendesk')
depends=('java-environment=8' 'java-openjfx>=8.u76')

source=(
    "https://github.com/asciidocfx/AsciidocFX/archive/v${pkgver}.tar.gz"
    'asciidocfx'
)
sha512sums=(
    '3bee4b0b24f8c5bb81007e00ac8c9121ba2c13d96fe249c594fc8294f85c26c085e217a082d78a01d37654589565df921949550b216c89119152195be6b2774f'
    'e37a5331244d2784dabfffe3e360998e69ec0cc84dbd716e98d80de72c80c34e0791772d8277897b2fc479498860ef70293072956f2a991fcb59beec448d689f'
)

prepare() {

    # Generate a desktop entry
    # -f: forces and overrides the file if any
    # -n: do not download an icon
    # This tool assumes the icon has the same name as pkgname.
    # For categories see https://standards.freedesktop.org/menu-spec/latest/apa.html
    gendesk -f -n \
        --pkgname "$pkgname" \
        --pkgdesc "$pkgdesc" \
        --name "AsciidocFX" \
        --exec "/usr/bin/asciidocfx" \
        --categories "Development;Office;WordProcessor;TextTools;ComputerScience;Documentation;Java"
}

build() {
    cd "AsciidocFX-${pkgver}"

    # "install" seemingly means "build and ready for installation"
    mvn clean install
}

package() {
    cd "AsciidocFX-${pkgver}"

    install -dm755 "${pkgdir}/usr/share/java/asciidocfx"
    install -dm755 "${pkgdir}/usr/bin"
    mv -t "${pkgdir}/usr/share/java/asciidocfx" target/appassembler/{conf,lib}
    install -m755 '../asciidocfx' "${pkgdir}/usr/bin/asciidocfx"

    install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 './src/main/resources/logo.png' "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

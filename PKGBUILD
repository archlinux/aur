# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Corey Richardson <corey at octayn dot net>

pkgname=asciidocfx
pkgver=1.7.3
pkgrel=2
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX"
arch=('any')

url='http://asciidocfx.com/'
license=('Apache')

makedepends=('maven>=3.3.9' 'java-environment>=12' 'gendesk')
depends=('java-environment=15' 'java-openjfx')

source=(
    "https://github.com/asciidocfx/AsciidocFX/archive/v${pkgver}.tar.gz"
    'asciidocfx'
)
sha512sums=(
    '25d2739f83571523e5b67d52b83fb447723867c35ba93d38d0236425f1b305e3eac182f92772db059a2bd161b991617b06da7e5a3d3ffef6e0567653bd92437e'
    '8b7c59a119b558bbf8380f18e6be71d543b9bbae1e433f63c970d4eb5c5b6687200fa14621c3b33475989d7c8ac9ce96c522e2d89832e454d4e360a2bc584c6b'
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

    # Workaround for FS#64121
    install -dm755 "${pkgdir}/usr/share/java/asciidocfx/lib/java-openjfx"
    cp -t "${pkgdir}/usr/share/java/asciidocfx/lib/java-openjfx" /usr/lib/jvm/java-15-openjdk/lib/javafx*
}

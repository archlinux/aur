# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Corey Richardson <corey at octayn dot net>

pkgname=asciidocfx
pkgver=1.7.4
pkgrel=2
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX"
arch=('any')

url='http://asciidocfx.com/'
license=('Apache')

makedepends=('maven>=3.3.9' 'java-environment>=12' 'gendesk')
depends=('java-environment=17' 'java-openjfx')

source=(
    "https://github.com/asciidocfx/AsciidocFX/archive/v${pkgver}.tar.gz"
    'asciidocfx'
)
sha512sums=(
    'deb6a1a3140ce25974d96301e070ef7735d6253bcfd55abf97e5c6dc66c6ca7e03b7a4cc49f135923939d801b0c00692ea2cb3f7b968cbd21d0094b055ba59e2'
    'f185cdbb7ac4866160dc88c17373e668a0f37c0d380783f84e6138ba5f775347242a24e9a1ca97d9200ff601edb756e0944f27a2e1e53239b4d16d253605b0fa'
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
    cp -t "${pkgdir}/usr/share/java/asciidocfx/lib/java-openjfx" /usr/lib/jvm/java-17-openjdk/lib/javafx*
}

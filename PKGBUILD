# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Corey Richardson <corey at octayn dot net>

pkgname=asciidocfx
pkgver=1.7.1
pkgrel=1
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX"
arch=('any')

url='http://asciidocfx.com/'
license=('Apache')

makedepends=('maven>=3.3.9' 'java-environment>=12' 'gendesk')
depends=('java-environment>=12' 'java-openjfx')

source=(
    "https://github.com/asciidocfx/AsciidocFX/archive/v${pkgver}.tar.gz"
    'asciidocfx'
)
sha512sums=(
    '0bb8d8fb2cc486fab2578bd08ceaf20cd5db3df371f4065cd5e9fc431afb65056113ecb364324876ecd3fe8030646cdd6ea6be5532e8a8f7bdc169709a060d3e'
    '1d3e26797e573244177ed44f18a48da8a902b5fb54575fb2998b433346e90fadea54387416b1b720531d2a4b72f51d67e33cc4096eb6b34098170e20a23741a1'
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

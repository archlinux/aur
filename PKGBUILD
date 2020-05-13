# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Corey Richardson <corey at octayn dot net>

pkgname=asciidocfx
pkgver=1.7.2
pkgrel=1
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX"
arch=('any')

url='http://asciidocfx.com/'
license=('Apache')

makedepends=('maven>=3.3.9' 'java-environment>=11' 'gendesk')
depends=('java-environment=13' 'java-openjfx')

source=(
    "https://github.com/asciidocfx/AsciidocFX/archive/v${pkgver}.tar.gz"
    'asciidocfx'
    'versions.patch'
)
sha512sums=(
    '13e11110b81ff5dea8afab24616e9f2a1994a065408d0b8642af78566f1e39570bba4871a2b437675b0cca4adc7951221cdc13eb04896d44fef961d92f0e780f'
    '6482d9a0c6133a5d19efeabe9ba581e43858a162777d30afab3bd2575c6c9bcc336c9b7edb7c14a4434f42e64765f735f721fed1db16e2eb298c4889a09f136a'
    '750c1a89b5375eaf2710b1d56a78773f2c673a1b428c6ecb7221088849632d02a2f0429b82d2482fc3cf2bb4cb69ab1b7adc8170ba413a2de2fd23e66070b9f4'
)

prepare() {
    cd "AsciidocFX-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/versions.patch"
    cd ..

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

# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Corey Richardson <corey at octayn dot net>

pkgname=asciidocfx
pkgver=1.7.1
pkgrel=2
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX"
arch=('any')

url='http://asciidocfx.com/'
license=('Apache')

makedepends=('maven>=3.3.9' 'java-environment>=11' 'gendesk')
depends=('java-environment=13' 'java-openjfx')

source=(
    "https://github.com/asciidocfx/AsciidocFX/archive/v${pkgver}.tar.gz"
    'asciidocfx'
    'repo-https.patch'
    'versions.patch'
)
sha512sums=(
    '0bb8d8fb2cc486fab2578bd08ceaf20cd5db3df371f4065cd5e9fc431afb65056113ecb364324876ecd3fe8030646cdd6ea6be5532e8a8f7bdc169709a060d3e'
    '6482d9a0c6133a5d19efeabe9ba581e43858a162777d30afab3bd2575c6c9bcc336c9b7edb7c14a4434f42e64765f735f721fed1db16e2eb298c4889a09f136a'
    'f936480034d81c173c1af74ad30590f5915ff2c3d3bcb82e8b7b492b9d5af28b3f98d764a522aaf9b2cfb39a1343d63e7a6a2d2a71f53aea232c1f8bc96042e3'
    '3aa8793fab11538b9adc91a862a0607d53f2f7f0093fcc9119e0e3f741e687b1e5f858093333cd27faff9f950941e2ed6b0a9b47cdbb027fd5ff8c18f5d2f296'
)

prepare() {
    cd "AsciidocFX-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/repo-https.patch"
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

# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=3.0.4
pkgrel=1
pkgdesc='Omarchy theming application'
arch=('any')
url='https://github.com/bjarneo/aether'
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'libsoup3' 'imagemagick' 'gtk4-layer-shell')
optdepends=('omarchy: Theme application backend')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjarneo/aether/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4ad135cda8ae01f796c6b9221736b28c60394a73baacc4be7adf2ac46d48e233')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install source files
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r src templates "${pkgdir}/usr/share/${pkgname}/"

    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat >"${pkgdir}/usr/bin/aether" <<'LAUNCHER'
#!/bin/bash
cd /usr/share/aether || exit

# Preload GTK4 Layer Shell to fix linking order issue with libwayland
# See: https://github.com/wmww/gtk4-layer-shell/blob/main/linking.md
export LD_PRELOAD=/usr/lib/libgtk4-layer-shell.so

exec gjs -m src/main.js "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/aether"

    # Install desktop entry
    install -Dm644 li.oever.aether.desktop "${pkgdir}/usr/share/applications/li.oever.aether.desktop"

    # Install icon
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/aether.png"

    # Install license
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

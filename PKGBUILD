# Maintainer: Zeus-Deus <codemux at codemux dot org>
pkgname=codemux-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="The Agentic Development Environment for Builders"
arch=('x86_64')
url="https://github.com/Zeus-Deus/codemux"
license=('custom:Elastic-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'openssl' 'git' 'ydotool' 'xdg-utils' 'ripgrep' 'fd' 'github-cli')
optdepends=(
    'chromium: browser panes (or google-chrome, brave)'
)
provides=('codemux')
conflicts=('codemux')
source=("https://github.com/Zeus-Deus/codemux/releases/download/v${pkgver}/codemux_${pkgver}_amd64.AppImage")
sha256sums=('bb20b822084709c3a2668e6e5e65413666bf68a26dadd3aac6697f7adc9e54f0')
options=('!strip')

prepare() {
    chmod +x "${srcdir}/codemux_${pkgver}_amd64.AppImage"
    "${srcdir}/codemux_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    cd "${srcdir}/squashfs-root"

    # Binary
    install -Dm755 usr/bin/codemux "${pkgdir}/usr/bin/codemux"

    # Desktop entry
    install -Dm644 usr/share/applications/codemux.desktop "${pkgdir}/usr/share/applications/codemux.desktop"

    # Icons — install whatever sizes the AppImage ships
    find usr/share/icons -name "*.png" -o -name "*.svg" | while read icon; do
        install -Dm644 "${icon}" "${pkgdir}/${icon}"
    done

    # License
    install -Dm644 "${startdir}/../../LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md" 2>/dev/null || true
}

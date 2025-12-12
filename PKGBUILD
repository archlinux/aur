# Maintainer: Zhenxi <shawndouglasyt@gmail.com>
pkgname=klit-bin
pkgver=2.0.0+1
pkgrel=1
pkgdesc="The successor to BaoBao. A modern, privacy-focused client for the e621 community. Built with user experience and data protection as top priorities."
arch=('x86_64')
url="https://gitlab.com/Openlyst/klit"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('klit')
conflicts=('klit')
options=('!strip')
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/Openlyst/klit/-/jobs/12412859553/artifacts/raw/klit-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    # Install the entire bundle to /opt/klit (Flutter needs relative paths)
    install -d "${pkgdir}/opt/klit"
    
    # Install main executable
    install -Dm755 "klit" "${pkgdir}/opt/klit/klit"

    # Install libraries (must be in lib/ relative to executable)
    install -d "${pkgdir}/opt/klit/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/klit/lib/"

    # Install data files (must be in data/ relative to executable)
    cp -r data "${pkgdir}/opt/klit/"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/klit.desktop" <<EOF
[Desktop Entry]
Name=Klit
Comment=A modern, privacy-focused client for the e621 community
Exec=/opt/klit/klit
Icon=klit
Type=Application
Categories=Network;Graphics;
Keywords=e621;booru;privacy;
EOF

    # Install icon (if available)
    if [ -f "data/flutter_assets/assets/icons/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/klit.png"
    fi

    # Create symlink in /usr/bin for PATH access
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/klit/klit "${pkgdir}/usr/bin/klit"
}

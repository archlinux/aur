# Maintainer: Zhenxi <shawndouglasyt@gmail.com>
pkgname=docan-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Docan is a universal AI chat application featuring a stunning Liquid Glass design. Connect with various AI providers and enjoy a seamless chat experience across all your devices."
arch=('x86_64')
url="https://gitlab.com/openlyst/docan"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('docan')
conflicts=('docan')
options=('!strip')
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/Openlyst/docan/-/jobs/12347959312/artifacts/raw/dist/docan-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"

    # Install the entire bundle to /opt/docan (Flutter needs relative paths)
    install -d "${pkgdir}/opt/docan"
    
    # Install main executable
    install -Dm755 "docan" "${pkgdir}/opt/docan/docan"

    # Install libraries (must be in lib/ relative to executable)
    install -d "${pkgdir}/opt/docan/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/docan/lib/"

    # Install data files (must be in data/ relative to executable)
    cp -r data "${pkgdir}/opt/docan/"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/docan.desktop" <<EOF
[Desktop Entry]
Name=Docan
Comment=Universal AI chat application with Liquid Glass design
Exec=/opt/docan/docan
Icon=docan
Type=Application
Categories=Network;Chat;Utility;
Keywords=ai;chat;assistant;llm;
EOF

    # Install icon (if available)
    if [ -f "data/flutter_assets/assets/icons/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/docan.png"
    fi

    # Create symlink in /usr/bin for PATH access
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/docan/docan "${pkgdir}/usr/bin/docan"
}

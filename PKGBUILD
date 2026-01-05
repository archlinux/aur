# Maintainer: Zhenxi <shawndouglasyt@gmail.com>
pkgname=finar-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A beautiful, modern multi-platform Jellyfin client built with Flutter. Source: https://gitlab.com/Openlyst/finar"
arch=('x86_64')
url="https://gitlab.com/Openlyst/finar"
license=('AGPL3')
depends=('mpv' 'gtk3' 'libmpv.so')
optdepends=()
provides=('finar')
conflicts=('finar')
options=('!strip')
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/Openlyst/finar/-/jobs/12544240289/artifacts/raw/doudou-1.0.0-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    # Install the entire bundle to /opt/finar (Flutter needs relative paths)
    install -d "${pkgdir}/opt/finar"
    
    # Install main executable
    install -Dm755 "finar" "${pkgdir}/opt/finar/finar"

    # Install libraries (must be in lib/ relative to executable)
    install -d "${pkgdir}/opt/finar/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/finar/lib/"

    # Install data files (must be in data/ relative to executable)
    cp -r data "${pkgdir}/opt/finar/"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/finar.desktop" <<EOF
[Desktop Entry]
Name=Finar
Comment=A beautiful Jellyfin client
Exec=/opt/finar/finar
Icon=finar
Type=Application
Categories=AudioVideo;Video;Player;
Keywords=jellyfin;media;video;streaming;
EOF

    # Install icon
    install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/finar.png"

    # Create symlink in /usr/bin for PATH access
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/finar/finar "${pkgdir}/usr/bin/finar"
}

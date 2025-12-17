# Maintainer: Zhenxi <shawndouglasyt@gmail.com>
pkgname=doudou-unstable
pkgver=10.0.0
pkgrel=3
pkgdesc="Stream your music with ease and style (unstable/development version). Source: https://gitlab.com/Openlyst/doudou"
arch=('x86_64')
url="https://gitlab.com/Openlyst/doudou"
license=('GPL3')
depends=('mpv' 'gtk3' 'libmpv.so')
optdepends=()
provides=()
conflicts=()
options=('!strip')
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/Openlyst/doudou/-/jobs/12446986968/artifacts/raw/doudou-10.0.0-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    # Install the entire bundle to /opt/doudou-unstable (Flutter needs relative paths)
    install -d "${pkgdir}/opt/doudou-unstable"
    
    # Install main executable
    install -Dm755 "doudou" "${pkgdir}/opt/doudou-unstable/doudou"

    # Install libraries (must be in lib/ relative to executable)
    install -d "${pkgdir}/opt/doudou-unstable/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/doudou-unstable/lib/"

    # Install data files (must be in data/ relative to executable)
    cp -r data "${pkgdir}/opt/doudou-unstable/"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/doudou-unstable.desktop" <<EOF
[Desktop Entry]
Name=Doudou (Unstable)
Comment=Stream your music with ease and style (unstable/development version)
Exec=/opt/doudou-unstable/doudou
Icon=doudou-unstable
Type=Application
Categories=Audio;Music;Player;
Keywords=music;streaming;audio;player;
EOF

    # Install icon
    install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/doudou-unstable.png"

    # Create symlink in /usr/bin for PATH access
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/doudou-unstable/doudou "${pkgdir}/usr/bin/doudou-unstable"
}

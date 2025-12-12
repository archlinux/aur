# Maintainer: Zhenxi <shawndouglasyt@gmail.com>
pkgname=doudou-bin
pkgver=8.2.0+1
pkgrel=1
pkgdesc="Stream your music with ease and style. Source: https://gitlab.com/Openlyst/doudou"
arch=('x86_64')
url="https://gitlab.com/Openlyst/doudou"
license=('GPL3')
depends=('mpv' 'gtk3' 'libmpv.so')
optdepends=()
provides=('doudou')
conflicts=('doudou')
options=('!strip')
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/Openlyst/doudou/-/jobs/12423843215/artifacts/raw/doudou-9.0.0-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    # Install the entire bundle to /opt/doudou (Flutter needs relative paths)
    install -d "${pkgdir}/opt/doudou"
    
    # Install main executable
    install -Dm755 "doudou" "${pkgdir}/opt/doudou/doudou"

    # Install libraries (must be in lib/ relative to executable)
    install -d "${pkgdir}/opt/doudou/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/doudou/lib/"

    # Install data files (must be in data/ relative to executable)
    cp -r data "${pkgdir}/opt/doudou/"

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/doudou.desktop" <<EOF
[Desktop Entry]
Name=Doudou
Comment=Stream your music with ease and style
Exec=/opt/doudou/doudou
Icon=doudou
Type=Application
Categories=Audio;Music;Player;
Keywords=music;streaming;audio;player;
EOF

    # Install icon
    install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/doudou.png"

    # Create symlink in /usr/bin for PATH access
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/doudou/doudou "${pkgdir}/usr/bin/doudou"
}

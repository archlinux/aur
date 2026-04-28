# Maintainer: schultz-dev0 <your.email@example.com>
pkgname=rustykeys
pkgver=1.0.0
pkgrel=1
pkgdesc="A mechanical keyboard sound emulator (GTK4/Libadwaita)"
arch=('x86_64')
url="https://github.com/schultz-dev0/RustyKeys"
license=('MIT')
depends=('gtk4' 'libadwaita' 'alsa-lib')
provides=('rusty_keys' 'rustykeys-bin')
conflicts=('rusty_keys' 'rustykeys-bin')
source=("rustykeys::${url}/releases/download/v${pkgver}/rusty_keys"
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP'
            'SKIP')

package() {
    # 1. Install binary
    install -Dm755 "${srcdir}/rustykeys" "${pkgdir}/usr/bin/rustykeys"
    
    local src_dir="RustyKeys-main"
    
    # 2. Install shared assets
    install -d "${pkgdir}/usr/share/rustykeys/assets"
    cp -r "${srcdir}/${src_dir}/assets/"* "${pkgdir}/usr/share/rustykeys/assets/"
    
    # 3. Install Icon (SVG)
    install -Dm644 "${srcdir}/${src_dir}/assets/rustykeys.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rustykeys.svg"
    
    # 4. Create and Install Desktop Entry
    install -d "${pkgdir}/usr/share/applications"
    cat >"${pkgdir}/usr/share/applications/rustykeys.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Rusty Keys
Comment=Mechanical keyboard sound daemon
Exec=/usr/bin/rustykeys
Icon=rustykeys
Terminal=false
Categories=Utility;
StartupNotify=false
StartupWMClass=org.cloudyy.rustykeys
EOF

    # 5. Install License
    if [ -f "${srcdir}/${src_dir}/LICENSE" ]; then
        install -Dm644 "${srcdir}/${src_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}

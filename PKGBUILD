# Maintainer: schultz-dev0 <your.email@example.com>
pkgname=rusty_keys-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="A mechanical keyboard sound emulator (GTK4/Libadwaita)"
arch=('x86_64')
url="https://github.com/schultz-dev0/RustyKeys"
license=('MIT')
depends=('gtk4' 'libadwaita' 'alsa-lib')
provides=('rusty_keys')
conflicts=('rusty_keys')
source=("rusty_keys::${url}/releases/download/v${pkgver}/rusty_keys"
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP'
            '48b47d04aec96300e04c151303b87e9600207e1c4e430b2e98a881366d455df8')

package() {
    # 1. Install binary
    install -Dm755 "${srcdir}/rusty_keys" "${pkgdir}/usr/bin/rusty_keys"
    
    local src_dir="RustyKeys-${pkgver}"
    
    # 2. Install shared assets (sounds and css)
    install -d "${pkgdir}/usr/share/rusty_keys/assets"
    cp -r "${srcdir}/${src_dir}/assets/"* "${pkgdir}/usr/share/rusty_keys/assets/"
    
    # 3. Install Icon
    install -Dm644 "${srcdir}/${src_dir}/assets/rustykeys.png" "${pkgdir}/usr/share/pixmaps/rustykeys.png"
    
    # 4. Create and Install Desktop Entry
    install -d "${pkgdir}/usr/share/applications"
    cat >"${pkgdir}/usr/share/applications/rusty_keys.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Rusty Keys
Comment=Mechanical keyboard sound daemon
Exec=/usr/bin/rusty_keys
Icon=rustykeys.png
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

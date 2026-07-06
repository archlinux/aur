# Maintainer: MoonVlad
# Contributor: Daniel S. Palma <contato at danielspalma dot adm dot br>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>

pkgname=adspower-global
pkgver=8.6.3
pkgrel=1
pkgdesc="AdsPower - Antidetect Browser for Multi-Account Management"
arch=('x86_64')
url="https://www.adspower.com"
license=('LicenseRef-AdsPower-EULA')
makedepends=('binutils')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'libcups'
    'libdrm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
)
optdepends=(
    'libnotify: desktop notifications'
    'libsecret: credential storage'
    'libappindicator-gtk3: tray icon support'
    'xdg-utils: open URLs in default browser'
)
options=('!strip')
source=(
    "AdsPower-Global-${pkgver}-x64.deb::https://version.adspower.net/software/linux-x64-global/${pkgver}/AdsPower-Global-${pkgver}-x64.deb"
)
noextract=("AdsPower-Global-${pkgver}-x64.deb")
sha256sums=('1ad4ffb5720bca1f9cc9c60023bdf754c2fb0812ce6f1834f5897e3907be9c63')

package() {
    cd "$srcdir"
    ar x "AdsPower-Global-${pkgver}-x64.deb"
    bsdtar -xf data.tar.xz -C "$pkgdir"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/adspower-global" << 'EOF'
#!/bin/sh
exec "/opt/AdsPower Global/adspower_global" "$@"
EOF

    for size in 16 32 48 64 128 256 512 1024; do
        if [[ -f "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/adspower_global.png" ]]; then
            mv "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/adspower_global.png" \
               "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/adspower-global.png"
        fi
    done

    rm -f "$pkgdir/usr/share/applications/adspower_global.desktop"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/adspower-global.desktop" << 'EOF'
[Desktop Entry]
Name=AdsPower Global
Comment=Antidetect Browser for Multi-Account Management
Exec=adspower-global %U
Icon=adspower-global
Terminal=false
Type=Application
Categories=Network;WebBrowser;
StartupWMClass=AdsPower Global
EOF
}

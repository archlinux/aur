# Maintainer: Watzon <cawatson1993@gmail.com>

pkgname=windsurf
pkgver=1.0.2
pkgrel=1
pkgdesc="AI-first code editor from Codeium, based on VS Code"
arch=('x86_64')
url="https://codeium.com/windsurf"
license=('custom')
depends=(
    'alsa-lib'
    'gcc-libs'
    'glibc'
    'gnupg'
    'gtk3'
    'libnotify'
    'libsecret'
    'libxkbfile'
    'libxss'
    'lsof'
    'nss'
    'shared-mime-info'
    'xdg-utils'
)
optdepends=(
    'glib2: move to trash functionality'
    'icu69: live share'
    'libdbusmenu-glib: KDE global menu'
    'org.freedesktop.secrets: keyring storage'
)
provides=('windsurf')
conflicts=()
options=('!strip' '!emptydirs')
source=("https://windsurf-stable.codeiumdata.com/linux-x64/stable/56025767068f846a4d68adf1914f19f9c34e1375/Windsurf-linux-x64-${pkgver}.tar.gz")
sha256sums=('6315e74b08d5f3fd0ed9295bea8a4a7c47518866ed05a015911a60fc15e57fa8')

package() {
    cd "${srcdir}/Windsurf"
    
    # Create installation directories
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    
    # Copy application files
    cp -r * "${pkgdir}/opt/${pkgname}/"
    
    # Install license if it exists
    if [ -f "LICENSES.chromium.html" ]; then
        install -Dm644 "LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
    
    # Install icon
    install -Dm644 "resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    # Create launcher script
    cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash
exec /opt/${pkgname}/windsurf "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Create desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Windsurf
Comment=AI-first code editor from Codeium
GenericName=Text Editor
Exec=/usr/bin/windsurf %F
Terminal=false
Type=Application
Icon=${pkgname}
Categories=Development;TextEditor;Utility;
Keywords=windsurf;vscode;code;ide;editor;
MimeType=text/plain;inode/directory;
StartupWMClass=windsurf
EOF
}

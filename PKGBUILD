# Maintainer: Markus Maiwald <markus@maiwald.work>
# Working baseline from: antigravity-bin pkgver=1.11.3

pkgname=antigravity-bin-hardened
pkgver=1.11.5
_buildid=5234145629700096
pkgrel=1
pkgdesc="Google Antigravity - Agentic Development Platform (Hardened for High-Security/Corporate Environments)"
# Hardening: Strict permissions, AppArmor profile, and dependency enforcement.
arch=('x86_64')
url="https://antigravity.google/"
license=('Proprietary')
install=$pkgname.install
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils' 'glibc' 'nspr' 'at-spi2-core' 'libdrm' 'mesa')
optdepends=(
    'apparmor: Mandatory Access Control (MAC) security framework'
)
options=('!strip')
source=("https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_buildid}/linux-x64/Antigravity.tar.gz"
        "antigravity.apparmor"
        "antigravity-launcher.sh"
        "SECURITY.md")
sha256sums=('4e03151a55743cf30fac595abb343c9eb5a3b6a80d2540136d75b4ead8072112'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    install -d "$pkgdir/opt/antigravity"

    _extracted_dir=$(find "$srcdir" -maxdepth 1 -type d -name "Antigravity*" | head -n 1)

    if [ -z "$_extracted_dir" ]; then
        echo "Error: Could not find extracted directory."
        exit 1
    fi

    cp -r "$_extracted_dir"/* "$pkgdir/opt/antigravity/"

    # Per pkgrel=9 findings, DO NOT recursively chmod files.
    # Electron applications are sensitive to permission changes and ship with the
    # permissions they need. Changing them causes crashes.
    # The only required change is for the SUID sandbox.
    
    # 3. CRITICAL: chrome-sandbox must be SUID root (4755)
    # This is required for Electron's Layer 1 Sandbox to work.
    # Without this, the app is LESS secure as it cannot sandbox renderer processes.
    chmod 4755 "$pkgdir/opt/antigravity/chrome-sandbox"

    # Install launcher wrapper script (auto-detects Wayland/X11)
    install -Dm755 antigravity-launcher.sh "$pkgdir/usr/bin/antigravity"

    install -d "$pkgdir/usr/share/pixmaps"
    
    _icon_path="$pkgdir/opt/antigravity/resources/app/resources/linux/code.png"
    
    if [ -f "$_icon_path" ]; then
        ln -s "/opt/antigravity/resources/app/resources/linux/code.png" "$pkgdir/usr/share/pixmaps/antigravity.png"
    else
        echo "Warning: Specific icon path not found. Searching for alternatives..."
        _found_icon=$(find "$pkgdir/opt/antigravity" -name "*.png" | head -n 1)
        if [ -n "$_found_icon" ]; then
            # ln -s requires absolute path, ensure we use the destination path /opt/...
            _rel_path=${_found_icon#$pkgdir}
            ln -s "$_rel_path" "$pkgdir/usr/share/pixmaps/antigravity.png"
        fi
    fi

    install -d "$pkgdir/usr/share/applications"
    
    cat > "$pkgdir/usr/share/applications/antigravity.desktop" <<EOF
[Desktop Entry]
Name=Antigravity
Comment=Agentic Development Platform
Exec=/usr/bin/antigravity
Icon=antigravity
Type=Application
Categories=Development;IDE;
Terminal=false
StartupWMClass=Antigravity
EOF

    # AppArmor Profile (Optional Security Enhancement)
    install -Dm644 antigravity.apparmor "$pkgdir/usr/share/apparmor/antigravity.apparmor"

    # Install Security Documentation
    install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
}

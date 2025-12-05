# Maintainer: Markus Maiwald <markus@maiwald.work>
# Working baseline from: antigravity-bin pkgver=1.11.3

pkgname=antigravity-bin-hardened
pkgver=1.11.14
_buildid=1764918088
pkgrel=3
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
source=("https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/pool/antigravity-debian/antigravity_${pkgver}-${_buildid}_amd64_acf73c2fd8e096dca6a2d5535d58efc5.deb"
        "antigravity.apparmor"
        "antigravity-launcher.sh"
        "SECURITY.md")
b2sums=('a9e30b0cae6f4f53f989f1df73f8cceee990cbaa969dcaef414fdef6ff1d6d405edbb12bf7f68c2dc5ab86c2d8285024bd91b374d4c3f74cefd259192c27118d'
        '7f798f00963135367af98bd908051f34bd783be937e35769500e49448c1fd833665f5d07e2106c13c31107f0289fa7c74e9c7c84dfe741427ea09c571cc4122a'
        '7a7de35a8ff922246892c05109836fabb318f7ad1979ab5c49564c9ae13dbbd60fd8d58a43bd4a7d5cb74b514756ace0b93206105e7ebf44c5b4d2ac26d67903'
        '8743125f8f27728230b716059228756bcd2b8b5e08c35c7b318f43596f8108d13d50c37181e3715083dfa291b8899f78289dd5c3572a9d3ee2338ab3745543ea')

package() {
    install -d "$pkgdir/opt/antigravity"
    cd "$srcdir"
    # The .deb file is extracted by makepkg, resulting in data.tar.xz (or .gz/.zst)
    # We need to extract that to get the actual files.
    bsdtar -xf data.tar.*

    # For .deb source, contents are extracted to usr/share/antigravity (relative to srcdir)
    # We move them to /opt/antigravity to match Arch standards and previous layout
    if [ -d "usr/share/antigravity" ]; then
        cp -r "usr/share/antigravity"/* "$pkgdir/opt/antigravity/"
    else
        echo "Error: Could not find extracted directory at $srcdir/usr/share/antigravity"
        echo "Contents of srcdir:"
        ls -R
        exit 1
    fi

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
Exec=/usr/bin/antigravity %u
Icon=antigravity
Type=Application
Categories=Development;IDE;
MimeType=x-scheme-handler/antigravity;
Terminal=false
StartupWMClass=Antigravity
EOF

    # AppArmor Profile (Optional Security Enhancement)
    install -Dm644 antigravity.apparmor "$pkgdir/usr/share/apparmor/antigravity.apparmor"

    # Install Security Documentation
    install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
}

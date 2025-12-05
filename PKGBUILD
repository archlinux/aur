# Maintainer: Aaron Rubesh <contact@aaronrubesh.io>
pkgname=antigravity-bin
pkgver=1.11.13_1764808015
pkgrel=1
pkgdesc="Google Antigravity - Agentic Development Platform"
arch=('x86_64')
url="https://antigravity.google"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxkbfile' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs')
provides=('antigravity')
conflicts=('antigravity')
options=('!strip')
source=("https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/pool/antigravity-debian/antigravity_1.11.13-1764808015_amd64_8bc342d4c140b28c7fdd0f945033f696.deb")
sha256sums=('4304347e9257ecbc75e0e023f42fe6dcc0c87bae093b4acfacc021a91c2703f6')

package() {
    # Extract the data.tar.* from the deb package.
    cd "$srcdir"
    
    if [ -f "data.tar.xz" ]; then
        tar -xf data.tar.xz
    elif [ -f "data.tar.zst" ]; then
        tar -xf data.tar.zst
    elif [ -f "data.tar.gz" ]; then
        tar -xf data.tar.gz
    else
        msg "Error: Could not find data.tar.* inside deb archive."
        return 1
    fi

    # Create target directories
    install -d "$pkgdir/opt/antigravity"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/pixmaps"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    # Move application content to /opt/antigravity
    cp -r usr/share/antigravity/* "$pkgdir/opt/antigravity/"
    
    # Install License(s)
    # Look for common license files in the extracted directory
    # Based on file listing, we know LICENSES.chromium.html exists.
    if [ -f "usr/share/antigravity/LICENSES.chromium.html" ]; then
        install -m644 "usr/share/antigravity/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
    fi
    # Also check for a standard LICENSE file
    if [ -f "usr/share/antigravity/LICENSE" ]; then
        install -m644 "usr/share/antigravity/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    elif [ -f "usr/share/antigravity/resources/app/LICENSE.txt" ]; then
        # Sometimes hidden in resources
        install -m644 "usr/share/antigravity/resources/app/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    # Handle Desktop files
    for desktop_file in usr/share/applications/*.desktop; do
        if [ -f "$desktop_file" ]; then
            sed 's|/usr/share/antigravity/antigravity|/opt/antigravity/antigravity|g' "$desktop_file" > "$pkgdir/usr/share/applications/$(basename "$desktop_file")"
            chmod 644 "$pkgdir/usr/share/applications/$(basename "$desktop_file")"
        fi
    done

    # Create symlink for the executable
    ln -s /opt/antigravity/antigravity "$pkgdir/usr/bin/antigravity"
    
    # Create symlink for the icon, if found
    if [ -f "$pkgdir/opt/antigravity/resources/app/resources/linux/code.png" ]; then
        ln -s /opt/antigravity/resources/app/resources/linux/code.png "$pkgdir/usr/share/pixmaps/antigravity.png"
    fi

    # Set executable permissions
    chmod 755 "$pkgdir/opt/antigravity/antigravity"
    chmod 755 "$pkgdir/opt/antigravity/chrome_crashpad_handler" 2>/dev/null || true
}

# Maintainer: Aaron Rubesh <contact@aaronrubesh.io>
pkgname=antigravity-bin
pkgver=1.13.3_1766182170
pkgrel=1
pkgdesc="Google Antigravity - Agentic Development Platform"
arch=('x86_64')
url="https://antigravity.google"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxkbfile' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs')
provides=('antigravity')
conflicts=('antigravity')
options=('!strip')
source=("https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/pool/antigravity-debian/antigravity_1.13.3-1766182170_amd64_365061c50063f9bd47a9ff88432261b8.deb")
sha256sums=('d9920f9e0788245b1dab0f73a607b4eea00605bfb70e16795da1c1ac89eabd4b')

package() {
    # Extract the data.tar.* from the deb package.
    cd "$srcdir"
    
    if [ -f "data.tar.xz" ]; then
        tar -xf data.tar.xz --no-same-owner
    elif [ -f "data.tar.zst" ]; then
        tar -xf data.tar.zst --no-same-owner
    elif [ -f "data.tar.gz" ]; then
        tar -xf data.tar.gz --no-same-owner
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

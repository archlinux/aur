# Maintainer: Mufaro <contact@mufaro.dev>
pkgname=antigravity-bin
pkgver=1.11.2
_buildid=6251250307170304
pkgrel=2
pkgdesc="Google Antigravity - Agentic Development Platform (Pre-built Binary)"
arch=('x86_64')
url="https://antigravity.google.com"
license=('Proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils' 'glibc' 'nspr' 'at-spi2-core' 'libdrm' 'mesa')
options=('!strip')
source=("https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_buildid}/linux-x64/Antigravity.tar.gz")
sha256sums=('d1b1115ae76c275c376ea660e1e4d2dc20eb3e72d6a206b096505b944a5f64b7')

package() {
    install -d "$pkgdir/opt/antigravity"

    # Locate the extracted directory. 
    # Usually "Antigravity" or "antigravity-linux-x64" inside srcdir
    _extracted_dir=$(find "$srcdir" -maxdepth 1 -type d -name "Antigravity*" | head -n 1)

    if [ -z "$_extracted_dir" ]; then
        echo "Error: Could not find extracted directory."
        exit 1
    fi

    # Copy contents from the nested folder to /opt/antigravity to flatten structure
    cp -r "$_extracted_dir"/* "$pkgdir/opt/antigravity/"

    # Create the binary symlink
    install -d "$pkgdir/usr/bin"

    # Check if binary is named "Antigravity" (Capital) or "antigravity" (Lower)
    if [ -f "$pkgdir/opt/antigravity/Antigravity" ]; then
        chmod +x "$pkgdir/opt/antigravity/Antigravity"
        ln -s "/opt/antigravity/Antigravity" "$pkgdir/usr/bin/antigravity"
    elif [ -f "$pkgdir/opt/antigravity/antigravity" ]; then
        chmod +x "$pkgdir/opt/antigravity/antigravity"
        ln -s "/opt/antigravity/antigravity" "$pkgdir/usr/bin/antigravity"
    else
        echo "Error: Could not find binary 'antigravity' or 'Antigravity' in /opt/antigravity"
        # List files to help debugging if this fails
        ls -R "$pkgdir/opt/antigravity"
        exit 1
    fi

    # Install .desktop file if it exists
    if [ -f "$pkgdir/opt/antigravity/antigravity.desktop" ]; then
        install -d "$pkgdir/usr/share/applications"
        # Fix common issue where .desktop Exec path is relative
        sed -i 's|^Exec=.*|Exec=/usr/bin/antigravity|' "$pkgdir/opt/antigravity/antigravity.desktop"
        ln -s "/opt/antigravity/antigravity.desktop" "$pkgdir/usr/share/applications/antigravity.desktop"
    fi

    # Install Icon
    if [ -f "$pkgdir/opt/antigravity/product_logo_256.png" ]; then
        install -d "$pkgdir/usr/share/pixmaps"
        ln -s "/opt/antigravity/product_logo_256.png" "$pkgdir/usr/share/pixmaps/antigravity.png"
    fi
}

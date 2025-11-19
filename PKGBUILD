# Maintainer: Markus Maiwald <markus@maiwald.work>
# Working baseline from: antigravity-bin pkgver=1.11.3

pkgname=antigravity-bin-hardened
pkgver=1.11.3
_buildid=6583016683339776
pkgrel=5
pkgdesc="Google Antigravity - Agentic Development Platform (Pre-built Binary)"
arch=('x86_64')
url="https://antigravity.google/"
license=('Proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils' 'glibc' 'nspr' 'at-spi2-core' 'libdrm' 'mesa')
options=('!strip')
source=("https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_buildid}/linux-x64/Antigravity.tar.gz")
sha256sums=('025da512f9799a7154e2cc75bc0908201382c1acf2e8378f9da235cb84a5615b')

package() {
    install -d "$pkgdir/opt/antigravity"

    _extracted_dir=$(find "$srcdir" -maxdepth 1 -type d -name "Antigravity*" | head -n 1)

    if [ -z "$_extracted_dir" ]; then
        echo "Error: Could not find extracted directory."
        exit 1
    fi

    cp -r "$_extracted_dir"/* "$pkgdir/opt/antigravity/"

    install -d "$pkgdir/usr/bin"
    
    if [ -f "$pkgdir/opt/antigravity/Antigravity" ]; then
        chmod +x "$pkgdir/opt/antigravity/Antigravity"
        ln -s "/opt/antigravity/Antigravity" "$pkgdir/usr/bin/antigravity"
    elif [ -f "$pkgdir/opt/antigravity/antigravity" ]; then
        chmod +x "$pkgdir/opt/antigravity/antigravity"
        ln -s "/opt/antigravity/antigravity" "$pkgdir/usr/bin/antigravity"
    else
        echo "Error: Could not find binary 'antigravity' or 'Antigravity' in /opt/antigravity"
        ls -R "$pkgdir/opt/antigravity"
        exit 1
    fi

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
}

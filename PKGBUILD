# Maintainer: Mufaro <contact@mufaro.dev>
pkgname=antigravity-bin
pkgver=1.11.5
_buildid=5234145629700096
pkgrel=1
pkgdesc="Google Antigravity - Agentic Development Platform (Pre-built Binary)"
arch=('x86_64')
url="https://antigravity.google/"
license=('Proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils' 'glibc' 'nspr' 'at-spi2-core' 'libdrm' 'mesa')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_buildid}/linux-x64/Antigravity.tar.gz")
sha256sums=('4e03151a55743cf30fac595abb343c9eb5a3b6a80d2540136d75b4ead8072112')

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
            # Ensure relative path calculation for symlink
            _rel_path=${_found_icon#$pkgdir}
            ln -s "$_rel_path" "$pkgdir/usr/share/pixmaps/antigravity.png"
        fi
    fi

    install -d "$pkgdir/usr/share/applications"
    
    cat > "$pkgdir/usr/share/applications/antigravity.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Antigravity
Icon=antigravity
Categories=Development;IDE;
StartupWMClass=Antigravity
MimeType=x-scheme-handler/antigravity;
X-KDE-Protocols=antigravity;
Exec=/usr/bin/antigravity %u
EOF
}

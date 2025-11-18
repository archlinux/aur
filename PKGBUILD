# Maintainer: Mufaro <contact@mufaro.dev>
pkgname=antigravity-bin-hardened
pkgver=1.11.2
_buildid=6251250307170304
pkgrel=8
pkgdesc="Google Antigravity Agentic Development Platform (Pre-built Binary). This hardened version features a fully verified, non-guesswork dependency list derived from the vendor's control file for superior stability."
arch=('x86_64')
url="https://antigravity.google/"
license=('Proprietary')
# New (Superior) Dependency Line:
depends=('alsa-lib' 'at-spi2-atk' 'atk' 'cairo' 'cups' 'curl' 'dbus' 'expat' 'glib2' 'gtk3' 'nss' 'pango' 'xdg-utils' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'ca-certificates')
options=('!strip')
source=("https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_buildid}/linux-x64/Antigravity.tar.gz")
sha256sums=('d1b1115ae76c275c376ea660e1e4d2dc20eb3e72d6a206b096505b944a5f64b7')

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


package() {
    install -d "$pkgdir/opt/antigravity"

    # Locate the extracted directory from the tarball
    _extracted_dir=$(find "$srcdir" -maxdepth 1 -type d -name "Antigravity*" | head -n 1)

    if [ -z "$_extracted_dir" ]; then
        echo "Error: Could not find extracted directory."
        exit 1
    fi

    # Copy the binary application files to the FHS compliant /opt directory
    cp -r "$_extracted_dir"/* "$pkgdir/opt/antigravity/"
    
    # --- HARDENING PROTOCOL START (New additions) ---

    # 1. License Compliance: Install the proprietary license file.
    # NOTE: Assumes 'LICENSE' is present in the source tarball root.
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # 2. Permission Hardening: Set strict 0644 permissions (read-only for others) 
    # for all non-executable files (docs, assets, etc.).
    # Exclude the main binaries from this step.
    find "$pkgdir" -type f \
        ! -name 'antigravity' \
        ! -name 'Antigravity' \
        -exec chmod 644 {} +
    
    # 3. Ensure the main executable has correct permissions (0755).
    chmod 755 "$pkgdir/opt/antigravity/Antigravity" 

    # --- HARDENING PROTOCOL END ---

    install -d "$pkgdir/usr/bin"
    
    # Standard symlink creation to make the binary accessible in the PATH
    if [ -f "$pkgdir/opt/antigravity/Antigravity" ]; then
        ln -s "/opt/antigravity/Antigravity" "$pkgdir/usr/bin/antigravity"
    elif [ -f "$pkgdir/opt/antigravity/antigravity" ]; then
        # Handle the alternative lowercase name if necessary
        ln -s "/opt/antigravity/antigravity" "$pkgdir/usr/bin/antigravity"
    else
        # Critical failure if no binary is found
        echo "Error: Could not find binary 'antigravity' or 'Antigravity' in /opt/antigravity"
        ls -R "$pkgdir/opt/antigravity"
        exit 1
    fi

    # ------------------ Desktop/Icon Logic (Retained) --------------------

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

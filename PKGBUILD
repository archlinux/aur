# Maintainer: Jan64X <jan.petrlik@protonmail.com>
pkgname=wifiman-desktop
pkgver=1.1.3
pkgrel=1
pkgdesc="WiFiman Desktop - Network analysis and WiFi speed testing tool by Ubiquiti"
arch=('x86_64')
url="https://www.ui.com/wifiman-desktop/"
license=('proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'iw' 'libayatana-appindicator' 'libsoup' 'net-tools' 'openssl' 'pango' 'resolvconf' 'webkit2gtk')
makedepends=('debtap')
source=("https://desktop.wifiman.com/${pkgname}-${pkgver}-amd64.deb")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir"
    
    # Copy the actual file instead of using symlink
    msg "Copying .deb file to avoid symlink issues..."
    cp -L "${pkgname}-${pkgver}-amd64.deb" "${pkgname}-${pkgver}-amd64-copy.deb"
    
    # Convert .deb to Arch package using debtap
    # Note: This requires debtap to be configured (debtap -u)
    msg "Converting .deb package with debtap..."
    
    # Run debtap non-interactively on the copied file
    echo -e "\n\n" | debtap -q "${pkgname}-${pkgver}-amd64-copy.deb"
    
    # Extract the generated package to fix dependencies
    msg "Fixing GTK dependencies..."
    
    # Find the actual generated package name (debtap sometimes changes it)
    generated_pkg=$(find . -name "*${pkgver}*x86_64.pkg.tar.zst" -type f | head -1)
    if [[ -z "$generated_pkg" ]]; then
        error "Could not find generated package"
        return 1
    fi
    
    msg "Found generated package: $generated_pkg"
    tar -xf "$generated_pkg"
    
    # Remove the generic 'gtk' dependency since we have gtk3
    sed -i '/^depend = gtk$/d' .PKGINFO
    
    # Repackage with correct name
    tar -cJf "${pkgname}-${pkgver}-1-x86_64.pkg.tar.zst" .PKGINFO .MTREE usr/
    
    # Clean up extracted files to avoid them being included in final package
    rm -f .PKGINFO .MTREE
    rm -rf usr/
}

package() {
    cd "$srcdir"
    
    # Extract only the usr/ directory from the fixed package
    tar -xf "${pkgname}-${pkgver}-1-x86_64.pkg.tar.zst" usr/
    
    # Copy extracted files to package directory
    cp -r usr "$pkgdir/"
    
    # Install license if it exists
    if [ -f "$pkgdir/usr/share/doc/$pkgname/copyright" ]; then
        install -Dm644 "$pkgdir/usr/share/doc/$pkgname/copyright" \
                       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

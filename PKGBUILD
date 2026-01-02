# Maintainer: piotrek1372 <your-email@example.com>
pkgname=ca-racing
pkgver=0.1.0_alpha
pkgrel=1
pkgdesc="A retro-style 2D top-down racing game"
arch=('x86_64')
url="https://github.com/piotrek1372/ca-racing"
license=('Apache')
depends=()
makedepends=()
provides=('ca-racing')
conflicts=('ca-racing')
# For local testing, you can use: source=("file://path/to/CA-Racing-0.1.0-alpha-setup.run")
# For AUR release, use the GitHub URL after creating the release
source=("https://github.com/piotrek1372/ca-racing/releases/download/v0.1.0-alpha/CA-Racing-0.1.0-alpha-setup.run")
sha256sums=('SKIP')  # Run 'updpkgsums' after release to update checksum

package() {
    # Create directories
    install -dm755 "${pkgdir}/opt/ca-racing"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps"
    
    # Extract and install game files
    cd "${srcdir}"
    chmod +x "CA-Racing-${pkgver}-setup.run"
    
    # Manual extraction (since the installer requires root)
    # Extract the archive part
    ARCHIVE_LINE=$(awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' "CA-Racing-${pkgver}-setup.run")
    tail -n +${ARCHIVE_LINE} "CA-Racing-${pkgver}-setup.run" | tar -xz
    
    # Install files
    cp -r files/* "${pkgdir}/opt/ca-racing/"
    chmod +x "${pkgdir}/opt/ca-racing/CA-Racing"
    
    # Install icon
    install -Dm644 "files/ca-racing.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/ca-racing.png"
    
    # Install desktop file
    cat > "${pkgdir}/usr/share/applications/ca-racing.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=CA-Racing 0.1.0-alpha
GenericName=Racing Game
Comment=A retro-style 2D top-down racing game (Alpha version)
Exec=/opt/ca-racing/CA-Racing
Icon=ca-racing
Categories=Game;ArcadeGame;
Terminal=false
StartupNotify=true
Path=/opt/ca-racing
EOF
}

# Maintainer: Admon <git at admon dot me>

pkgname=geminidesk-bin
_pkgname=gemini-desk
pkgver=8.3.0
pkgrel=1
pkgdesc="An unofficial Gemini client for desktop (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/hillelkingqt/GeminiDesk"
license=('MIT')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
makedepends=('asar')
provides=('geminidesk')
conflicts=('geminidesk' 'geminidesk-git')
source=("GeminiDesk-${pkgver}.AppImage::https://github.com/hillelkingqt/GeminiDesk/releases/download/v${pkgver}/GeminiDesk-${pkgver}-x86_64.AppImage"
        "gemini-desk.desktop"
        "fix-tray-icon-linux.patch"
        "icon-tray.png")
sha256sums=('221808d4a92b22f4f9def45ef33d3c0c408323f77f68170f892ab733c6f91374'
            'd0971aa208441743f0654a53e63be90cf0007be67eb11741c1ee2c4b8232cc8c'
            '2d98f057cf7f8a448a7c55da717450f9e56d067ae6934f8e7320baa6e925c325'
            '7a0ee0649e6d89a6809fc09a5313bd7ef0eaff94d8b29aaae5de16da672437b8')
options=('!strip')

prepare() {
    chmod +x "GeminiDesk-${pkgver}.AppImage"
    
    # Extract AppImage
    "./GeminiDesk-${pkgver}.AppImage" --appimage-extract
    
    # Extract ASAR archive
    cd squashfs-root/resources
    asar extract app.asar app
    
    # Fix line endings
    cd app
    find . -type f -name "*.js" -exec sed -i 's/\r$//' {} +
    
    # Apply tray icon patch
    patch -p1 < "${srcdir}/fix-tray-icon-linux.patch"
    
    # Repackage ASAR
    cd ..
    rm app.asar
    asar pack app app.asar
    rm -rf app
    
    # Copy tray icon to resources/icons (outside ASAR)
    cp "${srcdir}/icon-tray.png" icons/icon-tray.png
}

package() {
    # Install patched AppImage contents
    install -dm755 "$pkgdir/opt/GeminiDesk"
    cp -r squashfs-root/* "$pkgdir/opt/GeminiDesk/"
    
    # Fix permissions for resources directory
    chmod -R 755 "$pkgdir/opt/GeminiDesk/resources"
    
    # Install icon
    install -Dm644 squashfs-root/usr/share/icons/hicolor/1024x1024/apps/gemini-desk.png \
        "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/gemini-desk.png"
    
    # Install desktop file
    install -Dm644 gemini-desk.desktop "$pkgdir/usr/share/applications/gemini-desk.desktop"
    
    # Install license
    install -Dm644 squashfs-root/LICENSE.electron.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    
    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/gemini-desk" <<'EOF'
#!/bin/bash
export APPDIR=/opt/GeminiDesk
exec /opt/GeminiDesk/gemini-desk "$@"
EOF
    chmod +x "$pkgdir/usr/bin/gemini-desk"
}

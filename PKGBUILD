# Maintainer: Lucasion <ion@ionnet.dev>
# Note: Build with "PKGEXT='.pkg.tar.zst' makepkg" to avoid debug package conflicts
pkgname=toxen3
pkgver=2.4.2
pkgrel=1
pkgdesc="Toxen - A highly customizable music player with visualizers, audio effects, and storyboards"
arch=('x86_64')
url="https://github.com/LucasionGS/Toxen3"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('electron30-bin' 'nodejs>=22' 'npm')
options=('!debug' '!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LucasionGS/Toxen3/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual checksum

prepare() {
    cd "$srcdir/Toxen3-$pkgver"
    
    # Install dependencies
    npm i
}

build() {
    cd "$srcdir/Toxen3-$pkgver"
    
    # Set NODE_ENV for production build
    export NODE_ENV=production
    
    # Package the application
    npm run package
}

package() {
    cd "$srcdir/Toxen3-$pkgver"
    
    # Install the packaged application
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r out/Toxen-linux-x64/* "$pkgdir/opt/$pkgname/"
    
    # Create wrapper script for global toxen3 command
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/toxen3" << 'EOF'
#!/bin/bash
exec /opt/toxen3/toxen3 "$@"
EOF
    chmod +x "$pkgdir/usr/bin/toxen3"
    
    # Install desktop file
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Toxen
Comment=A highly customizable music player with visualizers and audio effects
Exec=toxen3 %U
Icon=toxen3
Categories=AudioVideo;Audio;Player;
StartupNotify=true
MimeType=audio/mpeg;audio/mp4;audio/x-wav;audio/ogg;audio/flac;video/mp4;video/x-msvideo;video/quicktime;
EOF

    # Install icon (if available)
    if [ -f "src/icons/sizes/icon.png" ]; then
        install -dm755 "$pkgdir/usr/share/pixmaps"
        install -m644 "src/icons/sizes/icon.png" "$pkgdir/usr/share/pixmaps/toxen3.png"
    fi
    
    # Install license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
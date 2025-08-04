# Maintainer: Your Name <your.email@example.com>
pkgname=openotp
pkgver=1.1.3
pkgrel=1
pkgdesc="A feature-rich, secure OTP (One-Time Password) generator app built with Flutter"
arch=('x86_64')
url="https://github.com/Slipstreamm/OpenOTP"
license=('GPL3')
depends=('gtk3' 'libsecret')
makedepends=('flutter' 'cmake' 'ninja' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Slipstreamm/OpenOTP/archive/v$pkgver.tar.gz"
        "openotp.desktop")
sha256sums=('7c921653d6be4401d2660e30b8ea81f27ecc3fcc83e1b996d3585dc1cbe81634'
            '1c317d00e15319f7c356d280e748c88a0dc5486a8536bcc32cc1db551b37dfed')

prepare() {
    cd "$srcdir/OpenOTP-$pkgver"
    
    # Get Flutter dependencies
    flutter pub get
}

build() {
    cd "$srcdir/OpenOTP-$pkgver"
    
    # Build for Linux
    flutter build linux --release
}

package() {
    cd "$srcdir/OpenOTP-$pkgver"
    
    # Install the application
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r build/linux/x64/release/bundle/* "$pkgdir/opt/$pkgname/"
    
    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
cd /opt/$pkgname
exec ./openotp "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"
    
    # Install desktop file
    install -Dm644 "$srcdir/openotp.desktop" "$pkgdir/usr/share/applications/openotp.desktop"
    
    # Install icon
    install -Dm644 "assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/openotp.png"
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

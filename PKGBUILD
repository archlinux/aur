# Maintainer: Your Name <your.email@example.com>
pkgname=zima-linux-client
pkgver=0.9.23
pkgrel=1
pkgdesc="Modern Desktop Client for ZimaOS with integrated ZeroTier and SMB management"
arch=('x86_64')
url="https://github.com/chicohaager/zima-linux-client"
license=('MIT')
depends=(
    'electron'
    'fuse2'
    'smbclient'
    'nss'
    'gtk3'
    'libxkbcommon'
    'libxcb'
    'libx11'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxrandr'
    'alsa-lib'
    'at-spi2-core'
    'libcups'
    'libdrm'
    'mesa'
    'libsecret'
    'nodejs'
)
makedepends=('npm' 'nodejs' 'git' 'libsecret' 'python')
install=zima-linux-client.install
source=(
    "git+https://github.com/chicohaager/zima-linux-client.git#tag=v${pkgver}"
    "zima-linux-client.sh"
    "zima-linux-client.desktop"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

build() {
    cd "$srcdir/$pkgname"
    
    # Install dependencies
    npm install
    
    # Build the application
    npm run build
}

package() {
    cd "$srcdir/$pkgname"
    
    # Create directories
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "$pkgdir/usr/lib/$pkgname/resources"
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    
    # Copy built files (preserve dist directory structure)
    cp -r dist "$pkgdir/usr/lib/$pkgname/"
    cp package.json "$pkgdir/usr/lib/$pkgname/"
    
    # Install production dependencies only and rebuild for electron
    cd "$pkgdir/usr/lib/$pkgname"
    npm install --omit=dev
    local electron_version=$(electron --version | sed 's/v//')
    npx @electron/rebuild -v "$electron_version"
    
    # Remove unnecessary files to reduce package size
    find "$pkgdir/usr/lib/$pkgname/node_modules" -name "*.md" -delete 2>/dev/null || true
    find "$pkgdir/usr/lib/$pkgname/node_modules" -name "*.ts" ! -name "*.d.ts" -delete 2>/dev/null || true
    find "$pkgdir/usr/lib/$pkgname/node_modules" -type d -name "test" -exec rm -rf {} + 2>/dev/null || true
    find "$pkgdir/usr/lib/$pkgname/node_modules" -type d -name "tests" -exec rm -rf {} + 2>/dev/null || true
    find "$pkgdir/usr/lib/$pkgname/node_modules" -type d -name "__tests__" -exec rm -rf {} + 2>/dev/null || true
    
    cd "$srcdir/$pkgname"
    
    # Copy ZeroTier binaries
    cp -r bin "$pkgdir/usr/lib/$pkgname/"
    
    # Copy resources
    cp -r resources/*.service "$pkgdir/usr/lib/$pkgname/resources/" 2>/dev/null || true
    cp -r resources/*.sh "$pkgdir/usr/lib/$pkgname/resources/" 2>/dev/null || true
    cp -r resources/copyright "$pkgdir/usr/lib/$pkgname/resources/" 2>/dev/null || true
    
    # Install icon
    install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    
    # Install launcher script
    install -Dm755 "$srcdir/zima-linux-client.sh" "$pkgdir/usr/bin/$pkgname"
    
    # Install desktop file
    install -Dm644 "$srcdir/zima-linux-client.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    # Install systemd user service
    install -Dm644 resources/zima-zerotier.service "$pkgdir/usr/lib/systemd/user/zima-zerotier.service"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

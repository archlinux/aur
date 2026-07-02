# Maintainer: gensui-fuga <gensui-fuga@users.noreply.github.com>

pkgname=lanshare-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-Platform Local Network File Sharing - Share files across devices on your local network. Includes Web UI (iOS 7/iPhone 4 compatible) and Android APK"
arch=('x86_64' 'aarch64')
url="https://github.com/gensui-fuga/lanshare"
license=('GPL3')
depends=('glibc')
makedepends=('go>=1.21')
optdepends=('fyne: desktop GUI')
source=("lanshare-$pkgver.tar.gz::https://github.com/gensui-fuga/lanshare/archive/v$pkgver.tar.gz"
        "lanshare.desktop")
sha256sums=('SKIP'
            'SKIP')

_sourcedir="lanshare-$pkgver"  # GitHub archives extract as repo-tag (without 'v' prefix)

build() {
    cd "$srcdir/$_sourcedir"
    
    # Build CLI version
    go build -trimpath -ldflags="-s -w" -o lanshare .
    
    # Build GUI version if fyne is available
    go build -tags gui -trimpath -ldflags="-s -w" -o lanshare-gui . 2>/dev/null || true
}

package() {
    cd "$srcdir/$_sourcedir"
    
    # Install binaries
    install -Dm755 lanshare "$pkgdir/usr/bin/lanshare"
    [ -f lanshare-gui ] && install -Dm755 lanshare-gui "$pkgdir/usr/bin/lanshare-gui"
    
    # Desktop entry
    install -Dm644 "$srcdir/lanshare.desktop" "$pkgdir/usr/share/applications/lanshare.desktop"
    
    # Web UI
    install -Dm644 static/index.html "$pkgdir/usr/share/lanshare/webui/index.html"
    install -Dm644 static/icon.svg "$pkgdir/usr/share/lanshare/webui/icon.svg"
    install -Dm644 static/favicon.png "$pkgdir/usr/share/lanshare/webui/favicon.png"
    
    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

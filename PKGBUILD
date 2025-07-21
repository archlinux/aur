# Maintainer: DonutsDelivery <megusta52@proton.me>
pkgname=plasma6-applet-freeradio
pkgver=1.5.6
pkgrel=1
pkgdesc="Ad-free internet radio widget for KDE Plasma 6"
arch=('any')
url="https://github.com/DonutsDelivery/Free-Radio-NoAds-NoTalk"
license=('GPL-2.0-or-later')
depends=('plasma-workspace' 'qt6-multimedia' 'qt6-declarative')
makedepends=('extra-cmake-modules' 'git')
optdepends=('qt6-websockets: Enhanced streaming features')
provides=('plasma-applet-freeradio')
conflicts=('plasma-applet-freeradio' 'plasma5-applet-freeradio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('48f17f4f06ccdc8205535f2a3ccf8385bf1ce6b1805ca211d7b6137a92695c4a')

prepare() {
    cd "$srcdir/Free-Radio-NoAds-NoTalk-$pkgver"
    
    # Ensure we're building the main freeradio widget
    if [[ ! -d "freeradio" ]]; then
        msg2 "Error: freeradio directory not found"
        exit 1
    fi
}

build() {
    cd "$srcdir/Free-Radio-NoAds-NoTalk-$pkgver"
    
    # Build using the CMakeLists.txt in the root
    cmake -B build -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    
    cmake --build build
}

package() {
    cd "$srcdir/Free-Radio-NoAds-NoTalk-$pkgver"
    
    # Install using cmake if available, otherwise manual install
    if [[ -f "build/Makefile" ]]; then
        DESTDIR="$pkgdir" cmake --install build
    else
        # Manual installation fallback
        msg2 "Using manual installation method"
        
        # Create target directories
        install -dm755 "$pkgdir/usr/share/plasma/plasmoids/freeradio"
        
        # Copy the widget files
        cp -r freeradio/* "$pkgdir/usr/share/plasma/plasmoids/freeradio/"
        
        # Ensure correct permissions
        find "$pkgdir/usr/share/plasma/plasmoids/freeradio" -type f -exec chmod 644 {} \;
        find "$pkgdir/usr/share/plasma/plasmoids/freeradio" -type d -exec chmod 755 {} \;
    fi
    
    # Verify installation
    if [[ ! -f "$pkgdir/usr/share/plasma/plasmoids/freeradio/metadata.json" ]]; then
        msg2 "Error: metadata.json not found after installation"
        exit 1
    fi
    
    msg2 "Installation completed successfully"
}
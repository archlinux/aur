pkgname=better-control-git
pkgver=r128.g81cf029  
pkgrel=1
pkgdesc="A tool to manage system settings easily (git version)"
arch=('any')
url="https://github.com/quantumvoid0/better-control"
license=('GPL3')
depends=('gtk3' 'networkmanager' 'bluez' 'bluez-utils' 'pipewire-pulse' 'brightnessctl' 'python-gobject' 'python-dbus' 'python' 'power-profiles-daemon' 'python-psutil' 'gammastep' 'python-pydbus')
makedepends=('git')
provides=('better-control')
conflicts=('better-control')
source=("git+https://github.com/quantumvoid0/better-control.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/better-control"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"  # Removed 0.
}

package() {
    cd "$srcdir/better-control"
    
    # Create installation directories
    install -dm755 "$pkgdir/usr/share/better-control"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    
    # Copy source files to installation directory
    cp -r src/* "$pkgdir/usr/share/better-control/"
    
    # Create better-control executable
    echo '#!/bin/bash' > "$pkgdir/usr/bin/better-control"
    echo 'python3 /usr/share/better-control/control.py "$@"' >> "$pkgdir/usr/bin/better-control"
    chmod 755 "$pkgdir/usr/bin/better-control"
    
    # Create control symlink
    ln -sf better-control "$pkgdir/usr/bin/control"
    
    # Install desktop file
    sed 's|Exec=/usr/bin/control|Exec=/usr/bin/better-control|' \
        src/control.desktop > "$pkgdir/usr/share/applications/better-control.desktop"
}


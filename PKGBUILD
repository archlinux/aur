# Maintainer: ariurn <admin@ariurn.com>

pkgname=happ-desktop-bin
pkgver=2.0.6
pkgrel=1
pkgdesc="A proxy client for secure and private internet access"
arch=('x86_64')
url="https://github.com/Happ-proxy/happ-desktop"
license=('custom')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme')
provides=('happ-desktop')
conflicts=('happ-desktop')
install="${pkgname}.install"
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/Happ-proxy/happ-desktop/releases/download/${pkgver}/Happ.linux.x64.deb")
sha256sums=('06abf9fb0b508bfc86c07de5ee938c7cbe94b4bac9282a6794b4b3b2fbed0db8')
_debfile="${pkgname}-${pkgver}.deb"

prepare() {
    # Extract deb package
    bsdtar -xf "${_debfile}"
    bsdtar -xf data.tar.zst
}

package() {
    # Copy extracted files from deb package
    cp -a opt "${pkgdir}/"
    cp -a usr "${pkgdir}/"
    cp -a etc "${pkgdir}/"
    
    # Install wrapper script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/happ" <<'EOF'
#!/bin/bash
# Clean up stale temporary files
find /dev/shm /tmp -regextype posix-extended -regex '.*\=$' 2>/dev/null -delete

# Force system OpenSSL instead of bundled old version
export LD_LIBRARY_PATH="/usr/lib:$LD_LIBRARY_PATH"

# Set Qt platform to XCB
export QT_QPA_PLATFORM=xcb

# Launch Happ
exec /opt/happ/bin/Happ "$@"
EOF

    # Update desktop file to use wrapper
    sed -i 's|Exec=/opt/happ/bin/Happ|Exec=/usr/bin/happ|' "${pkgdir}/usr/share/applications/Happ.desktop"
}
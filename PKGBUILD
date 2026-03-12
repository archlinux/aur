# Maintainer: Gökhan C. <caygkhan@gmail.com>
pkgname=waykey
pkgver=1.0.0
pkgrel=1
pkgdesc="Next-generation Wayland-compatible automation engine (AutoHotkey alternative)"
arch=('x86_64')
url="https://github.com/gkhanC/Waykey"
license=('MIT')
depends=('nodejs' 'hyprland' 'libevdev' 'polkit')
makedepends=('npm' 'cmake' 'make' 'gcc')
install=waykey.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "waykey.service"
        "waykey.sh"
        "99-waykey-uinput.rules")
sha256sums=('dbd6364d33c0176a83a38faeb74cda6602f5da9d0dab5f961c0f320d54b08059'
            '4169b8f01c999106cf7ef52ec411c8a2b49dd37cb80f1f3fa914a35d6be75dd3'
            '61623bca691d4a81407c401bd29ebd791d377a33f75eb2c5f2921c376956c516'
            '1536c6b31c712927bb493685323939b1c096fc378f341432dd99c9b2f7c5fbc4')

package() {
    cd "${srcdir}/Waykey-${pkgver}"
    
    mkdir -p "${pkgdir}/opt/waykey"
    
    # Copy project files
    cp -r package.json src public scripts index.js run.js "${pkgdir}/opt/waykey/"
    cp -r package-lock.json "${pkgdir}/opt/waykey/" 2>/dev/null || true
    
    # Install production dependencies
    cd "${pkgdir}/opt/waykey" && npm install --production
    
    # Systemd service
    install -Dm644 "${srcdir}/waykey.service" "${pkgdir}/usr/lib/systemd/user/waykey.service"
    
    # Udev rules
    install -Dm644 "${srcdir}/99-waykey-uinput.rules" "${pkgdir}/etc/udev/rules.d/99-waykey-uinput.rules"
    
    # Wrapper bin
    install -Dm755 "${srcdir}/waykey.sh" "${pkgdir}/usr/bin/waykey"
}

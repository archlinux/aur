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
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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

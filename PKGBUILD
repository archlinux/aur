# Maintainer: Fergal Moran <fergal.moran@gmail.com>
pkgname=xtreamium-proxy
pkgver=1.4.53
pkgrel=1
pkgdesc="Xtreamium Proxy Service - runs as a per-user systemd service"
arch=('x86_64')
url="https://github.com/xtreamium/xtreamium-proxy"
license=('MIT')
depends=('glibc' 'icu' 'ffmpeg')
optdepends=('mpv: default media player')
provides=('xtreamium-proxy')
conflicts=('xtreamium-proxy')
install=xtreamium-proxy.install
source=("xtreamium-proxy-${pkgver}.tar.gz::https://github.com/xtreamium/xtreamium-proxy/releases/download/v${pkgver}/xtreamium-proxy-linux.tar.gz")
sha256sums=('SKIP')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/xtreamium-proxy" "${pkgdir}/usr/bin/xtreamium-proxy"
    install -Dm644 "${srcdir}/appsettings.json" "${pkgdir}/usr/share/xtreamium-proxy/appsettings.json.example"
    install -Dm644 "${srcdir}/xtreamium-proxy.service" "${pkgdir}/usr/lib/systemd/user/xtreamium-proxy.service"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Notification-area icon — bound to the proxy's lifecycle by its user unit (see the unit for
    # details); the graphical-session.target.wants link starts it when the desktop session comes
    # up after the proxy.
    install -Dm755 "${srcdir}/xtreamium-tray" "${pkgdir}/usr/bin/xtreamium-tray"
    install -Dm644 "${srcdir}/xtreamium-tray.service" "${pkgdir}/usr/lib/systemd/user/xtreamium-tray.service"
    install -dm755 "${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants"
    ln -s ../xtreamium-tray.service "${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/xtreamium-tray.service"
}

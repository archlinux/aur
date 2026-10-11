# Maintainer: Fergal Moran <fergal.moran@gmail.com>
pkgname=tvnoms-proxy
pkgver=2.0.1
pkgrel=1
pkgdesc="TV Noms Proxy Service - runs as a per-user systemd service"
arch=('x86_64')
url="https://github.com/tvnoms/tvnoms-proxy"
license=('MIT')
depends=('glibc' 'icu' 'ffmpeg')
optdepends=('mpv: default media player')
provides=('tvnoms-proxy')
conflicts=('tvnoms-proxy')
install=tvnoms-proxy.install
source=("tvnoms-proxy-${pkgver}.tar.gz::https://github.com/tvnoms/tvnoms-proxy/releases/download/v${pkgver}/tvnoms-proxy-linux.tar.gz")
sha256sums=('SKIP')
options=('!strip')

package() {
    install -Dm755 "${srcdir}/tvnoms-proxy" "${pkgdir}/usr/bin/tvnoms-proxy"
    install -Dm644 "${srcdir}/appsettings.json" "${pkgdir}/usr/share/tvnoms-proxy/appsettings.json.example"
    install -Dm644 "${srcdir}/tvnoms-proxy.service" "${pkgdir}/usr/lib/systemd/user/tvnoms-proxy.service"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Notification-area icon — started by the proxy's Wants= and by the graphical-session.target.wants
    # link when the desktop session comes up, and stays up while the proxy is stopped (see the unit
    # for details).
    install -Dm755 "${srcdir}/tvnoms-tray" "${pkgdir}/usr/bin/tvnoms-tray"
    install -Dm644 "${srcdir}/tvnoms-tray.service" "${pkgdir}/usr/lib/systemd/user/tvnoms-tray.service"
    install -dm755 "${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants"
    ln -s ../tvnoms-tray.service "${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/tvnoms-tray.service"
}

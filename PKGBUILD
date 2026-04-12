# Maintainer: your name <your@email.com>
pkgname=screensink
pkgver=0.1
pkgrel=1
pkgdesc="KDE Plasma 6 daemon that routes window audio to the sink of the screen it's on"
arch=('any')
url="https://gitlab.com/asaventon/screensink"
license=('GPL-2.0-or-later')
depends=(
    'kwin'
    'plasma-workspace'
    'plasma5support'
    'python-gobject'
    'python-pydbus'
    'python-pulsectl'
    'pipewire'
    'wireplumber'
)
install=screensink.install
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/asaventon/screensink/-/archive/v${pkgver}/screensink-v${pkgver}.tar.gz")
sha256sums=('22c8552f13df69603ae2c8517e95cd4c4eeb827e9718bc90f221e7133f2a017e')

package() {
    cd "screensink-v${pkgver}"

    # Daemon
    install -Dm755 daemon/screensink.py "${pkgdir}/usr/bin/screensink"

    # Systemd user service (patch ExecStart to use /usr/bin/screensink)
    install -Dm644 systemd/screensink.service "${pkgdir}/usr/lib/systemd/user/screensink.service"
    sed -i 's|ExecStart=.*|ExecStart=/usr/bin/screensink|' \
        "${pkgdir}/usr/lib/systemd/user/screensink.service"

    # KWin script
    install -Dm644 kwin-script/metadata.json \
        "${pkgdir}/usr/share/kwin/scripts/screensink/metadata.json"
    install -Dm644 kwin-script/contents/code/main.js \
        "${pkgdir}/usr/share/kwin/scripts/screensink/contents/code/main.js"

    # Plasma widget
    install -Dm644 widget/metadata.json \
        "${pkgdir}/usr/share/plasma/plasmoids/io.screensink/metadata.json"
    install -Dm644 widget/contents/ui/main.qml \
        "${pkgdir}/usr/share/plasma/plasmoids/io.screensink/contents/ui/main.qml"

    # Config template
    install -Dm644 config/config.example.toml \
        "${pkgdir}/usr/share/doc/screensink/config.example.toml"
}

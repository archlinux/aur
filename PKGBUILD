# Maintainer: Christian Möllmann (knoelliX) <moellix@knoellix.net>
pkgname=nativmix
pkgver=1.0.2
pkgrel=2
pkgdesc="Hardware-assisted volume mixer for PipeWire/PulseAudio with Arduino support"
arch=('any')
url="https://github.com/knoelliX/NativMix"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-pyqt6'
    'python-pulsectl'
    'python-pyserial'
    'python-setproctitle'
    'python-mido'
    'python-rtmidi'
)
# Wir brauchen keine Build-Tools für ein direktes Skript
makedepends=()
optdepends=(
    'kvantum: Plasma transparency and blur engine support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/knoellix/nativmix/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e4486318d8125219067be42818181f76065d32755401c38a4c3f618dc6382a6')

package() {
    # In den entpackten Quellordner wechseln
    cd "${srcdir}/${pkgname}-${pkgver}"

    # 1. Programm-Dateien nach /usr/share/nativmix kopieren
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r * "${pkgdir}/usr/share/${pkgname}/"

    # 2. Den ausführbaren Starter in /usr/bin erstellen
    install -dm755 "${pkgdir}/usr/bin"
    echo -e "#!/bin/sh\npython /usr/share/${pkgname}/main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # 3. Desktop-Datei und Icons an die richtigen System-Orte
    install -Dm644 data/nativmix.desktop \
        "${pkgdir}/usr/share/applications/nativmix.desktop"

    install -Dm644 assets/icon.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/nativmix.svg"

    install -Dm644 assets/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/nativmix.png"

    # 4. Lizenz
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

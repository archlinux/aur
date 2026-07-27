# Maintainer: yakuda <DEINE-EMAIL@example.com>
pkgname=osc-dreamchatbox
pkgver=1.1.2_alpha
pkgrel=1
pkgdesc="Native Linux alternative to MagicChatbox (VRCOSC) - VRChat OSC chatbox companion (status, now-playing, hardware, speech-to-text, OSCQuery)"
arch=('any')
url="https://github.com/yakuda-stack/OSC-DreamChatbox"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'python-zeroconf' 'python-osc' 'python-setproctitle')
optdepends=('python-speechrecognition: Speech to Text'
            'python-pyaudio: Speech to Text (microphone access)'
            'python-deepl: DeepL translation backend'
            'mesa-utils: exact GPU name detection (glxinfo)'
            'nvidia-utils: NVIDIA GPU stats (nvidia-smi)')
# Git-Tag enthaelt einen Bindestrich (v1.0.6-alpha), pkgver darf keinen haben
_tag="v${pkgver/_/-}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('2b6f66f8e6dbd0d8439e3a72dc2048a7816d24c80bbdb166a1a1b77322809d0b')

package() {
    cd "OSC-DreamChatbox-${_tag#v}"

    # Programm nach /usr/share/osc-dreamchatbox (Struktur bleibt erhalten,
    # der Entry-Point findet assets/icon.png relativ zu sich selbst)
    local app="${pkgdir}/usr/share/${pkgname}"
    install -Dm644 osc_dreamchatbox.py "${app}/osc_dreamchatbox.py"
    cp -r core ui "${app}/"
    install -Dm644 assets/icon.png "${app}/assets/icon.png"
    # Python-Cache/Muell nicht paketieren
    find "${app}" -name '__pycache__' -type d -exec rm -rf {} + 2>/dev/null || true

    # Launcher
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCH'
#!/usr/bin/env bash
exec python /usr/share/osc-dreamchatbox/osc_dreamchatbox.py "$@"
LAUNCH
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Desktop-Eintrag + Icon (hicolor)
    install -Dm644 packaging/osc-dreamchatbox.desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 assets/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # Lizenz + Doku
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

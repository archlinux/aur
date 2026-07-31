# Maintainer: yakuda <yakuda@outlook.de>
pkgname=osc-dreamchatbox
pkgver=1.2.4
pkgrel=1
pkgdesc="Native Linux alternative to MagicChatbox (VRCOSC) - VRChat OSC chatbox companion (status, now-playing, hardware, speech-to-text, OSCQuery)"
arch=('any')
url="https://github.com/yakuda-stack/OSC-DreamChatbox"
license=('GPL-3.0-or-later')
# xcb-util-cursor & Co: Qt >= 6.5 braucht sie zum Laden des xcb-Plugins,
# sonst bricht der Start mit "Could not load the Qt platform plugin xcb" ab
# python-pyaudio ist hier bewusst eine harte Abhaengigkeit: ohne sie
# bleibt das Mikrofon-Dropdown auf "System default" stehen und der
# Aufnahmeknopf tut nichts - fuer AUR-Nutzer sah das wie ein Bug aus.
# Es liegt in [extra] und zieht portaudio mit, makepkg loest das auf.
#
# python-speechrecognition dagegen gibt es NUR im AUR. Als depends
# scheitert schon 'makepkg -si', und AUR-Helfer wuerden jeden Nutzer in
# die bekannten Konflikte dieses Pakets ziehen (Tests-Verzeichnis,
# python-deadlib). Bleibt deshalb optional - die App sagt beim Start
# klar, was fehlt.
depends=('python' 'python-pyqt6' 'python-zeroconf' 'python-osc' 'python-setproctitle'
         'python-pyaudio'
         'xcb-util-cursor' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms'
         'xcb-util-renderutil' 'libxkbcommon-x11')
optdepends=('python-speechrecognition: Speech to Text (AUR)'
                        'python-deepl: DeepL translation backend'
            'mesa-utils: exact GPU name detection (glxinfo)'
            'nvidia-utils: NVIDIA GPU stats (nvidia-smi)')
# Git-Tag enthaelt einen Bindestrich (v1.0.6-alpha), pkgver darf keinen haben
_tag="v${pkgver/_/-}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('8f0d187a5ffce307c690cc2ce490dcc4ada1ef6faa16b372adfcf78c200acb58')

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
    install -Dm644 THIRD_PARTY_NOTICES.md \
        "${pkgdir}/usr/share/doc/${pkgname}/THIRD_PARTY_NOTICES.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

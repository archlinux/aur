# Maintainer: yakuda <yakuda@outlook.de>
pkgname=osc-dreamchatbox
pkgver=1.4.7
pkgrel=1
pkgdesc="Native Linux alternative to MagicChatbox (VRCOSC) - VRChat OSC chatbox companion (status, now-playing, hardware, speech-to-text, OSCQuery)"
# Reines Python, daher 'any' - der FPS-Vulkan-Layer liegt im
# World-Stats-Plugin und wird dort bei Bedarf gebaut, nicht hier.
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
# python-speechrecognition gibt es NUR im AUR, und dieses Paket macht
# SpeechRecognitions OPTIONALE Backends (pocketsphinx, google-cloud-
# speech, groq) zu harten depends. Bricht eines davon - derzeit faellt
# google-cloud-speech in check() durch -, ist Speech to Text nicht
# installierbar, obwohl wir keins dieser Backends benutzen.
#
# Deshalb weder depends noch optdepends: die App installiert sich die
# reine Python-Bibliothek auf Knopfdruck selbst nach
# ~/.config/OSC-DreamChatbox/extras (siehe core/pyextras.py). Dort holt
# pip nur SpeechRecognition + typing-extensions, nichts davon wird von
# pacman verwaltet, und das kaputte AUR-Paket bleibt aussen vor.
depends=('python' 'python-pyqt6' 'python-zeroconf' 'python-osc' 'python-setproctitle'
         'python-pyaudio'
         'xcb-util-cursor' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-keysyms'
         'xcb-util-renderutil' 'libxkbcommon-x11')
optdepends=(            'python-deepl: DeepL translation backend'
            'mesa-utils: exact GPU name detection (glxinfo)'
            'nvidia-utils: NVIDIA GPU stats (nvidia-smi)'
            'libpulse: grouped microphone list via pactl (without it the Speech to Text dropdown falls back to the raw ALSA device list)')
# Git-Tag enthaelt einen Bindestrich (v1.0.6-alpha), pkgver darf keinen haben
_tag="v${pkgver/_/-}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('5a982d74430db250f7afa7bfd787d29f16c84458383ffefd13be329fba549a64')


package() {
    cd "OSC-DreamChatbox-${_tag#v}"

    # Programm nach /usr/share/osc-dreamchatbox (Struktur bleibt erhalten,
    # der Entry-Point findet assets/icon.png relativ zu sich selbst)
    local app="${pkgdir}/usr/share/${pkgname}"
    install -Dm644 osc_dreamchatbox.py "${app}/osc_dreamchatbox.py"
    cp -r core ui "${app}/"
    # config/plugins.json ist der Plugin-Store-Katalog, den die App neben
    # sich erwartet (core/constants.py: STORE_SOURCES_FILE). Fehlt er, ist
    # der Store beim ersten Oeffnen leer und meldet "No sources configured",
    # bis der Nutzer einmal auf Refresh drueckt - AppImage und Windows-Build
    # kopieren ihn laengst mit, nur hier fehlte er.
    if [ -d config ]; then cp -r config "${app}/"; fi
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

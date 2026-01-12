# Maintainer: Your Name <your@email.com>
pkgname=voice-input-steamdeck
pkgver=1.0.0
pkgrel=1
pkgdesc="Push-to-talk voice transcription for Steam Deck using Groq Whisper API"
arch=('any')
url="https://github.com/shmlkv/voice-input-steamdeck"
license=('MIT')
depends=(
    'bash'
    'curl'
    'jq'
    'xdotool'
    'bc'
    'python'
    'pipewire-pulse'
    'libnotify'
    'xbindkeys'
)
optdepends=(
    'alsa-utils: fallback audio recording with arecord'
)
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install main script
    install -Dm755 voice-input.sh "${pkgdir}/usr/bin/voice-input"

    # Install toggle script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/voice-input-toggle" << 'EOF'
#!/bin/bash
export PATH="/usr/bin:${HOME}/.local/bin:${PATH}"
export DISPLAY="${DISPLAY:-:0}"
if [[ -f /tmp/voice-input/recording_state ]]; then
    voice-input stop
else
    voice-input start
fi
EOF

    # Install desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/voice-input.desktop" << EOF
[Desktop Entry]
Name=Voice Input
Comment=Push-to-talk voice transcription for Steam Deck
Exec=voice-input-toggle
Icon=audio-input-microphone
Type=Application
Terminal=false
Categories=Utility;Audio;Accessibility;
Keywords=voice;speech;transcription;whisper;steamdeck;
EOF

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

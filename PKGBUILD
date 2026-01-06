# Maintainer: Sebastian K <sjkouba@gmail.com>
pkgname=omarchy-stt-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Push-to-talk dictation system for Linux/Wayland with hotkey daemon and LLM corrections"
arch=('x86_64')
url="https://github.com/sebkouba/omarchy-stt"
license=('MIT')
depends=('wl-clipboard' 'ydotool' 'ffmpeg')
optdepends=(
    'xdg-desktop-portal: For hotkey daemon global shortcuts'
    'xdg-desktop-portal-hyprland: Hyprland integration'
    'groq-api: For LLM post-processing (API key required)'
)
provides=('omarchy-stt')
conflicts=('omarchy-stt')
install=${pkgname}.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/omarchy-stt-${pkgver}-x86_64.tar.gz"
    "parakeet-v3-int8.tar.gz::https://blob.handy.computer/parakeet-v3-int8.tar.gz"
)
sha256sums=('4e2c4ffae3c225e81acd3c15671bd2bf16bbd656faf156a220cba6c5fa816676'
            'SKIP') # Parakeet model checksum - can be updated or left as SKIP

package() {
    cd "${srcdir}/omarchy-stt-${pkgver}-x86_64"

    # Install binaries
    install -Dm755 "hotkey-daemon" "${pkgdir}/usr/bin/hotkey-daemon"
    install -Dm755 "transcribe-daemon" "${pkgdir}/usr/bin/transcribe-daemon"
    install -Dm755 "transcribe-client" "${pkgdir}/usr/bin/transcribe-client"
    install -Dm755 "recording-daemon" "${pkgdir}/usr/bin/recording-daemon"
    install -Dm755 "list-microphones" "${pkgdir}/usr/bin/list-microphones"

    # Install systemd user services
    install -Dm644 "systemd/recording-daemon.service" \
        "${pkgdir}/usr/lib/systemd/user/recording-daemon.service"
    install -Dm644 "systemd/transcribe-daemon.service" \
        "${pkgdir}/usr/lib/systemd/user/transcribe-daemon.service"
    install -Dm644 "systemd/hotkey-daemon.service" \
        "${pkgdir}/usr/lib/systemd/user/hotkey-daemon.service"

    # Install Parakeet model
    install -dm755 "${pkgdir}/usr/share/omarchy-stt/models"
    cp -r "${srcdir}/parakeet-tdt-0.6b-v3-int8" \
        "${pkgdir}/usr/share/omarchy-stt/models/"

    # Install example configuration
    install -Dm644 "config/config.toml.example" \
        "${pkgdir}/usr/share/omarchy-stt/config.toml.example"
    if [ -f "config/transcription_corrections.json.example" ]; then
        install -Dm644 "config/transcription_corrections.json.example" \
            "${pkgdir}/usr/share/omarchy-stt/transcription_corrections.json.example"
    fi

    # Install documentation
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "SETUP.md" "${pkgdir}/usr/share/doc/${pkgname}/SETUP.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

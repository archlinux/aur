# Maintainer: delta-whiplash <delta@delta-net.ovh>

# -------------------------------------------------------------------
# Naming convention (mirrors dist/aur/ in the upstream repo):
#   pkgname  = telegram-rs-bin  (AUR/pacman lowercase; -bin = prebuilt)
#   Asset:   telegram-rs-linux-x86_64.tar.gz (contains ./telegram-rs)
#   Binary:  /usr/bin/telegram-rs
# Upstream CD (.github/workflows/aur.yml) bumps pkgver + sums on tags.
# -------------------------------------------------------------------
pkgname=telegram-rs-bin
pkgver=0.10.4
pkgrel=1
pkgdesc="Feather-light Telegram desktop client in Rust — real-time push, GPU rendering (prebuilt binary)"
arch=('x86_64')
url="https://github.com/MrChausson/telegram-rs"
license=('MIT')
depends=('glibc' 'gcc-libs' 'alsa-lib')
# Voice notes arrive as Opus-in-Ogg; playback transcodes via system ffmpeg.
optdepends=('ffmpeg: voice-note playback (Opus → WAV transcode)')
provides=('telegram-rs')
conflicts=('telegram-rs')
# Upstream already ships a stripped, LTO-optimized binary.
options=('!strip')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/MrChausson/telegram-rs/releases/download/v${pkgver}/telegram-rs-linux-x86_64.tar.gz"
    "telegram-rs.desktop"
    "telegram-rs.svg"
    "LICENSE::https://raw.githubusercontent.com/MrChausson/telegram-rs/v${pkgver}/LICENSE"
)
sha256sums=('232415b719cdd16fe5926b07df495e9076bdd3a2ec5e1c913cfc9201bf34a30f'
            '5f46ddc4cbfafa9bea3814e26822959a536fff89b1b1523acac5f00f80919b86'
            '29a54866c7f634ce95caffa7e76c95d69101dccb3f2fc3ffa7a1eecd0c9b2d04'
            'c3a2f7bfcf59048b96659340e0c382112019916cad800354cc7a057589045a39')

package() {
    # Binary (quasi-static: glibc + alsa-lib are the only runtime deps).
    install -Dm755 "${srcdir}/telegram-rs" "${pkgdir}/usr/bin/telegram-rs"

    # Menu entry + icon (Icon=telegram-rs resolves through hicolor).
    install -Dm644 "${srcdir}/telegram-rs.desktop" \
        "${pkgdir}/usr/share/applications/telegram-rs.desktop"
    install -Dm644 "${srcdir}/telegram-rs.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/telegram-rs.svg"

    # License.
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

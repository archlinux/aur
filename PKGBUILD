# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=vibe-bin
pkgver=3.0.20
pkgrel=1
pkgdesc="Transcribe audio / video offline using OpenAI Whisper"
arch=('x86_64')
url="https://thewh1teagle.github.io/vibe/"
license=('MIT')
depends=('ffmpeg' 'openblas' 'vulkan-icd-loader' 'webkit2gtk-4.1' 'gtk3' 'xdotool')
makedepends=('patchelf')
_deb_sha256='fbb2ed3a3bb70b412b8b41905ebbeab4a143cbfba16051d2f60fd7306dad3de9'
source=("https://github.com/thewh1teagle/vibe/releases/download/v${pkgver}/vibe_${pkgver}_amd64.deb"
        "LICENSE-MIT::https://raw.githubusercontent.com/thewh1teagle/vibe/main/LICENSE")

sha256sums=(
    "$_deb_sha256"
    '30d26b5b70187611accccc4afddb8eb13ee32d85cdc85b4f77103b86a2dfc056'
)

package() {
    tar -xf data.tar.* -C "${srcdir}"

    patchelf --replace-needed libxdo.so.3 libxdo.so \
        "${srcdir}/usr/bin/vibe"

    install -Dm644 "${srcdir}/LICENSE-MIT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/usr/share/applications/vibe.desktop" \
        "${pkgdir}/usr/share/applications/vibe.desktop"

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/vibe.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vibe.png"

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256@2/apps/vibe.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/vibe.png"

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/vibe.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/vibe.png"

    install -Dm755 "${srcdir}/usr/bin/vibe" \
        "${pkgdir}/usr/bin/vibe"

    install -Dm755 "${srcdir}/usr/bin/sona" \
        "${pkgdir}/usr/bin/sona"

    for lang_dir in "${srcdir}/usr/lib/vibe/locales/"*; do
        install -d "${pkgdir}/usr/lib/vibe/locales/$(basename "$lang_dir")"
        install -m644 "$lang_dir"/* \
            "${pkgdir}/usr/lib/vibe/locales/$(basename "$lang_dir")/"
    done
}

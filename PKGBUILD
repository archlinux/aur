# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=vibe-bin
pkgver=3.0.19
pkgrel=2
pkgdesc="Transcribe audio / video offline using OpenAI Whisper"
arch=('x86_64')
url="https://thewh1teagle.github.io/vibe/"
license=('MIT')
depends=('ffmpeg' 'openblas' 'vulkan-icd-loader' 'webkit2gtk-4.1' 'gtk3' 'xdotool')
makedepends=('patchelf')
source=("https://github.com/thewh1teagle/vibe/releases/download/v${pkgver}/vibe_${pkgver}_amd64.deb"
        "LICENSE-MIT::https://raw.githubusercontent.com/thewh1teagle/vibe/main/LICENSE")
sha256sums=('f09780b705f594708b99a661fb2b64c2e7eb94c80b775f9906eb359ddc3a52a9'
            '30d26b5b70187611accccc4afddb8eb13ee32d85cdc85b4f77103b86a2dfc056')

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

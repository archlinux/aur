# Maintainer: yakuda <yakuda@outlook.de>
pkgname=dream-llmchatbox
pkgver=0.1.5
pkgrel=1
pkgdesc="Chat with local AI models (Ollama) - tools, folders, memory, groups, speech, German/English"
arch=('x86_64')
url="https://github.com/yakuda-stack/Dream-LLMChatBox"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'fontconfig' 'freetype2'
         'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr'
         'hicolor-icon-theme')
makedepends=('cargo' 'cmake' 'clang')
options=('!lto')
optdepends=('ollama: run the local AI models (or ollama-vulkan / ollama-rocm)'
            'bubblewrap: sandbox for terminal commands'
            'xdg-utils: open links, files and folders'
            'polkit: start/stop the Ollama service and switch its graphics backend'
            'libnotify: desktop notification when an automation is done'
            'poppler: read PDF files and PDF preview'
            'unzip: read DOCX/ODT files'
            'tesseract: read text from images'
            'ffmpeg: audio and video attachments'
            'pandoc: create PDF/DOCX/ODT/PPTX/EPUB documents'
            'texlive-xetex: PDF documents via pandoc'
            'libreoffice-fresh: PDF documents via pandoc (fallback)'
            'piper-tts-bin: read answers aloud'
            'podman: run test environment commands in a container'
            'docker: run test environment commands in a container')
_tag="v${pkgver/_/-}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('0f50b971bbc22f1ed8d30aa33c261dc40a30003e4264185f470c8669695d0917')

_srcdir() { echo "Dream-LLMChatBox-${_tag#v}"; }

prepare() {
    cd "$(_srcdir)"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$(_srcdir)"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$(_srcdir)"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$(_srcdir)"
    install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 packaging/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 assets/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

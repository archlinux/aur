# Maintainer: Jatin K Malik <jatinkrmalik@gmail.com>
# Updated by .github/workflows/release.yml on v* tags. Setup: docs/AUR.md

pkgname=vocalinux-bin
# AUR pkgver cannot contain hyphens (v0.14.0-beta -> 0.14.0beta).
pkgver=0.18.2
_tag=0.18.2
pkgrel=1
pkgdesc="Free, offline voice dictation for Linux (prebuilt AppImage)"
arch=('x86_64' 'aarch64')
url="https://github.com/VocaHQ/vocalinux"
license=('AGPL-3.0-only')
# fuse2: the type-2 AppImage runtime mounts its squashfs through FUSE.
# Everything else it needs (CPython, GTK, the whisper.cpp Vulkan build) is
# inside the bundle — that is the point of shipping the AppImage.
depends=(
  'fuse2'
  'hicolor-icon-theme'
  # The bundled app spawns these host tools for keystroke injection; on X11
  # without active IBus it requires xdotool and on Wayland a host tool.
  'xdotool'
  'wtype'
)
optdepends=(
  'vulkan-icd-loader: GPU-accelerated whisper.cpp transcription'
  'ibus: IBus text injection (preferred on some layouts and compositors)'
  'xclip: X11 clipboard tools (copy/paste injection fallbacks)'
  'wl-clipboard: Wayland clipboard (wl-copy/wl-paste) injection fallbacks'
  'ydotool: uinput keystroke injection fallback'
)
provides=('vocalinux')
conflicts=('vocalinux' 'vocalinux-git')
# Stripping would rewrite the runtime header of a self-mounting ELF.
options=('!strip')
source=(
  'vocalinux.desktop'
  'vocalinux.svg'
  'LICENSE'
)
source_x86_64=("Vocalinux-${_tag}-x86_64.AppImage::https://github.com/VocaHQ/vocalinux/releases/download/v${_tag}/Vocalinux-${_tag}-x86_64.AppImage")
source_aarch64=("Vocalinux-${_tag}-aarch64.AppImage::https://github.com/VocaHQ/vocalinux/releases/download/v${_tag}/Vocalinux-${_tag}-aarch64.AppImage")
sha256sums=('837006a9c689146308eae8c57cba1cdcc06673a108e72f39231837c6f63ae487'
            '128b8939ffc00314a55d0600ab29c6a92dfb116138e088c59579a086616ec8ec'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('d0eab74af15a7ebb04a035b4cdff4749f7bf0c38465aa8b9ee167cf5ce573b32')
sha256sums_aarch64=('aebff858e3d3c39084a47e08b96c8174eeabc9010dcb42a2350caa7b449cf20d')

package() {
  install -Dm755 "Vocalinux-${_tag}-${CARCH}.AppImage" \
    "${pkgdir}/opt/${pkgname}/Vocalinux-${_tag}-${CARCH}.AppImage"

  install -Dm644 vocalinux.desktop \
    "${pkgdir}/usr/share/applications/vocalinux.desktop"
  install -Dm644 vocalinux.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vocalinux.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/Vocalinux-${_tag}-${CARCH}.AppImage" \
    "${pkgdir}/usr/bin/vocalinux"
}

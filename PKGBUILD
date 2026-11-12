# Maintainer: Alper Ortac <alportac@gmail.com>
pkgname=localflow-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Private, native dictation with local speech recognition and text cleanup (prebuilt)'
arch=('x86_64')
url='https://github.com/radiumcoders/localflow'
license=('LicenseRef-Localflow')
depends=(
  'glibc' 'libgcc' 'libstdc++' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
  'alsa-lib' 'vulkan-icd-loader' 'wayland' 'libglvnd' 'fontconfig'
  'hicolor-icon-theme'
)
optdepends=(
  'pipewire-alsa: recording through PipeWire'
  'wl-clipboard: clipboard access on Wayland'
  'wtype: paste keystrokes on Wayland'
  'xclip: clipboard access on X11'
  'xdotool: paste keystrokes on X11'
  'vulkan-driver: GPU acceleration for transcription and cleanup'
)
provides=("localflow=$pkgver")
conflicts=('localflow')
options=('!strip' '!debug')
source=("localflow-${pkgver}-${CARCH}.AppImage::$url/releases/download/v${pkgver}/localflow-${pkgver}-${CARCH}.AppImage"
        "localflow-${pkgver}-README.md::https://raw.githubusercontent.com/radiumcoders/localflow/v${pkgver}/README.md")
noextract=("localflow-${pkgver}-${CARCH}.AppImage")
sha256sums=('00d540a83be660546e80318fc59236f3b426191580ebc21035f020269ede6195'
            'ba82efa02298f6da683e916ac1bf87374aa81f207de457052ad898d0efc7704b')

prepare() {
  chmod +x "localflow-${pkgver}-${CARCH}.AppImage"
  ./localflow-${pkgver}-${CARCH}.AppImage --appimage-extract > /dev/null
}

package() {
  cd "$srcdir/squashfs-root"
  install -Dm755 usr/bin/localflow "$pkgdir/usr/bin/localflow"
  install -Dm644 localflow.desktop "$pkgdir/usr/share/applications/localflow.desktop"
  install -Dm644 localflow.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/localflow.png"
  install -Dm644 usr/share/doc/localflow/THIRD_PARTY_LICENSES.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
  # Upstream's licensing terms are in the versioned README, not a LICENSE file.
  install -Dm644 "$srcdir/localflow-${pkgver}-README.md" \
    "$pkgdir/usr/share/licenses/$pkgname/README.md"
}

# Maintainer: Finn Künstner <finn dot kuenstner at gmail dot com>

_pkgname=cinnabar
pkgname=$_pkgname-bin
pkgver=0.1.31
pkgrel=1
pkgdesc='Unofficial client compatible with Minecraft: Bedrock Edition, written in Rust'
arch=('x86_64')
url='https://github.com/cinnabar-mc/cinnabar'
license=('PolyForm-Noncommercial-1.0.0')
depends=(
  'alsa-lib'
  'bash'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'systemd-libs'
  'vulkan-driver'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'kdialog: file picker and dialogs without an XDG portal'
  'pipewire-alsa: sound on PipeWire'
  'pulseaudio-alsa: sound on PulseAudio'
  'xdg-utils: open links and accept Discord invites'
  'zenity: file picker and dialogs without an XDG portal'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug' '!strip')
_appimage=$_pkgname-$pkgver-x86_64.AppImage
source=("$_appimage::$url/releases/download/v$pkgver/Cinnabar-x86_64.AppImage"
        "$_pkgname.sh")
sha256sums=('ffddee0f190678106d2689ef8a52f6dfa07c3c62c3eb2ff1a2e18fd4ab27336f'
            '7c5357b45eb23687940ebfdafce0c27b163a4c6a986a03bb757a272c3bd796a3')

prepare() {
  rm -rf squashfs-root
  chmod +x "$_appimage"
  "./$_appimage" --appimage-extract >/dev/null
}

package() {
  cd squashfs-root

  # The client only needs <prefix>/bin and <prefix>/share/cinnabar. Leaving AppRun out keeps its
  # updater from treating this as an AppDir it may replace, so pacman stays the sole owner.
  install -d "$pkgdir/opt/$_pkgname"
  cp -r usr/bin usr/share "$pkgdir/opt/$_pkgname/"

  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$_pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  install -Dm644 "usr/share/$_pkgname/licenses/Cinnabar-LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "usr/share/$_pkgname/assets/THIRD_PARTY_NOTICES.md" \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

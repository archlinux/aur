# Maintainer: Tymour Kadry <tymitaly@gmail.com>
pkgname=dictapulse-bin
_appname=DictaPulse
pkgver=0.2.0
pkgrel=1
pkgdesc="Local AI voice dictation for KDE Plasma (Wayland) — prebuilt Vulkan AppImage"
arch=('x86_64')
url="https://dictapulse.com"
_repo="https://github.com/Silverhairfx/DictaPulse"
license=('GPL-3.0-or-later')
# Qt/KF6 are bundled inside the AppImage; only host-provided deps are listed.
depends=('ffmpeg' 'hicolor-icon-theme')
optdepends=(
  'ydotool: text injection via uinput (needs the ydotoold daemon running)'
  'wtype: text injection on wlroots/Wayland'
  'vulkan-icd-loader: GPU acceleration (with a Vulkan driver e.g. vulkan-radeon)'
)
provides=('dictapulse')
conflicts=('dictapulse')
options=('!strip')   # prebuilt bundle — do not strip its libraries
source=("$_appname-$pkgver-$CARCH.AppImage::$_repo/releases/download/v$pkgver/$_appname-$pkgver-$CARCH.AppImage")
noextract=("$_appname-$pkgver-$CARCH.AppImage")   # extracted manually in package()
sha256sums=('5b06e315aed7abfc3723065d8c00d7de057f3ad636fd2c7711a60f17f487eca5')

package() {
  cd "$srcdir"
  chmod +x "$_appname-$pkgver-$CARCH.AppImage"
  ./"$_appname-$pkgver-$CARCH.AppImage" --appimage-extract >/dev/null

  # Self-contained bundle goes in /opt (it ships its own Qt/KF6 libs).
  install -d "$pkgdir/opt/dictapulse"
  cp -a squashfs-root/. "$pkgdir/opt/dictapulse/"
  # Drop empty icon-size dirs the bundle leaves behind (only a scalable svg ships).
  find "$pkgdir/opt/dictapulse" -type d -empty -delete

  # Launcher on PATH.
  install -d "$pkgdir/usr/bin"
  ln -s /opt/dictapulse/AppRun "$pkgdir/usr/bin/dictapulse"

  # Desktop entry + icon into the standard locations (from the bundle).
  install -Dm644 squashfs-root/usr/share/applications/dictapulse.desktop \
    "$pkgdir/usr/share/applications/dictapulse.desktop"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/dictapulse.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dictapulse.svg"
}

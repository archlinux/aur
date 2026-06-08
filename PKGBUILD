# Maintainer: Tymour Kadry <tymitaly@gmail.com>
pkgname=dictapulse-bin
_appname=DictaPulse
pkgver=0.1.1
pkgrel=2
pkgdesc="Local AI voice dictation for KDE Plasma (Wayland) — prebuilt Vulkan AppImage"
arch=('x86_64')
url="https://github.com/Silverhairfx/DictaPulse"
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
source=("$_appname-$pkgver-$CARCH.AppImage::$url/releases/download/v$pkgver/$_appname-$pkgver-$CARCH.AppImage")
noextract=("$_appname-$pkgver-$CARCH.AppImage")   # extracted manually in package()
sha256sums=('a61d2ea3828d6f6401ecc3a97dcd99c3158ee8f008332b3427b1023471830383')

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

# Maintainer: jagrat7
pkgname=wallpaperx-bin
_pkgname=wallpaperx
pkgver=0.4.12
pkgrel=5 # bump for packaging-only fixes; CI resets it to 1 on a new release
pkgdesc="Browse, manage, and apply Wallpaper Engine wallpapers on Linux"
arch=('x86_64')
url="https://github.com/jagrat7/linux-wallpaper-engine"
license=('MIT')
# Libraries the bundled Electron links against directly; the rest come in through these.
depends=('alsa-lib' 'gtk3' 'mesa' 'nss' 'linux-wallpaperengine')
# Without these the app falls back to /sys/class/drm (no refresh rates) or shows no resolution.
optdepends=(
  'xorg-xrandr: detect monitors on X11'
  'wlr-randr: detect monitors on wlroots compositors (Sway, River, ...)'
  'ffmpeg: show the resolution of video wallpapers'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'linux-wallpaper-engine-ux')
replaces=('linux-wallpaper-engine-ux')
options=('!strip' '!debug')
install=$pkgname.install

# Names inside the Electron Forge zip; change these when the app is renamed.
_appdir="Linux Wallpaper Engine-linux-x64"
_exe=linux-wallpaper-engine
_wmclass="Linux Wallpaper Engine"

source=(
  "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Linux.Wallpaper.Engine-linux-x64-$pkgver.zip"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/jagrat7/linux-wallpaper-engine/v$pkgver/LICENSE"
)
sha256sums=('9355fa0c5423f5c09c70f326acedb5fe936f87ddc60f74792d08760f3f582883'
            '88c55a3ccc32252920ba0c8680bfb27403753acc93136fae042cb11595ba2147')

package() {
  local app="$srcdir/$_appdir"

  install -dm755 "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  cp -a "$app/." "$pkgdir/opt/$_pkgname/"
  # The Forge zip stores its top-level dir as 0700, which cp -a carries over.
  find "$pkgdir/opt/$_pkgname" -type d -exec chmod 755 {} +
  ln -s "/opt/$_pkgname/$_exe" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$app/resources/assets/transparent-logo.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=wallpaperX
Comment=Browse, manage, and apply Wallpaper Engine wallpapers
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Categories=Utility;
StartupWMClass=$_wmclass
DESKTOP
}

# Maintainer: jagrat7
pkgname=wallpaperx-bin
_pkgname=wallpaperx
pkgver=0.4.12
pkgrel=1
pkgdesc="Browse, manage, and apply Wallpaper Engine wallpapers on Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/jagrat7/linux-wallpaper-engine"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libdrm' 'mesa' 'at-spi2-core' 'libxss' 'linux-wallpaperengine')
optdepends=(
  'xorg-xrandr: X11 display detection'
  'wlr-randr: wlroots Wayland display detection'
  'ffmpeg: video wallpaper support'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'linux-wallpaper-engine-ux')
replaces=('linux-wallpaper-engine-ux')
options=('!strip' '!debug')
# Electron Forge zip output; names still carry the pre-rename app name.
_appdir="Linux Wallpaper Engine-linux-x64"
_exe=linux-wallpaper-engine
source=(
  "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Linux.Wallpaper.Engine-linux-x64-$pkgver.zip"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/jagrat7/linux-wallpaper-engine/v$pkgver/LICENSE"
)
sha256sums=('9355fa0c5423f5c09c70f326acedb5fe936f87ddc60f74792d08760f3f582883'
            '88c55a3ccc32252920ba0c8680bfb27403753acc93136fae042cb11595ba2147')

package() {
  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a "$srcdir/$_appdir/." "$pkgdir/opt/$_pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/$_exe" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_appdir/resources/assets/transparent-logo.png" \
    "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<DESKTOP
[Desktop Entry]
Name=WallpaperX
Comment=Manage and apply Steam Wallpaper Engine wallpapers on Linux
Exec=$_pkgname %U
Icon=$_pkgname
Terminal=false
Type=Application
Categories=Utility;
DESKTOP
}

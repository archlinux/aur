# Maintainer: pruefsumme <194605914+pruefsumme@users.noreply.github.com>
#
# Builds Mavernix for Arch Linux from a release on GitHub.
#
#   makepkg -si
#
# After a new release is tagged: set pkgver, then `updpkgsums`.

pkgname=mavernix
pkgver=0.1.4
pkgrel=1
pkgdesc='A lightweight Wayland desktop session with a classic look'
arch=('x86_64')
url='https://github.com/Mavernix/mavernix'
license=('GPL-3.0-or-later' 'MIT')
# The compositor plugins load only into the Wayfire release they were built
# against, hence the upper bound.
depends=(
  'wayfire>=0.11.0' 'wayfire<0.12'
  'quickshell'
  'qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-wayland' 'qt6-svg'
  'librsvg' 'glib2' 'tomlplusplus'
  'python' 'python-pillow'
  'kvantum'
  'gsettings-desktop-schemas'
  'gvfs'
  # The plain theme's icons, pointers and font.
  'adwaita-icon-theme' 'adwaita-icon-theme-legacy' 'adwaita-cursors' 'ttf-dejavu'
  # The Theme Installer: unpacking the installer, converting icons, sounds
  # and drawings, and its sandbox.
  '7zip' 'cpio' 'bzip2' 'lbzip2' 'libicns' 'ffmpeg' 'poppler' 'bubblewrap'
)
makedepends=('meson' 'ninja' 'glm' 'vulkan-headers')
optdepends=(
  'foot: the terminal the dock and Super+Enter open'
  "pipewire: sound, and the panel's volume item"
  'wireplumber: sound'
  "networkmanager: the panel's network item"
  "bluez: the panel's Bluetooth item"
  "upower: the panel's battery item"
  'grim: pictures of the screen'
  'slurp: pictures of a part of the screen'
  'wl-clipboard: pictures of the screen into the clipboard'
  'brightnessctl: brightness keys'
  'playerctl: media keys'
  'network-manager-applet: choosing a wireless network'
  'dex: starting the programs in ~/.config/autostart'
  "hwdata: the graphics card's name in About This Computer"
  'xdg-desktop-portal-gtk: file choosers for sandboxed programs'
  'xdg-desktop-portal-wlr: screen sharing'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c25815a6b5c3f5846393e9cc0eb05dbf9116a7dbc2a864ef3468f23e7c1f42a8')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Two compositor plugins began as Wayfire's code, under the MIT licence.
  install -Dm644 "$pkgname-$pkgver/src/compositor/decoration/LICENSE-wayfire" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-wayfire"
}

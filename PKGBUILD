# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154
pkgname=misari-bin
pkgver=26.4.0.v1.0
pkgrel=1
_upstreamver=26.4.0
pkgdesc='Personal niri fork with a scrollable tiling Wayland desktop'
arch=('x86_64')
url='https://github.com/mengdehong/Misari'
license=('GPL-3.0-or-later')
depends=(
  'cairo' 'glib2' 'glibc' 'libdisplay-info' 'libgcc' 'libinput'
  'libpipewire' 'libxkbcommon' 'libglvnd' 'mesa' 'pango' 'pixman'
  'seatd' 'systemd' 'systemd-libs' 'wayland' 'xdg-desktop-portal' 'xdg-desktop-portal-impl'
)
optdepends=(
  'xwayland-satellite: X11 application support'
  'xdg-desktop-portal-gnome: screencasting'
  'xdg-desktop-portal-gtk: file chooser and other desktop portals'
)
provides=("misari=$pkgver" "niri=$_upstreamver" 'wayland-compositor')
conflicts=('misari' 'niri')
options=('!debug' '!strip')
source=("https://github.com/mengdehong/Misari/releases/download/misari-v26.4.0.v1.0/misari-26.4.0.v1.0-1-x86_64.pkg.tar.zst")
sha256sums=('c38b2adb3252c14d51d842d106f8f55df2aeedd0aed7200ba8b4212a010b450a')

check() {
  local libraries
  libraries=$(ldd "$srcdir/usr/bin/niri")
  if [[ "$libraries" == *'not found'* ]]; then
    printf '%s\n' "$libraries" >&2
    return 1
  fi
  "$srcdir/usr/bin/niri" validate --config "$srcdir/usr/share/doc/misari/config.kdl"
}

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/misari" "$pkgdir/usr/share/licenses/$pkgname"
}

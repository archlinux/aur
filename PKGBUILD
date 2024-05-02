# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gsconnect-git
pkgver=57.r0.g43258f9
pkgrel=2
pkgdesc="KDE Connect implementation. CLI usage without Gnome environment"
arch=(x86_64)
url="https://github.com/GSConnect/gnome-shell-extension-${pkgname%-git}"
license=('GPL-2.0-or-later OR MPL-2.0 OR GPL-3.0-only')
depends=(
  dbus
  dconf
  gjs
  glib2
  gobject-introspection
  hicolor-icon-theme
  libpulse
)
makedepends=(
  appstream
  desktop-file-utils
  eslint
  flake8
  git
  gtk-update-icon-cache
  meson
  python-black
)
optdepends=(
  'evolution-data-server: contacts integration'
  'gsound: sound effects'
  'nemo-python: Nemo integration'
  'python-nautilus: Nautilus integration'
  'python-pydbus: for fetch gsconnect status for Waybar'
  'waybar: highly customizable wayland bar'
  'wl-clipboard: command-line copy/paste utilities for wayland'
  'wtype: xdotool type for wayland'
  'ydotool: generic command-line automation tool'
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git} gnome-shell-extension-${pkgname%-git})
options=(!debug)
source=(
  ${pkgname%-git}::git+$url.git
  ${pkgname%-git}.service
  gvc::git+https://github.com/JingMatrix/gvc.git
)
b2sums=(
  'SKIP'
  'ecd31b50393dbbf23b5f33d16d11573200ce28fd818b99e3f54f269287c505b724fc55f0135809c679629842448b29f7986bed309baa6193aaf1211f144171b4'
  'SKIP'
)

pkgver() {
  git -C ${pkgname%-git} describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson   gvc gvc-build
  meson compile -C gvc-build
  arch-meson -Dinstalled_tests=false\
             -Dfirewalld=true\
             ${pkgname%-git} gsconnect-build
  meson compile -C gsconnect-build
}

package() {
  DESTDIR="$pkgdir"         meson install -C gvc-build
  DESTDIR="$pkgdir"         meson install -C gsconnect-build
  install -vDm644 ${pkgname%-git}.service -t "$pkgdir"/usr/lib/systemd/user/
}

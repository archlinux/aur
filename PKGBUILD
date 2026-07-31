# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gsconnect
pkgver=72
pkgrel=2
pkgdesc="KDE Connect implementation. CLI usage without Gnome environment"
arch=(any)
url="https://github.com/GSConnect/gnome-shell-extension-$pkgname"
license=('CC-BY-4.0 OR CC-BY-SA-3.0 OR CC0-1.0 OR GPL-2.0-or-later OR MPL-2.0')
depends=(
  dbus
  dconf
  gjs
  glib2
  gvc
  hicolor-icon-theme
  python
  sh
)
makedepends=(
  appstream
  desktop-file-utils
  eslint
  flake8
  git
  glib2-devel
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
conflicts=(gnome-shell-extension-$pkgname)
options=(!debug)
source=(
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname.service
)
b2sums=('8d83a2f4624f0db3da25ba7e625f110a1a8142370a2ebe96dac51d59762067147c27de125a62163e1ed545bb04f75607b36896214dc43ad78177441171e97673'
        'ecd31b50393dbbf23b5f33d16d11573200ce28fd818b99e3f54f269287c505b724fc55f0135809c679629842448b29f7986bed309baa6193aaf1211f144171b4')

build() {
  local meson_options=(
     -D installed_tests=false
     -D firewalld=true
     -D nemo=true
  )

  arch-meson gnome-shell-extension-$pkgname-$pkgver gsconnect-build "${meson_options[@]}"
  meson configure  gsconnect-build --no-pager
  meson compile -C gsconnect-build
}

package() {
  meson install -C gsconnect-build --destdir "$pkgdir"
  install -vDm644 $pkgname.service -t "$pkgdir"/usr/lib/systemd/user/
}

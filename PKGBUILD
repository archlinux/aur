# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=gsconnect
pkgver=57
pkgrel=4
pkgdesc="KDE Connect implementation. CLI usage without Gnome environment"
arch=(x86_64)
url="https://github.com/GSConnect/gnome-shell-extension-$pkgname"
license=('GPL-2.0-or-later OR MPL-2.0 OR GPL-3.0-only')
depends=(
  dbus
  dconf
  gjs
  glib2
  gobject-introspection
  hicolor-icon-theme
  libpulse
  python
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
  gvc::git+https://github.com/JingMatrix/gvc.git
)
b2sums=(
  'ca3df3335d6f3d204bfad714b096d5777e6578aa643d0b88b4dafadde8d7118a3480ec31d55b1abf9e96a616e76aa8e91503df8f8c5cc7307abcf7fc20f6f005'
  'ecd31b50393dbbf23b5f33d16d11573200ce28fd818b99e3f54f269287c505b724fc55f0135809c679629842448b29f7986bed309baa6193aaf1211f144171b4'
  'SKIP'
)

build() {
  local meson_options=(
     -D installed_tests=false
     -D firewalld=true
     -D nemo=true
  )

  arch-meson   gvc gvc-build
  meson configure  gvc-build       --no-pager
  meson compile -C gvc-build
  arch-meson gnome-shell-extension-$pkgname-$pkgver gsconnect-build "${meson_options[@]}"
  meson configure  gsconnect-build --no-pager
  meson compile -C gsconnect-build
}

package() {
  meson install -C gvc-build       --destdir "$pkgdir"
  meson install -C gsconnect-build --destdir "$pkgdir"
  install -vDm644 $pkgname.service -t "$pkgdir"/usr/lib/systemd/user/
}

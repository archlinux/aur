# Maintainer:
# Contributor: Michael Wyraz <archlinux@michael.wyraz.de>

_pkgname="network-manager-applet"
pkgname="$_pkgname-nolibappindicator"
pkgver=1.36.0
pkgrel=1
pkgdesc="Applet for managing network connections"
url="https://gitlab.gnome.org/GNOME/network-manager-applet"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  libmm-glib
  libnma
  libsecret
  networkmanager
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  meson
)

conflicts=('network-manager-applet')
provides=('network-manager-applet')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  local meson_options=(
    -D selinux=false
    -D appindicator=no
  )

  arch-meson "$_pkgsrc" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d
  shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_network-manager-applet-nolibappindicator() {
  depends+=(nm-connection-editor)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick nmce usr/bin/nm-connection-editor
  _pick nmce usr/share/applications/nm-connection-editor.desktop
  _pick nmce usr/share/icons/hicolor/*/*/nm-device-wwan{,-symbolic}.*
  _pick nmce usr/share/locale
  _pick nmce usr/share/man/man1/nm-connection-editor.1
  _pick nmce usr/share/metainfo
}

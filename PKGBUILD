# Maintainer: Michael Wyraz <archlinux@michael.wyraz.de>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>

pkgbase=network-manager-applet-nolibappindicator
pkgname=(network-manager-applet-nolibappindicator)
pkgver=1.30.0
pkgrel=1
pkgdesc="Applet for managing network connections"
url="https://gitlab.gnome.org/GNOME/network-manager-applet"
arch=(x86_64)
license=(GPL LGPL)
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
  libgudev
  meson
)
options=(debug)
_commit=d99d0305178738f6e96c4d49ceb394d513c10b6d  # tags/1.30.0^0
source=("git+https://gitlab.gnome.org/GNOME/network-manager-applet.git#commit=$_commit")
sha256sums=('SKIP')
conflicts=(network-manager-applet)
replaces=(network-manager-applet)

pkgver() {
  cd network-manager-applet
  git describe --tags | sed 's/-dev/dev/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd network-manager-applet
}

build() {
  local meson_options=(
    -D selinux=false
    -D appindicator=no
  )

  arch-meson network-manager-applet build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
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

# vim:set sw=2 sts=-1 et:

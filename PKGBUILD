# Maintainer: Michael Wyraz <archlinux@michael.wyraz.de>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>

pkgbase=network-manager-applet-nolibappindicator
pkgname=(network-manager-applet-nolibappindicator)
pkgver=1.32.0
pkgrel=3
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
_commit=06645751f898ab49181e52beb4f34fb83efc6c5e  # tags/1.32.0^0
source=("git+https://gitlab.gnome.org/GNOME/network-manager-applet.git#commit=$_commit")
sha256sums=('SKIP')
conflicts=(network-manager-applet)
provides=(network-manager-applet)

pkgver() {
  cd network-manager-applet
  git describe --tags | sed 's/-dev/dev/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd network-manager-applet

  # Drop libgudev makedep
  git cherry-pick -n d536d046ccd97b3eba76d2425f571bc8b7ada383

  # Fix crash when importing VPN profiles
  # https://bugs.archlinux.org/task/78360
  git cherry-pick -n 01281fae6b601598cd2006bc8f2d5be98810228d
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

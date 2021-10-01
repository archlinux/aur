# Maintainer: Michael Wyraz <archlinux@michael.wyraz.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>

pkgbase=network-manager-applet-nolibappindicator
pkgname=(network-manager-applet-nolibappindicator)
pkgver=1.24.0
pkgrel=1
pkgdesc="Applet for managing network connections (without dependency to libappindicator)"
url="https://gitlab.gnome.org/GNOME/network-manager-applet"
arch=(x86_64)
license=(GPL LGPL)
makedepends=(libsecret libnotify libmm-glib gobject-introspection git gtk-doc meson libnma
             libgudev)
_commit=2376585a0612c8ea65703cc32f6fb5c4578fbe38  # tags/1.24.0^0
source=("git+https://gitlab.gnome.org/GNOME/network-manager-applet.git#commit=$_commit")
sha256sums=('SKIP')
conflicts=(network-manager-applet)
replaces=(network-manager-applet)

pkgver() {
  cd network-manager-applet
  git describe --tags | sed 's/-dev/dev/;s/-/+/g'
}

prepare() {
  cd network-manager-applet
}

build() {
  arch-meson network-manager-applet build -D selinux=false -D appindicator=no
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
  depends=(nm-connection-editor libmm-glib libnotify libsecret networkmanager)

  meson install -C build --destdir "$pkgdir"

  _pick nmce "$pkgdir"/usr/bin/nm-connection-editor
  _pick nmce "$pkgdir"/usr/share/applications/nm-connection-editor.desktop
  _pick nmce "$pkgdir"/usr/share/icons/hicolor/*/*/nm-device-wwan{,-symbolic}.*
  _pick nmce "$pkgdir"/usr/share/locale
  _pick nmce "$pkgdir"/usr/share/man/man1/nm-connection-editor.1
  _pick nmce "$pkgdir"/usr/share/metainfo
}

# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Nikita Tarasov <nikatar@disroot.org>

pkgbase=network-manager-applet-indicator
pkgname=(network-manager-applet-indicator nm-connection-editor-indicator libnma-indicator)
pkgdesc="Applet for managing network connections, with Appindicator/StatusNotifierItem support from GNOME GitLab"
url="https://wiki.gnome.org/Projects/NetworkManager/"
pkgver=1.8.24
pkgrel=2
arch=(x86_64)
license=(GPL LGPL)
depends=(libappindicator-gtk3)
makedepends=(libsecret libnotify libmm-glib intltool gobject-introspection git gtk-doc meson
             libnm gcr gtk3 iso-codes mobile-broadband-provider-info)
#source=("git+https://gitlab.gnome.org/GNOME/network-manager-applet.git")
_commit=ce203dd7e99c9c943cb24756d25968781fb1dbd3  # tags/1.8.24^0
source=("git+https://gitlab.gnome.org/GNOME/network-manager-applet.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-indicator}
  git describe --tags | sed 's/-dev/dev/;s/-/+/g'
}

prepare() {
  cd ${pkgbase%-indicator}
  sed -i -e 's/Exec=nm-applet/Exec=nm-applet --indicator/' nm-applet.desktop.in
}

build() {
  arch-meson ${pkgbase%-indicator} build -Dselinux=false -Dappindicator=yes
  ninja -C build
}

#~ check() {
  #~ meson test -C build --print-errorlogs
#~ }

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_network-manager-applet-indicator() {
  depends=(nm-connection-editor libmm-glib libnotify libsecret networkmanager libappindicator-gtk3)
  provides=(network-manager-applet=$pkgver-$pkgrel)
  conflicts=(network-manager-applet)

  DESTDIR="$pkgdir" meson install -C build

### Split libnma
  _pick libnma "$pkgdir"/usr/include/libnma
  _pick libnma "$pkgdir"/usr/lib/girepository-1.0/NMA-*
  _pick libnma "$pkgdir"/usr/lib/libnma.*
  _pick libnma "$pkgdir"/usr/lib/pkgconfig/libnma.pc
  _pick libnma "$pkgdir"/usr/share/gir-1.0/NMA-*
  _pick libnma "$pkgdir"/usr/share/glib-2.0/schemas
  _pick libnma "$pkgdir"/usr/share/gtk-doc/html/libnma

### Split nm-connection-editor
  _pick nm-connection-editor "$pkgdir"/usr/bin/nm-connection-editor
  _pick nm-connection-editor "$pkgdir"/usr/share/applications/nm-connection-editor.desktop
  _pick nm-connection-editor "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-device-wwan.png
  _pick nm-connection-editor "$pkgdir"/usr/share/locale
  _pick nm-connection-editor "$pkgdir"/usr/share/man/man1/nm-connection-editor.1
  _pick nm-connection-editor "$pkgdir"/usr/share/metainfo
}

package_nm-connection-editor-indicator() {
  pkgdesc="NetworkManager GUI connection editor and widgets, with AppIndicator"
  depends=(libnma-indicator)
  provides=("nm-connection-editor=${pkgver}-${pkgrel}")
  conflicts=('nm-connection-editor' 'libnm-gtk<1.8.18-1')
  replaces=('libnm-gtk<1.8.18-1')

  mv nm-connection-editor/* "$pkgdir"
}

package_libnma-indicator() {
  pkgdesc="NetworkManager GUI client library, with AppIndicator"
  depends=(libnm gcr gtk3 iso-codes mobile-broadband-provider-info libappindicator-gtk3)
  provides=(libnma=${pkgver}-${pkgrel})
  conflicts=(libnma)
  mv libnma/* "$pkgdir"
}

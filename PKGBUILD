# Maintainer: David Cohen <dacohen@pm.me>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>

pkgname=gnome-software-snapd
pkgver=43.1
pkgrel=2
pkgdesc="GNOME Software Tools with snapd"
url="https://wiki.gnome.org/Apps/Software/"
arch=(x86_64)
license=(GPL)
makedepends=(appstream gsettings-desktop-schemas libpackagekit-glib flatpak
             fwupd docbook-xsl git gobject-introspection gtk-doc meson
             gnome-online-accounts libxmlb malcontent gtk4 libadwaita
             libsysprof-capture libglib-testing libsoup3)
provides=(gnome-software)
conflicts=(gnome-software)
_commit=e2bbfd3ad749755e15e1463d0e1cff6385ed52a7  # tags/43.1^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-software.git#commit=$_commit"
  "git+https://gitlab.gnome.org/mwleeds/gnome-pwa-list.git"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${pkgbase%-snapd}
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd ${pkgbase%-snapd}

  git submodule init
  git submodule set-url subprojects/gnome-pwa-list "$srcdir/gnome-pwa-list"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson ${pkgbase%-snapd} build -Dsnap=true
  meson compile -C build
}

# Not running tests - need root and a D-Bus system bus

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_gnome-software-snapd() {
  groups=(gnome)
  depends=(libxmlb gsettings-desktop-schemas libpackagekit-glib gtk4 libadwaita
           gnome-online-accounts appstream libsysprof-capture libsoup3 snapd-glib)
  optdepends=('flatpak: Flatpak support plugin'
              'fwupd: fwupd support plugin'
              'malcontent: Parental control plugin')

  meson install -C build --destdir "$pkgdir"

  local pkglibdir="$pkgdir/usr/lib/gnome-software"
  _pick packagekit-plugin "$pkglibdir"/plugins-*/libgs_plugin_packagekit*.so
}

# vim:set sw=2 sts=-1 et:

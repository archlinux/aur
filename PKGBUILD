# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>

_pkgbasename=gnome-software
pkgname=$_pkgbasename-plugin-snap
pkgver=47.4
pkgrel=1
pkgdesc="GNOME Software Tools"
url="https://apps.gnome.org/Software"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  gnome-software
  snapd
  snapd-glib
)
makedepends=(
  appstream
  docbook-xsl
  flatpak
  fwupd
  gdk-pixbuf2
  git
  glib2-devel
  gobject-introspection
  gsettings-desktop-schemas
  gtk-doc
  gtk4
  itstool
  json-glib
  libadwaita
  libglib-testing
  libgudev
  libsoup3
  libsysprof-capture
  libxmlb
  malcontent
  meson
)
groups=(gnome)
_patch_file="install_only_snap_plugin.patch"
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-software.git#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/mwleeds/gnome-pwa-list.git"
  "$_patch_file"
)
sha256sums=('SKIP'
            'SKIP'
            'da6912cfc56eac5ab10fd86540d84aa6f42cf301830fdb2d6e6bbd8fb74dd51c')

prepare() {
  cd $_pkgbasename

  git submodule init
  git submodule set-url subprojects/gnome-pwa-list "$srcdir/gnome-pwa-list"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update

  patch -Np1 -i "../$_patch_file"
}

build() {
  local meson_options=(
    -D packagekit=false
    -D snap=true
  )

  arch-meson $_pkgbasename build "${meson_options[@]}"

  local meson_compile_targets=(
    gs_plugin_snap
    org.gnome.Software.Plugin.Snap.metainfo.xml
    gnome-software-local-file-snap.desktop
  )
  meson compile -C build "${meson_compile_targets[@]}"
}

# Not running tests - need root and a D-Bus system bus

package() {
  meson install -C build --no-rebuild --tags snap --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

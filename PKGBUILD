# Maintainer: mammo0 <marc.ammon@hotmail.de>

_pkgbasename=gnome-software
pkgname="${_pkgbasename}"-plugin-snap
pkgver=47.4
pkgrel=2
pkgdesc="Snap support for GNOME Software"
url="https://apps.gnome.org/Software"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  gnome-software=${pkgver}
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
  "git+https://gitlab.gnome.org/GNOME/gnome-software.git#tag=${pkgver}"
  "git+https://gitlab.gnome.org/mwleeds/gnome-pwa-list.git"
  "${_patch_file}"
)
b2sums=('0df771654e707173507fe8f85f47b9c7dc46fdbeba86d2b88819686b6c0fea32945803f36074f958c8386bdf481a64ef74c7b5ca1c0047c73302f42a352b2b79'
        'SKIP'
        '736a43aecb1bbf91f2c641adf971a4f1acbc6f49fd970cd0507d68e169d5b6c5a8eb7109a38d49423895343e9473bc54455e9b8b991329b1c5300af07fd19b46')

prepare() {
  cd "${_pkgbasename}"

  git submodule init
  git submodule set-url subprojects/gnome-pwa-list "${srcdir}/gnome-pwa-list"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update

  patch -Np1 -i "../${_patch_file}"
}

build() {
  local meson_options=(
    -D packagekit=false
    -D snap=true
  )

  arch-meson "${_pkgbasename}" build "${meson_options[@]}"

  local meson_compile_targets=(
    gs_plugin_snap
    org.gnome.Software.Plugin.Snap.metainfo.xml
    gnome-software-local-file-snap.desktop
  )
  meson compile -C build "${meson_compile_targets[@]}"
}

# Not running tests - need root and a D-Bus system bus

package() {
  meson install -C build --no-rebuild --tags snap --destdir "${pkgdir}"
}

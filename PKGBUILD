# Maintainer: mammo0 <marc.ammon@hotmail.de>

_pkgbasename=gnome-software
pkgname="${_pkgbasename}"-plugin-snap
pkgver=48.1
pkgrel=1
pkgdesc="Snap support for GNOME Software"
url="https://apps.gnome.org/Software"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
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
b2sums=('befeffe1aa16d2e89b2bfdee6f6b01af4b08f9c86ef9a06103a582dad6f8141454f6784da67fde13eca0652c89f4422c724f9d8cc61e99aa270e8ae22db04656'
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
  depends=(gnome-software=${pkgver})

  meson install -C build --no-rebuild --tags snap --destdir "${pkgdir}"
}

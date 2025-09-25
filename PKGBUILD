# Maintainer: mammo0 <marc.ammon@hotmail.de>

_pkgbasename=gnome-software
pkgname="${_pkgbasename}"-plugin-snap
pkgver=49.0
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
b2sums=('29a09d6166c87b9326b4e095b6fce760698d3f4e7acfdc35e1e24ff2c23eb97b991c262cb3997d0fb952bb21d64835eca734d1fff854debd750839f1b7bbf43e'
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

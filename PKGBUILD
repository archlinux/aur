# Maintainer: mammo0 <marc.ammon@hotmail.de>

_pkgbasename=gnome-software
pkgname="${_pkgbasename}"-plugin-snap
pkgver=49.2
pkgrel=2
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
b2sums=('6983f3b2e1ebfc02fbec28a4ead599caa26cb6f43962ef8ea5fda7be991a0fc73f5e047a3144a676e909f7e880fbe7768aa4c6b5679f0185d3d305e99957f0c1'
        'SKIP'
        '07639c42c37508bed90f1979e5a875c654fd8b2aa0abd974bd22adc83f0a5b8c79b09245fbba73c35bc2c161c638758e6ae0aa46c570cba03979913d9817c7a2')

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

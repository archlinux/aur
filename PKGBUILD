# Maintainer: mammo0 <marc.ammon@hotmail.de>

_pkgbasename=gnome-software
pkgname="${_pkgbasename}"-plugin-snap
pkgver=50.2
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
b2sums=('f361691cf1b1d4f1fcc9a2e9808941be0d769870ce6d4e2a334b7564fb1a6e9cc5f2cb26b6bfc99a82e34900425b401840722a31fece9ba86c5a5f2c76006795'
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

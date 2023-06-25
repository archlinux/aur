# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname="totem"
_group="gnome"
pkgname="${_pkgname}-git"
pkgver=43.0+r127+gfa01f7dd2
pkgrel=1
pkgdesc="Movie player for the GNOME desktop based on GStreamer"
url="https://wiki.${_group}.org/Apps/Videos"
arch=(x86_64)
license=(GPL2 custom)
depends=(
  appstream-glib
  grilo
  "${_group}-desktop"
  gsettings-desktop-schemas
  gst-plugins-base
  gst-plugins-good
  gst-plugins-bad
  gst-plugin-gtk
  iso-codes
  libhandy
  libpeas
  libportal-gtk3
  python-gobject
  "${_pkgname}-plparser")
makedepends=(
  appstream-glib
  docbook-xsl
  intltool
  itstool
  git
  gobject-introspection
  gtk-doc
  libnautilus-extension
  meson
  python-pylint
  yelp-tools)
checkdepends=(xorg-server-xvfb)
optdepends=('gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'grilo-plugins: Media discovery')
provides=("lib${_pkgname}.so"
          "${_pkgname}")
conflicts=(
  "${_pkgname}"
  "${_pkgname}-plugin")
replaces=("${_pkgname}-plugin")
groups=("${_group}" "${_group}-git")
options=(debug)
_org_repo="https://gitlab.${_group}.org/GNOME"
source=("git+${_org_repo}/${_pkgname}.git"
        "git+${_org_repo}/libgd.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "${_pkgname}"

  git submodule init
  git submodule set-url subprojects/libgd "${srcdir}/libgd"
  git -c protocol.file.allow=always \
      submodule update
}

build() {
  local meson_options=(
    -D enable-gtk-doc=true
  )
  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" \
          -m644 "${_pkgname}/COPYING"
}

# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >
# Contributor: Jeremy Kescher < jeremy AT kescher.at >

pkgname=xdg-desktop-portal-git
_pkgname="${pkgname%-git}"
pkgver=1.18.1.r115.gb1a3d1e
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/${_pkgname}"
arch=(x86_64)
license=(LGPL)
depends=(
  fuse3
  gdk-pixbuf2
  geoclue
  glib2
  pipewire
  rtkit
  systemd
)
makedepends=(
  docbook-xsl
  flatpak
  git
  libportal
  meson
  python-pytest
  python-dbus
  python-dbusmock
  python-sphinx
  python-sphinx-copybutton
  python-sphinx-furo
  python-sphinxext-opengraph
  xmlto
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/flatpak/${_pkgname}")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(xdg-desktop-portal-impl)

  meson install -C build --destdir "$pkgdir"
}

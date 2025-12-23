# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from https://aur.archlinux.org/packages/xdg-desktop-portal-git by
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >
# Contributor: Jeremy Kescher < jeremy AT kescher.at >

_pkgname=xdg-desktop-portal
pkgname=${_pkgname}-minimal-git
pkgver=1.20.1.r207.g61fb5e66
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps - now free of extraneous dependencies!"
url="https://github.com/flatpak/${_pkgname}"
arch=(x86_64)
license=(LGPL)
depends=(
  fuse3
  gdk-pixbuf2
  glib2
  pipewire
)
makedepends=(
  docbook-xsl
  git
  libportal
  meson
  python-pytest
  python-dbus
  python-dbusmock
  xmlto
  glib2-devel
  umockdev
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

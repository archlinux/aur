# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >
# Contributor: Jeremy Kescher < jeremy AT kescher.at >

pkgname=xdg-desktop-portal-git
_pkgname="${pkgname%-git}"
pkgver=1.16.0.r69.gdea5cac
pkgrel=1
epoch=1
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
  xmlto
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/flatpak/${_pkgname}")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

   # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
 local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]')

 # Format git-based version for pkgver
 echo "${_gitversion}" | sed \
   -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
   -e 's|\([0-9]\+-g\)|r\1|' \
   -e 's|-|.|g'
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

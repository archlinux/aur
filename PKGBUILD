# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.16.0
pkgrel=3
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
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
  xmlto
)
_commit=88af6c8ca4106fcf70925355350a669848e9fd5a  # tags/1.16.0^0
source=("git+https://github.com/flatpak/xdg-desktop-portal#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  # https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome/-/issues/74
  # https://github.com/flatpak/xdg-desktop-portal/pull/985
  git cherry-pick -n 2a219279997c2124c8a639b0d009c9946ec97b40
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(xdg-desktop-portal-impl)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

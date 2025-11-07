# Maintainer: Leo Mercier (Sawang) <hi@leomercier.dev>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal-no-systemd-rtkit
pkgver=1.20.3
pkgrel=2
pkgdesc="Desktop integration portals for sandboxed apps (without systemd & rtkit dependencies)"
url="https://flatpak.github.io/xdg-desktop-portal/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  fuse3
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gstreamer
  gst-plugins-base-libs
  json-glib
  libgudev
  libpipewire
  pipewire
)
makedepends=(
  docbook-xsl
  flatpak
  geoclue
  git
  glib2-devel
  gst-plugins-good
  libportal
  meson
  python-dbus
  python-dbusmock
  python-docutils
  python-gobject
  python-pytest
  python-sphinx
  python-sphinx-copybutton
  python-sphinxext-opengraph
  python-sphinx-furo
  umockdev
  xmlto
)
checkdepends=(
  python-pytest-xdist
)
conflicts=(
  xdg-desktop-portal
)
provides=(xdg-desktop-portal)
optdepends=(
  'geoclue: Geolocation portal'
  'xdg-desktop-portal-impl: Portal backends'
)
source=(
  "git+https://github.com/flatpak/xdg-desktop-portal?signed#tag=$pkgver"
)
b2sums=('38a0bf62af4af9c14172079f121d975c0cf32657304ee8cd1fd65b762d548de7620bfe227843725f16345dd1f2b6090ff9e408fa6761ceef81c55a866caec64e')
validpgpkeys=(
  9038F70CA72FAC9D10C6327B89AFE307C861D158 # Georges Basile Stavracas Neto (Primary Key) <georges.stavracas@gmail.com>
  8307C0A224BABDA1BABD0EB9A6EEEC9E0136164A # Jonas Ådahl <jadahl@gmail.com>
)

prepare() {
  cd xdg-desktop-portal

  # pidfd fixes
  # https://github.com/flatpak/xdg-desktop-portal/issues/1653
  # https://github.com/flatpak/xdg-desktop-portal/pull/1713
  git cherry-pick -n dd08d451e3019f4ec6285ecb14d4c746b6e1d420 \
                     522236e41043a558a825da4cee70ee31ce607147
}

build() {
  artix-meson xdg-desktop-portal build -Dsystemd=disabled
  meson compile -C build
}

check() {
  # https://github.com/flatpak/xdg-desktop-portal/issues/1589
  XDP_VALIDATE_ICON_INSECURE=1 XDP_VALIDATE_SOUND_INSECURE=1 \
    meson test -C build --print-errorlogs ||:
}

package() {
  meson install -C build --destdir "$pkgdir"

  rm -r $pkgdir/usr/lib/systemd
}

# vim:set sw=2 sts=-1 et:

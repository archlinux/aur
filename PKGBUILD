# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.19.4
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
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
  rtkit
  systemd
  systemd-libs
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
optdepends=(
  'geoclue: Geolocation portal'
  'xdg-desktop-portal-impl: Portal backends'
)
source=(
  "git+https://github.com/flatpak/xdg-desktop-portal?signed#tag=$pkgver"
  0001-Use-pytest-instead-of-pytest-3.patch
)
b2sums=('1ac3be51128aca31d90d68c3a575d7c71193988b8ec85adf944f155d1788eb647624b48c379effc324a315a181ece47b8158b95596a96c8d9a1c6dba6d55d6ce'
        'eeb8a979f615cfd27892b2dee6ee67cd6ed9e4f95b81924056c2b4bc7afb32bb3ce8075c3bf78e6ff4e9d31ebca324f18fa52c022f093f7c82ce87c0799b9c45')
validpgpkeys=(
  9038F70CA72FAC9D10C6327B89AFE307C861D158 # Georges Basile Stavracas Neto (Primary Key) <georges.stavracas@gmail.com>
)

prepare() {
  cd $pkgname

  # We do not link pytest-3 -> pytest so tests would fail
  ## https://github.com/flatpak/xdg-desktop-portal/pull/1638
  git apply -3 ../0001-Use-pytest-instead-of-pytest-3.patch
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  # https://github.com/flatpak/xdg-desktop-portal/issues/1589
  XDP_VALIDATE_ICON_INSECURE=1 XDP_VALIDATE_SOUND_INSECURE=1 \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.20.4
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://flatpak.github.io/xdg-desktop-portal/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  fuse3
  gdk-pixbuf2
  glib2
  glibc
  gstreamer
  gst-plugins-base-libs
  json-glib
  libgcc
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
  "git+https://gitlab.gnome.org/GNOME/libglnx.git#commit=ccea836b799256420788c463a638ded0636b1632"
)
b2sums=('5a8887f4b40135758471050df6853c996905c58eaeaefc78287e2112c1a685659952f0334416ca19140eb8059014c2e7bc9afbfb888e13a06f7cfc12b7648673'
        'f48f648508370cb14d86ba2a44f60e61ff0e301a94c587c790631f09aa0cdc3d70ef0054da06596c67a4011e123a83a62f9e4fdef43909205d25b8b88d9f086a')
validpgpkeys=(
  9038F70CA72FAC9D10C6327B89AFE307C861D158 # Georges Basile Stavracas Neto (Primary Key) <georges.stavracas@gmail.com>
  8307C0A224BABDA1BABD0EB9A6EEEC9E0136164A # Jonas Ådahl <jadahl@gmail.com>
  6B0266175A1A8BC8892D3DF79E4D520F7EC588CF # Sebastian Wick <sebastian.wick@redhat.com>
)

prepare() {
  cd $pkgname

  # pidfd fixes
  # https://github.com/flatpak/xdg-desktop-portal/issues/1653
  # https://github.com/flatpak/xdg-desktop-portal/pull/1713
  git cherry-pick -n dd08d451e3019f4ec6285ecb14d4c746b6e1d420 \
                     522236e41043a558a825da4cee70ee31ce607147
}

build() {
  # Inject libglnx
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

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

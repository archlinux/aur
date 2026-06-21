# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=1.22.1
pkgrel=2
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://flatpak.github.io/xdg-desktop-portal/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  fuse3
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-base-libs
  gstreamer
  json-glib
  libgcc
  libgudev
  libpipewire
  pipewire
  systemd
  systemd-libs
)
makedepends=(
  docbook-xsl
  flatpak
  gamemode
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
  python-sphinx-furo
  python-sphinxext-opengraph
  rtkit
  umockdev
  xmlto
)
checkdepends=(
  python-pytest-xdist
)
optdepends=(
  'gamemode: GameMode portal'
  'geoclue: Location portal'
  'rtkit: Realtime portal'
  'xdg-desktop-portal-impl: Portal backends'
)
source=(
  "git+https://github.com/flatpak/xdg-desktop-portal?signed#tag=$pkgver"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=c6f2359cc1d00f16e0a0e2527fa0bc1882b8b5ab"
  "git+https://gitlab.gnome.org/GNOME/libglnx.git#commit=ff64d52116ae74f0d25e24f089db28921ea171ff"
  allow-no-graphical-session-target.patch
)
b2sums=('1eb3457bcf2d6db190bd2e9086cec6bbe7e383136f2f5d6fe9b2d637f81143f0361d67fae752f2a1a9a14049fc3ce29b948803513f3d98619a41182dab56bf3d'
        'd8637ce7c2887fbf34b1d0788d04c9afefbbaa03252360639ee097fc075356876e0800ba9c5eb26c85f9265dcf05d0281aaedce70a953a38530203b7bcc09a9c'
        '9d4bcd5c69a82fe19fef70d467d07e03daa97d640e1f1fd5bcaef28cb7f3d476b4bb0fdc4b4b7d584c4408082e110dc977cc40a046b1d1ce8e93c34eddd5795c'
        '02e34f42afde2aee3ce48b30636e9ec5a4697f268778dd8ada88761f1d0c724208c70215eb0f8914c313d7364eb2e88b0dbb402d592bc6ae5b37f950b1086610')
validpgpkeys=(
  9038F70CA72FAC9D10C6327B89AFE307C861D158 # Georges Basile Stavracas Neto (Primary Key) <georges.stavracas@gmail.com>
  8307C0A224BABDA1BABD0EB9A6EEEC9E0136164A # Jonas Ådahl <jadahl@gmail.com>
  6B0266175A1A8BC8892D3DF79E4D520F7EC588CF # Sebastian Wick <sebastian.wick@redhat.com>
)

prepare() {
  cd $pkgname

  # Allow service's start even if graphical-session is not reached
  # https://gitlab.archlinux.org/archlinux/packaging/packages/xdg-desktop-portal/-/work_items/4
  # https://github.com/flatpak/xdg-desktop-portal/issues/1983
  # https://github.com/flatpak/xdg-desktop-portal/pull/2027
  git apply -3 ../allow-no-graphical-session-target.patch
}

build() {
  # Inject subprojects
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

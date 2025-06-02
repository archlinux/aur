# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Princeton Ferro (prince781) <princetonferro[at]gmail[dot]com>
# shellcheck shell=bash disable=SC2034,SC2164

_pkgname=cambalache
pkgname=cambalache-git
pkgver=0.96.0.r24.gdd90c3f
pkgrel=1
pkgdesc="A new RAD tool for Gtk 4 and 3 (Git version)"
url="https://gitlab.gnome.org/jpu/cambalache"
arch=('x86_64')
license=('LGPL-2.1-only')
depends=('at-spi2-core' 'cairo' 'dconf' 'gdk-pixbuf2' 'glib2' 'graphene' 'gtk3' 'gtk4'
         'gtksourceview5' 'harfbuzz' 'hicolor-icon-theme' 'libadwaita' 'libhandy'
         'libxkbcommon' 'pango' 'pixman' 'python' 'python-gobject' 'python-lxml'
         'wayland' 'webkit2gtk-4.1' 'webkitgtk-6.0' 'wlroots0.18')
makedepends=('git' 'gobject-introspection' 'meson' 'ninja' 'wayland-protocols')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=("git+${url}.git")
sha512sums=('SKIP')

prepare() {
  # Use project's Casilda dependency
  # (This is likely the best solution until other programs start to use it)
  meson subprojects download casilda --sourcedir="${_pkgname}"
  meson subprojects update casilda --sourcedir="${_pkgname}"
}

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname}" build --reconfigure --force-fallback-for=casilda

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

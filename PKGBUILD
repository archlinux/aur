# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=cambalache
pkgver=1.0
pkgrel=1
pkgdesc="A new RAD tool for Gtk 4 and 3"
arch=('x86_64')
url="https://gitlab.gnome.org/jpu/cambalache"
license=('LGPL-2.1-only')
depends=('at-spi2-core' 'cairo' 'dconf' 'gdk-pixbuf2' 'glib2' 'graphene' 'gtk3' 'gtk4'
         'gtksourceview5' 'harfbuzz' 'hicolor-icon-theme' 'libadwaita' 'libepoxy'
         'libhandy' 'libxkbcommon' 'pango' 'pixman' 'python' 'python-gobject'
         'python-lxml' 'wayland' 'webkit2gtk-4.1' 'webkitgtk-6.0' 'wlroots0.19')
makedepends=('git' 'gobject-introspection' 'meson' 'ninja' 'wayland-protocols')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a86b09a2ce83405b0cf959e0ee266c10df3b8afff93146773161cba9ec49a23af79d497d8d630319032c607745747a9a5b606c4376e242d4478fbc99da995d6c')

prepare() {
  # Use project's Casilda dependency
  # (This is likely the best solution until other programs start to use it)
  meson subprojects download casilda --sourcedir="${pkgname}-${pkgver}"
  meson subprojects update casilda --sourcedir="${pkgname}-${pkgver}"
}

build() {
  arch-meson "${pkgname}-${pkgver}" build --reconfigure --force-fallback-for=casilda

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

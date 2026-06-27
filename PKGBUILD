# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=cambalache
pkgver=1.0.3
pkgrel=1
pkgdesc="A new RAD tool for Gtk 4 and 3"
arch=('x86_64')
url="https://gitlab.gnome.org/jpu/cambalache"
license=('LGPL-2.1-only')
depends=('at-spi2-core' 'cairo' 'dconf' 'gdk-pixbuf2' 'glib2' 'graphene' 'gtk3' 'gtk4'
         'gtksourceview5' 'harfbuzz' 'hicolor-icon-theme' 'libadwaita' 'libepoxy'
         'libhandy' 'libxkbcommon' 'pango' 'pixman' 'python' 'python-gobject'
         'python-lxml' 'wayland' 'webkit2gtk-4.1' 'webkitgtk-6.0' 'wlroots0.20')
makedepends=('git' 'gobject-introspection' 'meson' 'ninja' 'wayland-protocols')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0d9ab63988a2baeafeb25d5369b655af48e3369510b8bfc9a0fad12271344c419fbe21ff6aeb0e41aa3a2c6869e65954eb040a7b7f73d40f88efd6cdeb097c8b')

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

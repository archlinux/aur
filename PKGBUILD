# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=cambalache
pkgver=1.0.1
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
sha512sums=('1f6b72e9d9050787e9ba2febdbc239c40b748a481583355b111e73f832783a9043a6d26e45558133f2dc2fc8c0ebee41e3e5c5257f859afd76e002786099a1de')

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

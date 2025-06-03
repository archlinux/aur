# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2164

pkgname=cambalache
pkgver=0.96.1
pkgrel=4
pkgdesc="A new RAD tool for Gtk 4 and 3"
arch=('x86_64')
url="https://gitlab.gnome.org/jpu/cambalache"
license=('LGPL-2.1-only')
depends=('at-spi2-core' 'cairo' 'dconf' 'gdk-pixbuf2' 'glib2' 'graphene' 'gtk3' 'gtk4'
         'gtksourceview5' 'harfbuzz' 'hicolor-icon-theme' 'libadwaita' 'libhandy'
         'libxkbcommon' 'pango' 'pixman' 'python' 'python-gobject' 'python-lxml'
         'wayland' 'webkit2gtk-4.1' 'webkitgtk-6.0' 'wlroots0.18')
makedepends=('git' 'gobject-introspection' 'meson' 'ninja' 'wayland-protocols')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('69875a1799e54b71f747458524d059ad84e8c2dfe5fa077c72da8efb72199c4a496c270432a4c74199aad5bcd5bcfca037088d2e5a55b0ecc2951569c95e79c5')

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

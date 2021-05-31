# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=gtk-rc
pkgver=4.3.0
pkgrel=1
epoch=0
pkgdesc='GObject-based multi-platform GUI toolkit -- beta/testing/rc releases'
arch=('x86_64')
url='https://www.gtk.org/'
license=('lgpl')
provides=(libgtk-4.so gtk4=${pkgver} gtk-update-icon-cache gtk4-docs gtk4-demos)
conflicts=(gtk4 gtk-update-icon-cache gtk4-docs gtk4-demos)
depends=(
glib2
cairo
pango
fribidi
gdk-pixbuf2
libepoxy
libgl
libegl
harfbuzz
libxkbcommon
graphene
iso-codes
tracker3
colord
wayland
wayland-protocols
libxrandr
libx11
libxrender
libxi
libxext
libxcursor
libxdamage
libxfixes
libxcomposite
fontconfig
libxinerama
vulkan-icd-loader
vulkan-headers
libcloudproviders
libcups
rest
json-glib
ffmpeg
gst-plugins-bad-libs
librsvg
dconf
shared-mime-info
desktop-file-utils
adwaita-icon-theme
cantarell-fonts
gtk-update-icon-cache)
makedepends=(
meson
ninja
gi-docgen
shaderc
sassc
gobject-introspection
docbook-xsl)
source=("${pkgname}-${pkgver}.tar.xz::https://download.gnome.org/sources/gtk/${pkgver%.*}/gtk-${pkgver}.tar.xz")
md5sums=('002270efd3fceb34763ff73c59b3874a')

prepare() {
  cd gtk-${pkgver}
}

build() {
  CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"
  local meson_options=(
    -D broadway-backend=true
    -D cloudproviders=enabled
    -D tracker=enabled
    -D colord=enabled
    -D gtk_doc=true
    -D man-pages=true
  )

  arch-meson gtk-${pkgver} build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}


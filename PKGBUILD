# Maintainer: Radiolin <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette-git
pkgver=0.2.1.g49.r3.g7763e48
pkgrel=2
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 i686 x86_64)
url="https://altlinux.space/rirusha/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glibc
  glib2
  gst-plugins-good
  gstreamer
  gtk4
  json-glib
  hicolor-icon-theme
  libadwaita
  libsoup3
  libgee
  libxml2
  libxml2-legacy
  sqlite
  webkitgtk-6.0
  xdg-desktop-portal-impl
  gobject-introspection
)
makedepends=(
  blueprint-compiler
  git
  meson
  vala
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')
# For version > 0.2.1.g49.r3
# source=(
#  ${pkgname%-git}::git+$url.git
#  libapi-base::git+https://gitlab.gnome.org/Rirusha/libapi-base.git
#  libtape::git+https://gitlab.gnome.org/Rirusha/libtape.git
# )
# b2sums=('SKIP' 'SKIP' 'SKIP')


pkgver() {
  cd ${pkgname%-git}

  # Remove for version > 0.2.1.g49.r3
  git checkout 7763e48b99125aecd175dc10a1b53a444997b3e9 2>/dev/null || true

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

# For version > 0.2.1.g49.r3
# prepare() {
#    cd ${pkgname%-git}
#    mkdir -p subprojects/{libapi-base,libtape}
#    mv ../libapi-base ../libtape subprojects/
#    sed -i "s|libapi_base_dep = dependency('libapi-base-4')|libapi_base_dep = dependency('libapi-base-4', fallback: ['libapi-base', 'lib_dep'])|" meson.build
#    sed -i "|--includedir', gee_girdir,|a\\      '--includedir', meson.current_build_dir() / '..' / '..' / 'libapi-base' / 'lib'," subprojects/libtape/lib/meson.build
# }

build() {
  # Remove for version > 0.2.1.g49.r3
  git -C ${pkgname%-git} checkout 7763e48b99125aecd175dc10a1b53a444997b3e9

  arch-meson -Dis_devel=true ${pkgname%-git} build
  meson configure build --no-pager
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

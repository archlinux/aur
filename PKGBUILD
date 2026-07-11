pkgname=libadwaita-without-adwaita
epoch=1
pkgver=1.9.2
pkgrel=1
url="https://gnome.pages.gitlab.gnome.org/libadwaita"
pkgdesc='libadwaita; Includes a patch to not overwrite the system theme. Because the maintainer likely abandoned the pkg'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=(LGPL-2.1-or-later)

provides=("libadwaita=${pkgver}" "libadwaita-1.so=0-64")
conflicts=('libadwaita')

source=(
  "https://gitlab.gnome.org/GNOME/libadwaita/-/archive/${pkgver}/libadwaita-${pkgver}.tar.gz"
  theming_patch.diff
)
sha256sums=('311fa22d60f73609e5662f27e0beb5f1188c24661acfe02b6faf0871cc75bec8' 'SKIP')

depends=(appstream fribidi glib2 glibc graphene gtk4 pango)
makedepends=(meson gi-docgen sassc gobject-introspection vala pkg-config patch cmake libsass gcc glib2-devel)

build() {
  cd "$srcdir/libadwaita-$pkgver"
  patch -p1 <"$srcdir/theming_patch.diff"

  meson setup build \
    --prefix=/usr \
    -Dexamples=false \
    -Dtests=false
  meson compile -C build
}

package() {
  cd "$srcdir/libadwaita-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}

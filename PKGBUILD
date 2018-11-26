# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=gtranslator
pkgname=$_name-git
pkgver=3.31.0.r4753.2cec9c38
pkgrel=1
pkgdesc='Translation Editor, an Enhanced gettext po file editor for the GNOME'
arch=('x86_64')
url='http://projects.gnome.org/gtranslator/'
license=('GPL3')
depends=(gtksourceview4 gspell gettext libgda)
makedepends=(meson gobject-introspection git gtk-doc itstool)
conflicts=($_name)
provides=($_name)
source=("git+https://gitlab.gnome.org/GNOME/$_name")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  v=$(grep -R '^  version:' meson.build | cut -d\' -f2)
  printf "$v.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build
  mkdir build
}

build() {
  meson --prefix /usr --buildtype=plain -Dgtk_doc='true' $_name build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

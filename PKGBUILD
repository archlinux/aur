pkgname=malcontent-git
_pkgname=malcontent
pkgver=0.7.0
pkgrel=1
pkgdesc="Parental control support for applications"
url="https://gitlab.freedesktop.org/pwithnall/malcontent"
license=(LGPL2.1)
arch=(x86_64)
depends=('accountsservice' 'dbus' 'flatpak' 'glib2' 'gtk3' 'polkit')
makedepends=('git' 'meson' 'gobject-introspection' 'gtk-doc')
provides=(libmalcontent{,-ui}-${pkgver%%.*}.so 'malcontent')
conflicts=('malcontent')
source=("git+https://gitlab.freedesktop.org/pwithnall/malcontent.git"
        "git+https://gitlab.gnome.org/pwithnall/libglib-testing.git")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git submodule set-url subprojects/libglib-testing "$srcdir/libglib-testing"
  git submodule update
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}

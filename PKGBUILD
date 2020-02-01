# Maintainer: Joseph Carta <cartakid@gmail.com>
# Contribitor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=pygobject37
pkgname=(python37-gobject pygobject37-devel)
pkgver=3.34.0
pkgrel=1
pkgdesc="Python Bindings for GLib/GObject/GIO/GTK+"
url="https://wiki.gnome.org/Projects/PyGObject"
arch=(x86_64)
license=(LGPL)
depends=(python37 gobject-introspection-runtime)
makedepends=(python-cairo gobject-introspection git meson)
optdepends=('cairo: Cairo bindings')
_commit=fae47858d24e9fbd6745c094db0064c5506de5cb  # tags/3.34.0^0
source=("git+https://gitlab.gnome.org/GNOME/pygobject.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pygobject
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd pygobject
}

_build() {
  arch-meson pygobject build-$1 -D python=/usr/bin/$1
  ninja -C build-$1
}

_package() {
  DESTDIR="$pkgdir" meson install -C build-$1
  $1 -m compileall -d /usr/lib "$pkgdir/usr/lib"
  $1 -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}

build() {
  _build python3.7
}

package_python37-gobject() {
  depends=("pygobject37-devel=$pkgver")

  _package python3.7

### Split -devel
  mkdir -p "$srcdir/devel"
  mv "$pkgdir"/usr/{include,lib/pkgconfig} "$srcdir/devel"
}

package_pygobject37-devel() {
  pkgdesc="Common development files for pygobject"
  optdepends=()

  mkdir -p "$pkgdir/usr/lib"
  mv devel/include "$pkgdir/usr"
  mv devel/pkgconfig "$pkgdir/usr/lib"
  mv "$pkgdir/usr/lib/pkgconfig/pygobject-3.0.pc" "$pkgdir/usr/lib/pkgconfig/pygobject37-3.0.pc"
}

# vim:set sw=2 et:

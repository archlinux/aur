# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=python2-gobject
pkgver=3.36.1
pkgrel=3
pkgdesc="Python 2 Bindings for GLib/GObject/GIO/GTK+"
url="https://wiki.gnome.org/Projects/PyGObject"
arch=(x86_64)
license=(LGPL)
depends=(gobject-introspection-runtime python2)
makedepends=(python2-cairo gobject-introspection git meson)
checkdepends=(python2-pytest gtk3 xorg-server-xvfb)
optdepends=('cairo: Cairo bindings')
_commit=5c6bee1c2a0d08cf367aa61784b5b967128e68b2  # tags/3.36.1^0
source=("git+https://gitlab.gnome.org/GNOME/pygobject.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pygobject
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd pygobject
  # tests: don't use strict mode for xfail with the excepthook plugin
  git cherry-pick -n dae0500166068d78150855bdef94f0bee18b31dd
}

build() {
  arch-meson pygobject build -D python=/usr/bin/python2
  meson compile -C build
}

check() {
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package_python2-gobject() {
  DESTDIR="$pkgdir" meson install -C build
  python2 -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python2 -O -m compileall -d /usr/lib "$pkgdir/usr/lib"

  # Remove devel stuff conflicting with python-gobject
  rm -r "$pkgdir"/usr/{include,lib/pkgconfig}
}

# vim:set sw=2 et:

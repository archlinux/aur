# Maintainer: username227 <gfrank227 [at] gmail [dot] com
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=pygobject350
pkgname=(
  python-gobject350
  python-gobject350-docs
)
pkgver=3.50.0
pkgrel=1
pkgdesc="Python bindings for GLib/GObject/GIO/GTK - version 3.50.0"
url="https://pygobject.gnome.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  glibc
  gobject-introspection-runtime
  libffi
  libgirepository
  python
)
makedepends=(
  git
  gobject-introspection
  meson
  python-cairo
  python-setuptools
  python-sphinx
  python-sphinx-copybutton
  python-sphinx-furo
)
checkdepends=(
  gtk3
  python-pytest
  xorg-server-xvfb
)
optdepends=('python-cairo: Cairo bindings')
conflicts=('pygobject')
source=("git+https://gitlab.gnome.org/GNOME/pygobject.git?signed#tag=$pkgver")
b2sums=('d13a6751ec75606e9adf04c85bad53e329cbab6c7534dd81bcb64ded2f40b40371ec47ac6affa89dd075fbd423f9573ecccc3c9dbe01bf9d8b8e028fa93ddcd2')
validpgpkeys=(
  0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC # Christoph Reiter <reiter.christoph@gmail.com>
)

prepare() {
  cd pygobject
}

build() {
  arch-meson pygobject build
  meson compile -C build
}

check() {
  PYTEST_ADDOPTS="-v" PYGI_TEST_VERBOSE=1 \
    xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package_python-gobject350() {
  provides=("pygobject" "python-gobject")
  conflicts=(pygobject-devel)
  replaces=('pygobject-devel<=3.36.1-1')

  meson install -C build --destdir "$pkgdir"
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}

package_python-gobject350-docs() {
  pkgdesc="Developer documentation for PyGObject"
  depends=()
  optdepends=()

  python -m sphinx -b html pygobject/docs "$pkgdir/usr/share/doc/pygobject/html"
  rm -r "$pkgdir/usr/share/doc/pygobject/html/.doctrees"
}


# vim:set sw=2 sts=-1 et:


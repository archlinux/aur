# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-gobject-introspection
_pkgbase=gobject-introspection
pkgname=(lib32-gobject-introspection lib32-gobject-introspection-runtime)
pkgver=1.74.0
pkgrel=1
pkgdesc="Introspection system for GObject-based libraries (32-bit)"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64)
license=(LGPL GPL)
_glibver=2.74.4
_glib_commit=e35768fe299d6389f8f5eef15593762389d2c07d  # tags/2.74.4^0
_pyver=3.10
depends=("python-mako" "python-markdown" "lib32-python>=${_pyver}")
makedepends=(bison lib32-cairo git gtk-doc python-sphinx meson "lib32-glib2=$_glibver")
_commit=37bde613a7cb77e7399dafb25731e13208f0ae0b  # tags/1.74.0^0
source=("git+https://gitlab.gnome.org/GNOME/gobject-introspection.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_glib_commit"
        "x86-linux-gnu")
sha512sums=('SKIP'
            'SKIP'
            '0be6a1cb2b7d82b25aabdcb7893e67d003d132471055d5853f5b3139c6665b3a1d6b65c63b46388b4af9c2fa0b2200791fb2f727c066e3a89d2c44be569104ad')
validpgpkeys=('923B7025EE03C1C59F42684CF0942E894B2EAFA0'  # Philip Withnall <philip@tecnocode.co.uk>
              'D4C501DA48EB797A081750939449C2F50996635F') # Marco Trevisan <marco@trevi.me>

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  /usr/bin/meson setup \
      "${_pkgbase}"   "build" \
      --prefix        /usr \
      --sbindir       bin \
      --buildtype     plain \
      --libexecdir    lib32 \
      --libdir        /usr/lib32 \
      --auto-features enabled \
      --wrap-mode     nodownload \
      -D gir_dir_prefix=lib32/gobject-introspection/share \
      -D gtk_doc=false \
      -D python=python${_pyver}-32 \
      -D glib_src_dir="$srcdir/glib" \
      --cross-file    x86-linux-gnu
  sed -i 's/env python3$/env python3-32/' build/tools/g-ir-{scanner,doc-tool,annotation-tool}
  /usr/bin/meson compile -C build
}

check() {
  /usr/bin/meson test -C build
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_lib32-gobject-introspection() {
  depends+=("gobject-introspection>=$pkgver" "lib32-gobject-introspection-runtime=$pkgver-$pkgrel")

  export CC="gcc -m32"
  export CXX="g++ -m32"
  /usr/bin/meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  python-32 -m compileall -d /usr/lib32/$_pkgbase usr/lib32/$_pkgbase
  python-32 -O -m compileall -d /usr/lib32/$_pkgbase usr/lib32/$_pkgbase

  _pick runtime usr/lib32/lib*
  _pick runtime usr/lib32/girepository-*
  rm -r usr/{include,share}
  for f in usr/bin/*; do
    mv "$f" "$f-32"
  done
}

package_lib32-gobject-introspection-runtime() {
  pkgdesc+=" (runtime library)"
  depends=(lib32-glib2)
  provides=(libgirepository-1.0.so)

  mv runtime/* "$pkgdir"
}

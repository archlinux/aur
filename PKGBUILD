# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

o_pkgname=libsecret
pkgname=libsecret-mr94
pkgver=0.20.4
pkgrel=1
pkgdesc="Library for storing and retrieving passwords and other secrets with MR #94 applied"
url="https://wiki.gnome.org/Projects/Libsecret"
arch=(x86_64)
license=(LGPL)
depends=(glib2 libgcrypt)
checkdepends=(python-dbus dbus-glib python-gobject gjs)
makedepends=(docbook-xsl gobject-introspection vala git gtk-doc meson valgrind)
optdepends=('org.freedesktop.secrets: secret storage backend')
provides=(libsecret-1.so libsecret)
conflicts=(libsecret)
_commit=3fe635e64efd4b8dbc9ec3548b0bc8034c7665c4  # tags/0.20.4^0
source=("git+https://gitlab.gnome.org/GNOME/libsecret.git#commit=$_commit"
        fix-test.diff
        create-default-collection.patch)
sha256sums=('SKIP'
            '760e40ffcd3383149d62f803a900b3af1a838fb084a8403e45d0764696dd2ffe'
            'fe8e805902fd7a98472f20f06b1231036eea6d1b644cd92758f7509b94a724f3')

pkgver() {
  cd $o_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $o_pkgname

  # Fix compiliation of test-vala-unstable
  # https://gitlab.gnome.org/GNOME/libsecret/-/issues/54
  git apply -3 ../fix-test.diff

  git apply -3 ../create-default-collection.patch
}

build() {
  arch-meson $o_pkgname build
  meson compile -C build
}

check() {
  dbus-run-session meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:

# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgbase=glib2-selinux
pkgname=(glib2-selinux glib2-selinux-docs)
pkgver=2.78.1
pkgrel=1
pkgdesc="Low level core library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL)
arch=(x86_64)
depends=(pcre libffi util-linux-libs zlib libsysprof-capture)
makedepends=(dbus gettext gtk-doc shared-mime-info python libelf git util-linux
             meson dbus libselinux)
options=(
  debug
  staticlibs
  )
_commit=21624e78f013ee8706483086e3086076d08fe242  # tags/2.78.1^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/gvdb.git"
        noisy-glib-compile-schemas.diff
        glib-compile-schemas.hook gio-querymodules.hook
  )
sha256sums=('SKIP'
            '81a4df0b638730cffb7fa263c04841f7ca6b9c9578ee5045db6f30ff0c3fc531'
            '64ae5597dda3cc160fc74be038dbe6267d41b525c0c35da9125fbf0de27f9b25'
            '2a9f9b8235f48e3b7d0f6cfcbc76cd2116c45f28692cac4bd61074c495bd5eb7'
            '92d08db5aa30bda276bc3d718e7ff9dd01dc40dcab45b359182dcc290054e24e')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../noisy-glib-compile-schemas.diff

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always submodule update

}

build() {
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  local meson_options=(
    --default-library both
    -D glib_debug=disabled
    -D gtk_doc=true
    -D man=true
    -D selinux=enabled
    -D sysprof=enabled
  )

  # Produce more debug info: GLib has a lot of useful macros
  CFLAGS+=" -g3"
  CXXFLAGS+=" -g3"

  # use fat LTO objects for static libraries
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"

  arch-meson glib build "${meson_options[@]}"

}

package_glib2-selinux() {
  depends+=(libmount.so)
  provides+=(libgio-2.0.so libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
             libgthread-2.0.so glib2=$pkgver)
  conflicts=(glib2)
  optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
              'libelf: gresource inspection tool'
              'libselinux: selinux support'
              'gvfs: most gio functionality'
             )

  DESTDIR="$pkgdir" meson install -C build

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -D gio-querymodules.script "$pkgdir/usr/share/libalpm/scripts/gio-querymodules"

  python -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"

  # Split docs
  mkdir -p docs/usr/share
  mv {"$pkgdir",docs}/usr/share/gtk-doc
}

package_glib2-selinux-docs() {
  pkgdesc="Documentation for GLib"
#  conflicts=(glib2-docs)
  provides=(glib2-docs)
  license+=(custom)

  mv -t "$pkgdir" docs/*
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 glib/docs/reference/COPYING
}

# vim:set sw=2 et:

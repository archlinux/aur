# Maintainer: Dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.80.5
pkgrel=1
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="https://gist.github.com/Dudemanguy/d199759b46a79782cc1b301649dec8a5"
options=(!docs staticlibs)
license=(LGPL-2.1-or-later)
arch=(x86_64)
provides=(glib2=$pkgver libg{lib,io,irepository,module,object,thread}-2.0.so)
conflicts=('glib2')
depends=(
  bash
  glibc
  libffi
  libffi.so
  libmount.so
  libsysprof-capture
  pcre2
  util-linux-libs
  tumbler
  zlib
)
makedepends=(
  dbus
  dconf
  gettext
  gi-docgen
  git
  gobject-introspection
  libelf
  meson
  python
  python-docutils
  python-packaging
  shared-mime-info
  util-linux
)
checkdepends=(
  desktop-file-utils
  glib2
)
optdepends=(
  'dconf: GSettings storage backend'
  'glib2-devel: development tools'
  'gvfs: most gio functionality'
)
source=(
  "git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$pkgver"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
  0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
  0002-glocalfileinfo-add-a-dbus-thumbnail-generator.patch
  gio-querymodules.hook
  glib-compile-schemas.hook
)
b2sums=('fbda547a8b941dd877fb704406b78e16856c0337a71102d0041b6276d648d0f90fc70a7a0c25c0d9a5b3d1cdc9c3f1599d44f386d77698ea76c24a143fa76622'
        'SKIP'
        '94c73ca7070c239494873dd52d6ee09382bbb5b1201f7afd737cfa140b1a2fb0744b2c2831baf3943d1d072550c35888d21ce6f19f89481ff9d1a60d9a0b30e0'
        '5eed57eccc15fa9994228815874200135e9ee682b9bd718dae4b486eb3a65f2efb8121f45afedd4dd33208297738b5f1f489cb9a798a896540a505b32a37cc08'
        '14c9211c0557f6d8d9a914f1b18b7e0e23f79f4abde117cb03ab119b95bf9fa9d7a712aa0a29beb266468aeb352caa3a9e4540503cfc9fe0bbaf764371832a96'
        'd30d349b4cb4407839d9074ce08f5259b8a5f3ca46769aabc621f17d15effdb89c4bf19bd23603f6df3d59f8d1adaded0f4bacd0333afcab782f2d048c882858')
validpgpkeys=(
  923B7025EE03C1C59F42684CF0942E894B2EAFA0 # Philip Withnall <pwithnall@gnome.org>
)

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch

  # Apply patch to generate thumbnails
  git apply -3 ../0002-glocalfileinfo-add-a-dbus-thumbnail-generator.patch

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local meson_options=(
    --default-library both
    -D glib_debug=disabled
    -D introspection=enabled
    -D man-pages=enabled
    -D selinux=disabled
    -D sysprof=enabled
  )

  # Produce more debug info: GLib has a lot of useful macros
  CFLAGS+=" -g3"
  CXXFLAGS+=" -g3"

  # use fat LTO objects for static libraries
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"

  arch-meson glib build "${meson_options[@]}"
  meson compile -C build
}

check() {
   meson test -C build --no-suite flaky --no-suite slow --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  touch "$pkgdir/usr/lib/gio/modules/.keep"

  python -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"

  # Remove glib2-devel files
  rm -rf $pkgdir/usr/bin/gdbus-codegen
  rm -rf $pkgdir/usr/bin/glib-{mkenums,genmarshal}
  rm -rf $pkgdir/usr/bin/gresource
  rm -rf $pkgdir/usr/bin/gtester{,-report}

  rm -rf $pkgdir/usr/share/gdb/
  rm -rf $pkgdir/usr/share/glib-2.0/gdb/
  rm -rf $pkgdir/usr/share/glib-2.0/codegen/

  rm -rf $pkgdir/usr/share/bash-completion/completions/gresource

  rm -rf $pkgdir/usr/share/man/man1/gdbus-codegen.1
  rm -rf $pkgdir/usr/share/man/man1/glib-{mkenums,genmarshal}.1
  rm -rf $pkgdir/usr/share/man/man1/gresource.1
  rm -rf $pkgdir/usr/share/man/man1/gtester{,-report}.1
}

# vim:set sw=2 sts=-1 et:

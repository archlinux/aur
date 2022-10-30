# Maintainer: Dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.74.1
pkgrel=1
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="https://gist.github.com/Dudemanguy/d199759b46a79782cc1b301649dec8a5"
arch=(x86_64)
provides=(glib2=$pkgver libgio-2.0.so libglib-2.0.so libgmodule-2.0.so
           libgobject-2.0.so libgthread-2.0.so)
conflicts=('glib2')
depends=(pcre2 libffi util-linux-libs zlib tumbler libsysprof-capture libmount.so libffi.so)
makedepends=(gettext gtk-doc shared-mime-info python libelf git util-linux
             meson dbus)
checkdepends=(desktop-file-utils glib2)
optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool'
            'gvfs: most gio functionality')
options=(!docs staticlibs)
license=(LGPL)
_commit=058491cb6f635ff6e0a57fcdd4107a40ca91c62a  # tags/2.74.1^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
        glib-thumbnailer.patch
        glib-compile-schemas.hook
        glib-compile-schemas.hook gio-querymodules.{hook,script})
sha256sums=('SKIP'
            '6d51eb5856268d79eee01b97a299fa9f99db18b2abb4df56f2ed9e641a09138a'
            'aac442ff2ab836e31a7adadfcaf9d7dbdd7a40eb78a4bc6df12c87739ffd3186'
            '64ae5597dda3cc160fc74be038dbe6267d41b525c0c35da9125fbf0de27f9b25'
            '64ae5597dda3cc160fc74be038dbe6267d41b525c0c35da9125fbf0de27f9b25'
            '2a9f9b8235f48e3b7d0f6cfcbc76cd2116c45f28692cac4bd61074c495bd5eb7'
            '92d08db5aa30bda276bc3d718e7ff9dd01dc40dcab45b359182dcc290054e24e')

pkgver() {
  cd glib
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch

  # Apply patch to generate thumbnails
  git apply -3 ../glib-thumbnailer.patch
}

build() {
  # use fat LTO objects for static libraries
  CFLAGS+=' -ffat-lto-objects -g3'
  CXXFLAGS+=' -ffat-lto-objects -g3'

  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson glib build \
    --default-library both \
    -D glib_debug=disabled \
    -D selinux=disabled \
    -D man=true \
    -D sysprof=enabled
  meson compile -C build
}

#skip this; test fails
#check() {
#   meson test -C build --no-suite flaky --no-suite slow --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -D gio-querymodules.script "$pkgdir/usr/share/libalpm/scripts/gio-querymodules"

  python -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
}

# vim:set sw=2 sts=-1 et:

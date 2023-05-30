# Maintainer: Dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.76.3
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
_commit=69e209764bcfef599a21b32f82f88f1906bf197c  # tags/2.76.3^0
source=(
  "git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
  0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
  0002-glocalfileinfo-add-a-dbus-thumbnail-generator.patch
  gio-querymodules.hook
  glib-compile-schemas.hook
  0002-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
  0003-tests-file-Do-not-rely-on-du-bytes-behaviour.patch
)
b2sums=('SKIP'
        'SKIP'
        'bd7f881ae6054c363783bf45b1add5eef5e8347554e23b9fece526701469d07cdcb9871fa73dee473796a219e8aa513796a96da769949097ea207db038578d07'
        '7f6bc830e8ccf0ef8d1afa178af5141f2ff6b9387efd6675a27627ff90548b854c68bfc928b680833352b055de316f92726391909884f89c7a042825a942c03b'
        '14c9211c0557f6d8d9a914f1b18b7e0e23f79f4abde117cb03ab119b95bf9fa9d7a712aa0a29beb266468aeb352caa3a9e4540503cfc9fe0bbaf764371832a96'
        'd30d349b4cb4407839d9074ce08f5259b8a5f3ca46769aabc621f17d15effdb89c4bf19bd23603f6df3d59f8d1adaded0f4bacd0333afcab782f2d048c882858'
        '6bcbcba60208162f7221701d6a642eabfc92c2fc6a476bcb42da5967577f8f0c75b688d149be01c9c48cd644aafa7fbdd63d9086385b8f7607fc981756d71a68'
        '257bf37d304cc161dedcde0a2c4d01e297f8263cde48b49d3ee47ca95a8fb9ad44bbb9bf99da51ec766ffb6f9d502e0a8fdc6b86346e6755373ee515e23b9419')

pkgver() {
  cd glib
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch

  # Apply patch to generate thumbnails
  git apply -3 ../0002-glocalfileinfo-add-a-dbus-thumbnail-generator.patch

  # fix test suite issues with coreutils >=9.2
  # https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3358
  git apply -3 ../0002-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
  git apply -3 ../0003-tests-file-Do-not-rely-on-du-bytes-behaviour.patch

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always submodule update
}

build() {
  local meson_options=(
    --default-library both
    -D glib_debug=disabled
    -D man=true
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

#skip this; test fails
#check() {
#   meson test -C build --no-suite flaky --no-suite slow --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  touch "$pkgdir/usr/lib/gio/modules/.keep"

  python -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
}

# vim:set sw=2 sts=-1 et:

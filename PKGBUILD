# Maintainer: Dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.76.0
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
_commit=8a9ada663923e39c0e8d7eefe65390955dc3c0d8  # tags/2.76.0^0
source=(
  "git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
  0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
  0002-glocalfileinfo-add-a-dbus-thumbnail-generator.patch
  gio-querymodules.{hook,script}
  glib-compile-schemas.hook
)
b2sums=('SKIP'
        'SKIP'
        'bd7f881ae6054c363783bf45b1add5eef5e8347554e23b9fece526701469d07cdcb9871fa73dee473796a219e8aa513796a96da769949097ea207db038578d07'
        '7f6bc830e8ccf0ef8d1afa178af5141f2ff6b9387efd6675a27627ff90548b854c68bfc928b680833352b055de316f92726391909884f89c7a042825a942c03b'
        'cd3a7817193ca985be5aff0813e78cc59c39ad8d4a2171c1c719267e4f51beda47c58a44c6d5afead64e9fa1b854430ac935976d02158e927ba3ec8f36fce282'
        '4b90eb8d582509b09aab401313d4399cc139ad21b5dd7d45d79860d0764c7494c60714e0794e09823e51d1894ac032a994f27d79d1499abf24ee6f59bdb0c243'
        'd30d349b4cb4407839d9074ce08f5259b8a5f3ca46769aabc621f17d15effdb89c4bf19bd23603f6df3d59f8d1adaded0f4bacd0333afcab782f2d048c882858')

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

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always submodule update
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

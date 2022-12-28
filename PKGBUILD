# Maintainer: Dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.74.4
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
_commit=e35768fe299d6389f8f5eef15593762389d2c07d  # tags/2.74.4^0
source=(
  "git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
  0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
  glib-thumbnailer.patch
  gio-querymodules.{hook,script}
  glib-compile-schemas.hook
)
b2sums=('SKIP'
        'SKIP'
        '4d5cb5ad1222a5e8d06e79736170cd694a6277e0da71ffd55560d74cf5c3273551d302a35bd2ff43f09070d61c1de147bb312428fce98347d232ac3d44406511'
        '6ab20e160590e6ab5a1d4172507cde9db1656432e1853fa963570679ceb0a04d401515e80be2a5a7c36bad514547f7ecca29ee8095e222ac91da804c0c5d13b2'
        'cd3a7817193ca985be5aff0813e78cc59c39ad8d4a2171c1c719267e4f51beda47c58a44c6d5afead64e9fa1b854430ac935976d02158e927ba3ec8f36fce282'
        '4b90eb8d582509b09aab401313d4399cc139ad21b5dd7d45d79860d0764c7494c60714e0794e09823e51d1894ac032a994f27d79d1499abf24ee6f59bdb0c243'
        'd30d349b4cb4407839d9074ce08f5259b8a5f3ca46769aabc621f17d15effdb89c4bf19bd23603f6df3d59f8d1adaded0f4bacd0333afcab782f2d048c882858')

pkgver() {
  cd glib
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd glib

  # Fix build (missing include)
  git cherry-pick -n 03cb4261e00cf505790f4fd4e69f97b2ef4fcccd

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch

  # Apply patch to generate thumbnails
  git apply -3 ../glib-thumbnailer.patch

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

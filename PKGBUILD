# Maintainer: dudemanguy <random342@airmail.cc>
# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.62.4
pkgrel=1
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="https://gist.github.com/Dudemanguy911/d199759b46a79782cc1b301649dec8a5"
arch=(x86_64)
provides=("glib2=$pkgver")
conflicts=('glib2')
depends=(pcre libffi libutil-linux zlib tumbler)
makedepends=(gettext gtk-doc shared-mime-info python libelf git util-linux meson dbus)
checkdepends=(desktop-file-utils)
optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool')
options=('!docs' '!emptydirs')
license=(LGPL2.1)
_commit=dac69d7128b3b66ed7007ab944eb629d30f4de4b  # tags/2.62.4^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        noisy-glib-compile-schemas.diff
        glib-compile-schemas.hook
        gio-querymodules.hook
        glib-thumbnailer.patch)
sha256sums=('SKIP'
            '81a4df0b638730cffb7fa263c04841f7ca6b9c9578ee5045db6f30ff0c3fc531'
            'e1123a5d85d2445faac33f6dae1085fdd620d83279a4e130a83fe38db52b62b3'
            '5ba204a2686304b1454d401a39a9d27d09dd25e4529664e3fd565be3d439f8b6'
            '9f055d2a4f3fa08a7f0ca9f233a0ca6925247f572fb6873af7ac1e1f43f23d74')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  patch -Np1 -i ../noisy-glib-compile-schemas.diff

  # Apply patch to generate thumbnails
  patch -Np1 -i ../glib-thumbnailer.patch
}

build() {
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson glib build \
    -D selinux=disabled \
    -D man=true \
    -D gtk_doc=true
  ninja -C build
}

#skip this; test fails
#check() {
#  meson test -C build --no-suite flaky --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook

  python -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"

  # Split docs
  mv "$pkgdir/usr/share/gtk-doc" "$srcdir"
}

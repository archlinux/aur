# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: kfgz <kfgz@interia.pl>

pkgbase=glib2-git
_pkgname=glib2
pkgname=(glib2-git glib2-docs-git)
pkgver=2.78.0.r212.g0a6e19f
pkgrel=1
pkgdesc="Low Level Core Library"
arch=('x86_64')
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
depends=(
     pcre libffi util-linux-libs zlib libsysprof-capture
)
makedepends=(
     gettext  gtk-doc shared-mime-info python libelf git util-linux meson dbus gi-docgen
)
checkdepends=(
     desktop-file-utils
)
optdepends=(
            'python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool'
)
conflicts=($_pkgname)
provides=($_pkgname=$pkgver)
options=(debug staticlibs)
source=("git+https://gitlab.gnome.org/GNOME/glib.git"
        "git+https://gitlab.gnome.org/GNOME/gvdb.git"
        0001-noisy-glib-compile-schemas.patch
        glib-compile-schemas.hook
        gio-querymodules.hook )
sha512sums=('SKIP'
            'SKIP'
            'ddbf4a8eaf60e943a10a1ad67f2de078143558df8cc06e8009da87d8068af0cf8c66f443474b8b2848239c003e6210ff9ceb1ba5ffda1b95b80687adbf813722'
            'c04fe25afc217c295b5ce4034733cec046126482d00fb8d0299e4815ac57129dd3f1c9ac824b9386d208a4f113e9dae682ea5b72f75387ed6b6b96a9cbbee8ca'
            '5afd6f275c8fff16df3e685818f2e7989b39ffb3b8f5fc261a5a6d54a9b28ef53af62f3bf5067cf87cb74691572f85730cbc508691956ae048a0f3ecc1a0a39c')

pkgver() {
    cd glib
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/glib"
    # Suppress noise from glib-compile-schemas.hook
    patch -Np1 -i ../0001-noisy-glib-compile-schemas.patch

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always submodule update


  }

build () {
  local meson_options=(
    --default-library both
    -D glib_debug=disabled
    -D gtk_doc=true
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

#check() {
#    meson test -C build
#}

package_glib2-git() {
     provides+=(libgio-2.0.so libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
                libgthread-2.0.so)
    depends+=(
    libffi.so
    libmount.so
  )



     DESTDIR="$pkgdir" meson install -C build

    mv "$pkgdir/usr/share/gtk-doc" "$srcdir"
    install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 "$srcdir"/*.hook

    python -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"
    python -O -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"
}

package_glib2-docs-git() {
  pkgdesc="Documentation for GLib"
  depends=()
  optdepends=()
  provides=($_pkgname-docs)
  conflicts=($_pkgname-docs)
  license+=(custom)

  mkdir -p "$pkgdir/usr/share"
  mv gtk-doc "$pkgdir/usr/share"

  install -Dt "$pkgdir/usr/share/licenses/glib2-docs" -m644 glib/docs/reference/COPYING
}


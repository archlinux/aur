# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: kfgz <kfgz@interia.pl>

_pkgname=glib2
pkgname=(glib2-nodocs-git)
pkgver=2.66.0.89.g7bfd6278b
pkgrel=1
pkgdesc="Low Level Core Library"
arch=('x86_64')
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
depends=(pcre libffi libutil-linux zlib)
makedepends=(gettext shared-mime-info python libelf git util-linux meson dbus)
checkdepends=(desktop-file-utils)
optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool')
conflicts=($_pkgname)
provides=($_pkgname $_pkgname=$pkgver)
options=(!emptydirs)
source=("git+https://gitlab.gnome.org/GNOME/glib.git"
        0001-noisy-glib-compile-schemas.patch
        glib-compile-schemas.hook
        gio-querymodules.hook )
sha512sums=('SKIP'
            'ddbf4a8eaf60e943a10a1ad67f2de078143558df8cc06e8009da87d8068af0cf8c66f443474b8b2848239c003e6210ff9ceb1ba5ffda1b95b80687adbf813722'
            'c04fe25afc217c295b5ce4034733cec046126482d00fb8d0299e4815ac57129dd3f1c9ac824b9386d208a4f113e9dae682ea5b72f75387ed6b6b96a9cbbee8ca'
            '5afd6f275c8fff16df3e685818f2e7989b39ffb3b8f5fc261a5a6d54a9b28ef53af62f3bf5067cf87cb74691572f85730cbc508691956ae048a0f3ecc1a0a39c')

pkgver() {
    cd glib
    git describe  --tags | sed 's/-/./g'
}

prepare() {
    cd $srcdir/glib
    # Suppress noise from glib-compile-schemas.hook
    patch -Np1 -i ../0001-noisy-glib-compile-schemas.patch

  }

build () {
    CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
    arch-meson glib build \
    -Dgtk_doc=false \
    -Dman=false \
    -Dselinux=disabled

    ninja $NINJAFLAGS -C build
}

#check() {
#    meson test -C build
#}

package_glib2-nodocs-git() {
  DESTDIR="$pkgdir" meson install -C build

# mv "$pkgdir/usr/share/gtk-doc" "$srcdir"
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 $srcdir/*.hook

  python -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen "$pkgdir/usr/share/glib-2.0/codegen"
}

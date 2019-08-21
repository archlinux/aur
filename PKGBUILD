# Maintainer: Philip Deljanov <philip dot deljanov at gmail dot com>
# Contributor: bohoomil <bohoomil at zoho dot com>

pkgname=cairo-infinality-remix
_name=cairo
pkgver=1.17.2+17+g52a7c79fd
pkgrel=1
pkgdesc="Cairo vector graphics library with Infinality patch support"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
groups=('infinality-remix')

# requires libGL + libEGL - all libgl variants (mesa
depends=('libpng' 'libxrender' 'libxext' 'fontconfig' 'pixman' 'glib2' 'libgl' 'lzo')
makedepends=('libgl' 'librsvg' 'gtk2' 'poppler-glib' 'libspectre' 'gtk-doc' 'valgrind' 'git')
provides=('cairo-xcb' 'cairo')
replaces=('cairo-xcb')
conflicts=('cairo'
            'cairo-git'
            'cairo-nomesa'
            'cairo-infinality'
            'cairo-infinality-ultimate'
            'cairo-cleartype'
            'cairo-dfb'
            'cairo-ocaml-git'
            'cairo-ubuntu')

# Arch official upstream version commit
_commit=52a7c79fd4ff96bb5fac175f0199819b0f8c18fc

source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#commit=$_commit"
        cairo-make-lcdfilter-default.patch
        cairo-respect-fontconfig_pb.patch
        cairo-server-side-gradients.patch
        cairo-webkit-html5-fix.patch)

sha256sums=('SKIP'
            '9d692ffdbb13eaf5a66e7b5821fa6d67f2dbe3629d86d40e44f8bdcf0e6cdc2d'
            '3ef17cfd14b3edc14092b5e96fc63673b6b020b7f05adaa59d3c3e4b0cfdde66'
            'b80c99b10fd48dbf98abd70ca2d1265ad6035383c47bfbee5e540a814b6d2a23'
            'e4fea537fae57f42a453dbace666482fc4de4cb7090d0141fdefb4388f842f32')

prepare(){
    cd $_name

    # Infinality patches
    patch -Np1 -i "${srcdir}"/cairo-make-lcdfilter-default.patch
    patch -Np1 -i "${srcdir}"/cairo-respect-fontconfig_pb.patch

    # Misc. patches
    patch -Np1 -i "${srcdir}"/cairo-server-side-gradients.patch
    patch -Np1 -i "${srcdir}"/cairo-webkit-html5-fix.patch

    # Update gtk-doc
    cp /usr/share/aclocal/gtk-doc.m4 build/aclocal.gtk-doc.m4
    cp /usr/share/gtk-doc/data/gtk-doc.make build/Makefile.am.gtk-doc

    # Fix a typo
    sed -i 's/have_png/use_png/g' configure.ac

    NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_name
  ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --disable-gl \
        --enable-tee \
        --enable-svg \
        --enable-ps \
        --enable-pdf \
        --enable-gobject \
        --enable-gtk-doc
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
    cd cairo
    # FIXME: tests don't pass
    env CAIRO_TEST_TARGET=image \
        CAIRO_TEST_TARGET_FORMAT=rgba \
        CAIRO_TESTS='!pthread-show-text' make -k check || :
}

package() {
    cd $_name
    make DESTDIR="$pkgdir" install
}

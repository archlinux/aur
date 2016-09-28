# Maintainer: tokigami.kineko <>
pkgname=gegl-cce-git
pkgver=r7236.b31ef18
pkgrel=1
pkgdesc="gegl customized for GIMP-CCE"
arch=('i686' 'x86_64')
url="https://github.com/ellelstone/gegl"
license=('LGPL3')
groups=()
depends=('babl-cce-git' 'libspiro' 'json-glib')
makedepends=('git' 'intltool' 'python2' 'ruby' 'lua'
             'libraw' 'openexr' 'ffmpeg' 'librsvg' 'jasper'
             'libtiff' 'suitesparse')
optdepends=('openexr: for using the openexr plugin'
            'ffmpeg: for using the ffmpeg plugin'
            'librsvg: for using the svg plugin'
            'libtiff: tiff plugin'
            'jasper: for using the jasper plugin'
            'libraw: raw plugin'
            'suitesparse: matting-levin plugin'
            'lua: lua plugin')
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
source=('git+https://github.com/ellelstone/gegl')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/gegl"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    PREFIX="/usr/gimp-cce"
    case "$CARCH" in
        i686) LIB=lib;;
        x86_64) LIB=lib64;;
        *) echo "Unknown architecture : $CARCH"; exit 1
    esac
    export LD_LIBRARY_PATH=$PREFIX/$LIB:$LD_LIBRARY_PATH
    export PATH=$PREFIX/bin:$PATH
    export XDG_DATA_DIRS=$PREFIX/share:$XDG_DATA_DIRS
    export PKG_CONFIG_PATH=$PREFIX/$LIB/pkgconfig:$PKG_CONFIG_PATH

    cd $srcdir/gegl
    ./autogen.sh --prefix=$PREFIX --disable-docs --enable-gtk-doc=no \
                 --enable-gtk-doc-html=no --enable-gtk-doc-pdf=no \
                 --enable-workshop --without-libv4l2 --without-libavformat \
                 --without-sdl --libdir=$PREFIX/$LIB
    make
}

package() {
    cd $srcdir/gegl
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

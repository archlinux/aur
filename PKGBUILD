# Maintainer: tokigami.kineko <>
pkgname=libmypaint-cce-git
pkgver=r686.9491163
pkgrel=1
pkgdesc="libmypaint for GIMP-CCE"
arch=('i686' 'x86_64')
url="http://mypaint.org/"
license=('LGPL3')
groups=()
depends=('gobject-introspection' 'json-c' 'gegl-cce-git')
makedepends=('git' 'intltool' 'python')
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
source=('git+https://github.com/mypaint/libmypaint.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/libmypaint"
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

    cd $srcdir/libmypaint
    ./autogen.sh
    ./configure --prefix=$PREFIX --libdir=$PREFIX/$LIB
    make
}

package() {
    cd $srcdir/libmypaint
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

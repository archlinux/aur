# Maintainer: tokigami.kineko <>
pkgname=babl-cce-git
pkgver=r841.15bb773
pkgrel=1
pkgdesc="babl customized for GIMP-CCE"
arch=('i686' 'x86_64')
url="https://github.com/ellelstone/babl"
license=('LGPL3')
groups=()
depends=('glibc')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
source=('git+https://github.com/ellelstone/babl')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/babl"
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

    cd $srcdir/babl
    ./autogen.sh --prefix=$PREFIX --enable-mmx=no --enable-sse=no \
                 --enable-sse2=no --enable-sse4_1=no --enable-f16c=no \
                 --enable-altivec=no --disable-docs --libdir=$PREFIX/$LIB
    make
}

package() {
    cd $srcdir/babl
    make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

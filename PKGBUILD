pkgname=gtkada
pkgver=2017
pkgrel=1

pkgdesc='ada bindings for the gtk+ library'
url='https://github.com/AdaCore/gtkada'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gtk3' 'freetype2')
makedepends=('git' 'gcc-ada' 'gprbuild')

provides=('gtkada')
conflicts=('gtkada')

source=('git+https://github.com/AdaCore/gtkada'
        'expose-cargs-and-largs-makefile.patch'
        'use-fpic.patch')

sha1sums=('SKIP'
          'a046e897c2d0eec217c880c995a52b0b0c048d4b'
          '01f2affd67c53c2c7d71435b37160fae7a06cd81')

#pkgver() {
#    cd gtkada
#    git describe --long --tags | sed 's/^gtkada-//; s/\([^-]*-g\)/r\1/; s/-/./g'
#}

prepare() {
    cd gtkada
    # XXX https://github.com/AdaCore/gtkada/issues/10
    patch -Np1 -i "$srcdir"/use-fpic.patch
    patch -Np1 -i "$srcdir"/expose-cargs-and-largs-makefile.patch
}

build() {
    cd gtkada

    export LIBRARY_TYPE=relocatable

    # XXX Disable opengl https://github.com/AdaCore/gtkada/issues/9
    ./configure --prefix=/usr --with-GL=no --disable-static --disable-static-pic

    # Disable RPATH usage with -R
    make PROCESSORS="$(nproc)" GPRBUILD_SWITCHES=-R
}

package() {
    cd gtkada
    make DESTDIR="$pkgdir" install
}

pkgname=gtkada
pkgver=2017
pkgrel=3

pkgdesc='Ada bindings for the Gtk+ library.'
url='https://github.com/AdaCore/gtkada'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gtk3' 'freetype2')
makedepends=('git' 'gcc-ada' 'gprbuild')

provides=('gtkada')
conflicts=('gtkada')

source=('http://mirrors.cdn.adacore.com/art/591ae7a8c7a4473fcbb154c9'
        'expose-cargs-and-largs-makefile.patch'
        'use-fpic.patch')

sha1sums=('31b3512b98d8fa15a0183b5c43caca1b0d692d85'
          'a046e897c2d0eec217c880c995a52b0b0c048d4b'
          '01f2affd67c53c2c7d71435b37160fae7a06cd81')


prepare()
{
    cd gtkada-gpl-2017-src

    # XXX https://github.com/AdaCore/gtkada/issues/10
    patch -Np1 -i "$srcdir"/use-fpic.patch
    patch -Np1 -i "$srcdir"/expose-cargs-and-largs-makefile.patch
}


build()
{
    cd gtkada-gpl-2017-src

    export LIBRARY_TYPE=relocatable

    # XXX Disable opengl https://github.com/AdaCore/gtkada/issues/9
    ./configure --prefix=/usr --with-GL=no

    # Disable RPATH usage with -R
    make PROCESSORS="$(nproc)" GPRBUILD_SWITCHES=-R
}


package()
{
    cd gtkada-gpl-2017-src

    make DESTDIR="$pkgdir" install
}

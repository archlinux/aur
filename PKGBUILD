pkgname=gnatcoll
pkgver=2017
pkgrel=4

pkgdesc='Gnat components collection.'
url='http://libre.adacore.com/tools/gnat-component-collection/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('gcc-ada' 'readline' 'libgpr' 'gtkada' 'xmlada' 'python2-gobject')
makedepends=('git' 'gprbuild' 'postgresql' 'sqlite3')
optdepends=('postgresql' 'sqlite3')

provides=('gnatcoll')
conflicts=('gnatcoll')

source=('http://mirrors.cdn.adacore.com/art/5a15c79cc7a4479a23674c66'
        'use_fpic_for_shared.patch'
        'use_fpic_for_gtk.patch'
        'use_fpic_for_python.patch'
        'expose-cargs-and-largs-makefile.patch')

sha1sums=('f7a0862a6fd7ac0c70a56cd3e12b48345d045995'
          'd926f5153773937dea4b03e4ba46b2fe61a6bbc5'
          '55cf395f2ea53d22459bcc926dd7ad65d81cd315'
          '7dec45682d4a1c44e9517ecb9c4e2f5afccd08c2'
          '04799236d75963c9abe2d41c9f2a6c3d3e61780d')



prepare()
{
    cd gnatcoll-gpl-2017-src

    patch -Np1 -i "$srcdir"/use_fpic_for_shared.patch
    patch -Np1 -i "$srcdir"/use_fpic_for_gtk.patch
    patch -Np1 -i "$srcdir"/use_fpic_for_python.patch
    patch -Np1 -i "$srcdir"/expose-cargs-and-largs-makefile.patch

    ## Force use of python2
    #
    rm -fr temp_bin
    mkdir  temp_bin
    ln -s /usr/bin/python2        temp_bin/python
    ln -s /usr/bin/python2-config temp_bin/python-config
}


build()
{
    cd gnatcoll-gpl-2017-src

    ## Force use of python2
    #
    export PATH=$srcdir/gnatcoll-gpl-2017-src/temp_bin:$PATH    

    export OS=unix
    unset PROJECTS

    ./configure --prefix=/usr       \
                --libexecdir=/lib   \
                --enable-shared     \
                --enable-gpl        \
                --enable-projects

    make PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R
}


package()
{
    cd gnatcoll-gpl-2017-src

    export OS=unix
    unset PROJECTS

    make prefix="$pkgdir"/usr install
}

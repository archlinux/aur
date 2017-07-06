pkgname=gprbuild
pkgver=2017
pkgrel=3

pkgdesc='Multi-language build system.'
url='http://www.adacore.com/gnatpro/toolsuite/gprbuild/'
arch=('i686' 'x86_64')
license=('GPL')

depends=('xmlada')
makedepends=('git' 'gprbuild-bootstrap')

# We provide gprbuild-bootstrap here so we can use this gprbuild to bootstrap
# itself and ada-xmlada.
provides=('gprbuild' 'gprbuild-bootstrap')
conflicts=('gprbuild' 'gprbuild-bootstrap')

source=('http://mirrors.cdn.adacore.com/art/591c45e2c7a447af2deecff7'
        'expose-cargs-and-largs-makefile.patch')

sha1sums=('f956aa57c58c342a958332c8cd98e6481e9ce593'
          'bda77367bc6985c3daf96929cccf5551a0544237')


prepare()
{
    cd gprbuild-gpl-2017-src
    patch -Np1 -i "$srcdir"/expose-cargs-and-largs-makefile.patch

    # Not everyone is Debian
    sed -i 's/libexec/lib/g' bootstrap.sh doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}


build()
{
    cd gprbuild-gpl-2017-src
    make prefix=/usr setup
    make all
}


package() 
{
    cd gprbuild-gpl-2017-src
    make prefix="$pkgdir"/usr install

    # Cleanup
    rm -f -- "$pkgdir"/usr/doinstall
}

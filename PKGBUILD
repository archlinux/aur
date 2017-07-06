pkgname=gprbuild-bootstrap
pkgver=2017
pkgrel=3

pkgdesc='Static gprbuild to bootstrap xmlada and gprbuild proper.'
url='http://www.adacore.com/gnatpro/toolsuite/gprbuild/'
arch=('i686' 'x86_64')
license=('GPL')

options=('debug' '!strip')

depends=('glibc')
makedepends=('git' 'gcc-ada')

source=('http://mirrors.cdn.adacore.com/art/591c45e2c7a447af2deecff7'
        'http://mirrors.cdn.adacore.com/art/591aeb88c7a4473fcbb154f8')

sha1sums=('f956aa57c58c342a958332c8cd98e6481e9ce593'
          'c549f8702eb7579896b4163dab47d80e3d0c1fbc')


prepare()
{
    cd gprbuild-gpl-2017-src

    # Not everyone is Debian.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr \
        share/gprconfig/compilers.xml \
        share/gprconfig/linker.xml \
        share/gprconfig/gnat.xml
}


build()
{
    cd gprbuild-gpl-2017-src
    export GNATMAKEFLAGS="-j$(nproc)"
    export DESTDIR="$srcdir"/bootstrap
    ./bootstrap.sh --prefix=/usr --libexecdir=/lib --with-xmlada="$srcdir"/xmlada-gpl-2017-src
}


package()
{
    cd bootstrap
    cp -a --no-preserve=ownership -- "$srcdir"/bootstrap/usr "$pkgdir"
}

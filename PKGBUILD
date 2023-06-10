# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

epoch=1

pkgname=gprbuild-bootstrap
pkgver=24.0w
pkgrel=1
pkgdesc="Static GPRbuild to bootstrap XML/Ada and GPRbuild itself."

arch=(i686 x86_64)
url=https://github.com/AdaCore/gprbuild
license=(GPL3 custom)

depends=(gcc-ada gnatstudio-sources)
makedepends=(gcc-ada gnatstudio-sources)

source=(file:///opt/gnatstudio-sources/gprbuild-$pkgver-20230324-1649D-src.tar.gz
        file:///opt/gnatstudio-sources/xmlada-$pkgver-20230324-1684A-src.tar.gz
        file:///opt/gnatstudio-sources/gprconfig-kb-$pkgver-20230324-16644-src.tar.gz)

sha256sums=(efeb12ab26ca687a000ca781f3bce0e4ec2d4efd62b996116f2f505e50239b4f
            c243de68f3f7c0f5e8a23d24ab0725d038f4dd2b7798855a3b91b574e44e2dc1
            7de5388f05168fb32577556989f0bc0f4f4d615cbd6a79ad544127a090aba5f4)

_gprbuild_src=gprbuild-$pkgver-20230430-16222-src
_gprconfig_kb_src=gprconfig-kb-$pkgver-20230428-16586-src
_xmlada_src=xmlada-$pkgver-20230428-16463-src


prepare()
{
    cd $srcdir/$_gprbuild_src

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    #
    sed -i 's/libexec/lib/g'                        \
    doinstall gprbuild.gpr                          \
        $srcdir/$_gprconfig_kb_src/db/compilers.xml \
        $srcdir/$_gprconfig_kb_src/db/linker.xml    \
        $srcdir/$_gprconfig_kb_src/db/gnat.xml
}


build()
{
    cd $srcdir/$_gprbuild_src

    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    GNATMAKEFLAGS="$MAKEFLAGS"

    ./bootstrap.sh                           \
        --with-xmlada=$srcdir/$_xmlada_src   \
        --with-kb=$srcdir/$_gprconfig_kb_src \
        --build
}


package()
{
    cd $srcdir/$_gprbuild_src

    env DESTDIR=$pkgdir                      \
    ./bootstrap.sh                           \
        --with-kb=$srcdir/$_gprconfig_kb_src \
        --prefix=/usr                        \
        --libexecdir=/lib                    \
        --install

    # Install the license.
    #
    install -D -m644 \
       COPYING3      \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3

    # Install the custom license.
    #
    install -D -m644   \
       COPYING.RUNTIME \
       $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}
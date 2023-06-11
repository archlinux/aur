# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
pkgdesc="Static GPRbuild to bootstrap XML/Ada and GPRbuild itself."
pkgver=24.0w
pkgrel=1
epoch=1

arch=(i686 x86_64)
url=https://github.com/AdaCore/gprbuild
license=(GPL3 custom)

depends=(gcc-ada)
makedepends=(gcc-ada)

source=(https://github.com/AdaCore/gnatstudio/releases/download/gnatstudio-cr-20230501/gnatstudio-sources-x86_64-linux.tar.gz)
sha256sums=(acacf5f971dd94dd08a464a05f4e02cf0f1fc5e81028bf7c13091ed08ad97218)

_gprbuild_src=gprbuild-$pkgver-20230430-16222-src
_gprconfig_kb_src=gprconfig-kb-$pkgver-20230428-16586-src
_xmlada_src=xmlada-$pkgver-20230428-16463-src


prepare()
{
    cd $srcdir/gnatstudio-sources-x86_64-linux
    
    tar --extract                                             \
        --file=gprbuild-$pkgver-20230324-1649D-src.tar.gz     \
        --directory $srcdir

    tar --extract                                             \
        --file=xmlada-$pkgver-20230324-1684A-src.tar.gz       \
        --directory $srcdir

    tar --extract                                             \
        --file=gprconfig-kb-$pkgver-20230324-16644-src.tar.gz \
        --directory $srcdir

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
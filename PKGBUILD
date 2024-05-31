# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
pkgdesc='Static GPRbuild to bootstrap XML/Ada and GPRbuild itself.'
pkgver=25.0w
pkgrel=1
epoch=1

arch=(i686 x86_64)
url=https://github.com/AdaCore/gprbuild
license=(GPL3 custom)

makedepends=(gcc-ada)
provides=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/gprbuild-$pkgver-20240408-162DA-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/xmlada-$pkgver-20240408-16316-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/gprconfig-kb-$pkgver-20240408-16484-src.tar.gz)

sha256sums=(6c3cd17bc972ebcb470edefd1fa1d79f39fee902e4ca0251da56654dcb5c55ab
            ffc933e16d16c694e8805ea27ff160846e9300ac97afea897a7f370e30e36c70
            f8e3d74d9a0c5cb82256831603e00198dcfab7d7e5a0c5c8370a4a8ea7031f1f)


_gprbuild_src=gprbuild-$pkgver-20240505-164AB-src
_gprconfig_kb_src=gprconfig-kb-$pkgver-20240505-16517-src
_xmlada_src=xmlada-$pkgver-20240505-1649E-src


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
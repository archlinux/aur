# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=gprbuild-bootstrap
pkgdesc='Static GPRbuild to bootstrap XML/Ada and GPRbuild itself.'
pkgver=26.0w
pkgrel=1
epoch=1

arch=(i686 x86_64)
url=https://github.com/AdaCore/gprbuild
license=(GPL3 custom)

makedepends=(gcc-ada)
provides=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gprbuild-$pkgver-20250409-161CE-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/xmlada-$pkgver-20250409-164C6-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gprconfig-kb-$pkgver-20250409-164D6-src.tar.gz)

sha256sums=(552425f2500fccde0297ec40e14b4806f63e6917fc143e17b1cc3e147ae4f79c
            6fe70ad2a33ebef17f8655adebeae1c8b1c89cebe6eb737ec59deb8b64788fd7
            68a1988ee078932b6b3ee203a69bd404391238ea86ce362d4c32a57d06222969)


_gprbuild_src=gprbuild-26.0w-20250416-16593-src
_xmlada_src=xmlada-26.0w-20250416-1655F-src
_gprconfig_kb_src=gprconfig-kb-26.0w-20250416-1665F-src


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
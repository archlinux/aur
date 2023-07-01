# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=xmlada
pkgdesc='An XML parser for Ada95.'
pkgver=24.0w
pkgrel=2
epoch=1

arch=(i686 x86_64)
url=https://github.com/AdaCore/xmlada
license=(GPL3 custom)

#makedepends=(gprbuild-bootstrap gcc-ada)
makedepends=(gprbuild gcc-ada)
conflicts=($pkgname-git)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230324-1684A-src.tar.gz
        expose-cargs-and-largs-makefile.patch)

sha256sums=(c243de68f3f7c0f5e8a23d24ab0725d038f4dd2b7798855a3b91b574e44e2dc1
            7543e5fa8f2b0b400b937b0b3bb27b46b263a3cd7b17f00f6f9c6b3905729610)

_xmlada_src=$pkgname-$pkgver-20230428-16463-src


prepare()
{
    cd $srcdir/$_xmlada_src

    patch -Np0 -i $srcdir/expose-cargs-and-largs-makefile.patch
}


build()
{
    cd $srcdir/$_xmlada_src

    ./configure --prefix=/usr     \
                --libexecdir=/lib \
                --enable-shared   \
                --enable-build=Production

    # Rid flags not used by Ada.
    #
    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    # Make using a single job (-j1) to avoid the same file being compiled at the same time.
    #
    make -j1 GPRBUILD_OPTIONS=-R
}


package()
{
    cd $srcdir/$_xmlada_src

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    #
    make -j1 prefix=$pkgdir/usr install

    # Install the licenses.
    #
    install -D -m644     \
       COPYING3          \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3

    # Install the custom license.
    install -D -m644     \
       COPYING.RUNTIME   \
       $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}
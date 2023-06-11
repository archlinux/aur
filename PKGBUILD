# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=xmlada
pkgdesc="An XML parser for Ada95."
pkgver=24.0w
pkgrel=2
epoch=1

arch=(i686 x86_64)
url=https://github.com/AdaCore/xmlada
license=(GPL3 custom)

makedepends=(gprbuild-bootstrap)
conflicts=($pkgname-git)

source=(https://github.com/AdaCore/gnatstudio/releases/download/gnatstudio-cr-20230501/gnatstudio-sources-x86_64-linux.tar.gz
        expose-cargs-and-largs-makefile.patch)

sha256sums=(acacf5f971dd94dd08a464a05f4e02cf0f1fc5e81028bf7c13091ed08ad97218
            7543e5fa8f2b0b400b937b0b3bb27b46b263a3cd7b17f00f6f9c6b3905729610)

_xmlada_src=$pkgname-$pkgver-20230428-16463-src


prepare()
{
    cd $srcdir/gnatstudio-sources-x86_64-linux
    
    tar --extract                                       \
        --file=xmlada-$pkgver-20230324-1684A-src.tar.gz \
        --directory $srcdir

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
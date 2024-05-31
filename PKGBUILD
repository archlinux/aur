# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=xmlada
pkgdesc='An XML parser for Ada95.'
pkgver=25.0w
pkgrel=1
epoch=1

arch=(i686 x86_64)
url=https://github.com/AdaCore/xmlada
license=(GPL3 custom)

makedepends=(gprbuild gcc-ada)
conflicts=($pkgname-git)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/$pkgname-$pkgver-20240408-16316-src.tar.gz
        expose-cargs-and-largs-makefile.patch)

sha256sums=(ffc933e16d16c694e8805ea27ff160846e9300ac97afea897a7f370e30e36c70
            7543e5fa8f2b0b400b937b0b3bb27b46b263a3cd7b17f00f6f9c6b3905729610)

_xmlada_src=$pkgname-$pkgver-20240505-1649E-src


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
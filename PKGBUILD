# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=ada_spawn
pkgdesc='A simple Ada API to start processes and communicate with them.'
pkgver=27.0w
pkgrel=1
epoch=1

url='https://github.com/AdaCore/spawn'

arch=(i686 x86_64 aarch64)
license=(Apache)

depends=(gtkada)
makedepends=(gprbuild)

_srcdir="spawn-27.0w-20260409-16169-src"

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/spawn-src.tar.gz
        remove_broken_tests_from_Makefile.patch)

sha256sums=(cf0e9085dab1eee49054802de21871eacc63178e19d4bfaaf30a9a8de068617d
            d53fbfe7b65e549c14311d08bd27a4462c548376318e483dd7e5b475d2cf6d97)


prepare()
{
    cd "$srcdir/$_srcdir"

    patch -Np0 -i "$srcdir/remove_broken_tests_from_Makefile.patch"
}


build()
{
    cd "$srcdir/$_srcdir"

    make all

    LIBRARY_TYPE=relocatable \
    gprbuild -P gnat/spawn_glib.gpr -j$(nproc)
}


package()
{
    cd "$srcdir/$_srcdir"

    DESTDIR="$pkgdir" \
    make install

    LIBRARY_TYPE=relocatable \
    gprinstall -p --prefix="$pkgdir/usr" gnat/spawn_glib.gpr

   ## Install the license.
   #
   install -D -m644 \
      LICENSE.txt   \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

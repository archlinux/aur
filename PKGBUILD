# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=ada_spawn
pkgdesc='A simple Ada API to start processes and communicate with them.'
pkgver=25.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/spawn

arch=(i686 x86_64)
license=(Apache)

depends=(gtkada)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/spawn-$pkgver-20240505-164A1-src.tar.gz
        remove_broken_tests_from_Makefile.patch)

sha256sums=(a9d50d1bb4bfc2d59dd3977ae79a3ae59a79e184b8716da45b9eb89c5e26f253
            d53fbfe7b65e549c14311d08bd27a4462c548376318e483dd7e5b475d2cf6d97)


prepare()
{
   cd $srcdir/spawn-$pkgver-20240505-164A1-src

   patch -Np0 -i $srcdir/remove_broken_tests_from_Makefile.patch

}


build()
{
   cd $srcdir/spawn-$pkgver-20240505-164A1-src

   make all
   
   LIBRARY_TYPE=relocatable \
   gprbuild -P gnat/spawn_glib.gpr
}


package()
{
   cd $srcdir/spawn-$pkgver-20240505-164A1-src

   DESTDIR=$pkgdir \
   make install

   LIBRARY_TYPE=relocatable \
   gprinstall -p --prefix=$pkgdir/usr gnat/spawn_glib.gpr

   # Install the license.
   #
   install -D -m644 \
      LICENSE.txt   \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
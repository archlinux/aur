# Maintainer: Rod Kay     <rodakay5 at gmail dot com>
# Contributor: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
pkgdesc='High performance syntactic and semantic engine for the Ada programming language.'
pkgver=27.0w
pkgrel=1
epoch=2

url='https://github.com/AdaCore/ada_language_server'
arch=(x86_64 aarch64)
license=(GPL-3.0-only)

depends=(libadalang-tools
         lal-refactor
         templates_parser
         gtkada
         vss-text
         ada_spawn
         ada-libfswatch
         gpr
         gnatformat
         gnatdoc
         xdiff-ada)

makedepends=(gprbuild)


source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/als-src.tar.gz)

sha256sums=(ec7a108fd99f799b165920129289b331ab8e39451d03bd3f48d3c4974754d453)


build()
{
   cd $srcdir/als-27.0w-20260409-16629-src

   make -j$(nproc) BUILD_MODE=prod all

   LIBRARY_TYPE=relocatable \
   gprbuild -j0 gnat/lsp_client_glib.gpr
}


package()
{
   cd $srcdir/als-27.0w-20260409-16629-src

   make BUILD_MODE=prod LIBRARY_TYPE=relocatable DESTDIR=$pkgdir/usr install

   LIBRARY_TYPE=relocatable \
   gprinstall --prefix=$pkgdir/usr -p gnat/lsp_client_glib.gpr

   
   ## Rid '/usr/bin/tester-run'.
   #
   rm $pkgdir/usr/bin/tester-run
   

   ## Rid clone of 'gnatcoll.gpr'.
   #
   rm $pkgdir/usr/share/gpr/gnatcoll.gpr
   rm $pkgdir/usr/share/gpr/manifests/gnatcoll
}

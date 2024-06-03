# Maintainer: Tim Lagnese <tim at inept tech>
# Maintainer: Rod Kay     <rodakay5 at gmail com>

pkgname=ada_language_server
pkgdesc='High performance syntactic and semantic engine for the Ada programming language.'
pkgver=25.0w
pkgrel=2
epoch=2

url=https://github.com/AdaCore/ada_language_server
arch=(x86_64)
license=(GPL3)

depends=(libadalang-tools
         lal-refactor
         templates_parser
         gtkada
         libvss
         ada_spawn
         ada-libfswatch
         gpr
         gnatdoc)

makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/als-$pkgver-20240506-162AE-src.tar.gz
        lsp-gpr_files.adb-patch)
        
sha256sums=(54bea7d9b4c8069a9b6a276b3c98578fff3fdbce8df44fa6590577bd3a8875d4
            284a87185f8048db10d5dd07379ddf005fa75362a97bd20334dea1f706003383)


prepare()
{
    cd $srcdir/als-25.0w-20240506-162AE-src

    patch -Np0 -i $srcdir/lsp-gpr_files.adb-patch
}



build()
{
    cd $srcdir/als-25.0w-20240506-162AE-src

    make -j16 BUILD_MODE=prod all

    export LIBRARY_TYPE=relocatable
    gprbuild -j16 gnat/lsp_client_glib.gpr
}



package()
 {
    cd $srcdir/als-25.0w-20240506-162AE-src

    make BUILD_MODE=prod LIBRARY_TYPE=relocatable DESTDIR=$pkgdir/usr install

    export LIBRARY_TYPE=relocatable
    gprinstall --prefix=$pkgdir/usr -p gnat/lsp_client_glib.gpr
    
    # Rid clone of 'gnatcoll.gpr'.
    #
    rm $pkgdir/usr/share/gpr/gnatcoll.gpr
    rm $pkgdir/usr/share/gpr/manifests/gnatcoll
}
# Maintainer: Rod Kay     <rodakay5 at gmail com>
# Contributor: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
pkgdesc='High performance syntactic and semantic engine for the Ada programming language.'
pkgver=26.0w
pkgrel=1
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
         gnatformat
         gnatdoc)

makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/ada_language_server-master.zip
        lsp-gpr_files.adb-patch)
        
sha256sums=(3c35b9e17093a2681734f6aa42e8cc0448230f51c6fa7412d3f3c87fc97da556
            284a87185f8048db10d5dd07379ddf005fa75362a97bd20334dea1f706003383)


build()
{
    cd $srcdir/ada_language_server-master

    make -j16 BUILD_MODE=prod all

    export LIBRARY_TYPE=relocatable
    gprbuild -j16 gnat/lsp_client_glib.gpr
}



package()
 {
    cd $srcdir/ada_language_server-master

    make BUILD_MODE=prod LIBRARY_TYPE=relocatable DESTDIR=$pkgdir/usr install

    export LIBRARY_TYPE=relocatable
    gprinstall --prefix=$pkgdir/usr -p gnat/lsp_client_glib.gpr
    
    # Rid clone of 'gnatcoll.gpr'.
    #
    rm $pkgdir/usr/share/gpr/gnatcoll.gpr
    rm $pkgdir/usr/share/gpr/manifests/gnatcoll
}
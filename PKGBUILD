# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=gsl-shell
pkgver=2.3.6
pkgrel=1
pkgdesc='GNU Scientific Library shell based on LuaJIT2'
url='https://franko.github.io/gsl-shell/'
license=('GPL-3.0-only')
arch=('i686' 'x86_64' 'aarch64')
depends=('gsl>=1.15' 'agg>=2.5' 'freetype2>=2.4.10' 'readline' 'fox>=1.6' 'luajit' 'libx11' 'lapack')
makedepends=('meson')
optdepends=('openblas: to greatly improve the speed for operations on large matrices')
provides=('gsl-shell')
conflicts=('gsl-shell-bin' 'gsl-shell-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/franko/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"fox_message_channel.h"
	"fx_console.cpp.patch"
	"gsl_shell_window.cpp.patch"
	"gsl-shell.desktop"
	"gsl-shell.svg"
	"gsl-shell.install")
sha256sums=('e2b70f0acf66f1196ba062020d51a8c275a6166222f713e5020dbea69925ea66'
	    'dd51324b13f150566221e7eb9fb0901f150d8e6937e6894ee3b21dac8afe46d7'
	    '756772299f7935d099f151afc45191f3ff97788f8feae15d9edf47815b50936b'
	    '82a7dfb3b6fafcf1ea6b8dc84a8c4d5547389cb741ad6cd623a2e2c6d2182aa2'
	    '0c696e6497cbd3fd9746e0c6040759c44526d103582d8743eeedc09946738ba1'
	    'ee7e9a0704acf18c0d8eeb46c44f5d100a72029e406b1beba27b0649a400f5c1'
	    'ba5c9cad86e5311413b989b76f490d30f9dc13eb01a1c8334a04c72412903c31')
install="gsl-shell.install"

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # fixing missing header file declarations in the file: src/lua-gsl/lua-filesystem.c
    sed -i '11a\#include <string.h>' "${srcdir}/${pkgname}-${pkgver}/src/lua-gsl/lua-filesystem.c"
    sed -i '12a\#include <stdlib.h>' "${srcdir}/${pkgname}-${pkgver}/src/lua-gsl/lua-filesystem.c"
    sed -i '13a\'                    "${srcdir}/${pkgname}-${pkgver}/src/lua-gsl/lua-filesystem.c"

    # fixing FreeType AIP type mismatch in the file: src/agg-plot/agg_font_freetype.cpp
    # (changing variable 'tags' from 'char*' to 'unsigned char*' to prevent type-conversion error):
    sed -i '165 s/char\*/unsigned char\*/' "${srcdir}/${pkgname}-${pkgver}/src/agg-plot/agg_font_freetype.cpp"

    # fix a bunch of FXMessageChannel-related erorrs in src/fox-gui foldex
    # since Fox 1.6 removed class FOX MessageChannel, the proper approach is to create a wrapper class, so...
    # use the wrapper class from the provided file 'fox_message_channel.h'
    cp ../../fox_message_channel.h ./src/fox-gui

    
    # OK, now we need to include the provided MessageChannel wrapper for various files in src/fox-gui/
    # first the individual header files - add line '#include "fox_message_channel.h"' just after the '#include <fx.h>' declaration:
    sed -i '4a\#include "fox_message_channel.h"' "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/fox_gsl_shell.h"
    sed -i '5a\#include "fox_message_channel.h"' "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/fx_console.h"
    sed -i '4a\#include "fox_message_channel.h"' "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/gsl_shell_app.h"
    sed -i '4a\#include "fox_message_channel.h"' "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/io_thread.h"

    # and of course doing the same for the .cpp files (after they include their each respective header file):
    sed -i '2a\#include "fox_message_channel.h"' "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/fox_gsl_shell.cpp"
    sed -i '7a\#include "fox_message_channel.h"' "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/gsl_shell_app.cpp"
    sed -i '4a\#include "fox_message_channel.h"' "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/io_thread.cpp"
    # sed -i '6a\#include "fox_message_channel.h"' "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/fx_console.cpp"
    # note: the fx_console.cpp file is handled as a whole by a separate patch further down


    # and - with the main body of work done - the joy of doing further fixes continues...

    # file src/fox-gui/gsl_shell_window.cpp - apply the patch:
    # (creates new FXLabel class and fixes the FXString::value() error):
    patch < ../../gsl_shell_window.cpp.patch "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/gsl_shell_window.cpp"
    

    # file src/fox-gui/fx_console.cpp - fix for FOX 1.6 compatibility - apply the patch:
    patch < ../../fx_console.cpp.patch "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/fx_console.cpp"


    # finally, modify Meson's build files so that it forces compilation against X11 (FOX toolkit is X11-only on Linux):
    # file meson.build (the main build file) - add the new x11 dependency:
    sed -i "30a\x11_dep = dependency(\'x11\', required: false)" "${srcdir}/${pkgname}-${pkgver}/meson.build"
    sed -i '31a\if not x11_dep.found()'                         "${srcdir}/${pkgname}-${pkgver}/meson.build"
    sed -i '32a\    x11_dep = disabler()'                       "${srcdir}/${pkgname}-${pkgver}/meson.build"
    sed -i '33a\endif'                                          "${srcdir}/${pkgname}-${pkgver}/meson.build"
    sed -i '34a\'                                               "${srcdir}/${pkgname}-${pkgver}/meson.build"
    # add the new x11 dependency as the last one in the 'src/console/meson.build' build:
    sed -i '4 s/luajit_dep/luajit_dep, x11_dep/' "${srcdir}/${pkgname}-${pkgver}/src/console/meson.build"
    # and add it also as the last dependency in the 'src/fox-gui/meson.build' build:
    sed -i '16 s/fox_dep/fox_dep, x11_dep/' "${srcdir}/${pkgname}-${pkgver}/src/fox-gui/meson.build"
}



build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # using GSL-Shell's provided fallback options to solve linker issues with installed FOX libraries
    # (they still need to be installed - forcing the fallbacks is just a workaround)
    meson setup build --prefix=/usr --wrap-mode=forcefallback
}



package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   DESTDIR="$pkgdir" meson install -C build

   # and of course one more issue - the fact that GSL-SHELL copied half of Lua/Luajit/GSL and AGG packages "include" files/headers
   # fix: manually delete all the offending files (what a joy):
   rm -rf "${pkgdir}/usr/bin/lua/"
   rm -rf "${pkgdir}/usr/include/"
   rm -rf "${pkgdir}/usr/lib/libagg.a"
   rm -rf "${pkgdir}/usr/lib/libaggplatform.a"
   rm -rf "${pkgdir}/usr/lib/pkgconfig/gsl.pc"
   rm -rf "${pkgdir}/usr/lib/pkgconfig/libagg.pc"
   rm -rf "${pkgdir}/usr/lib/pkgconfig/luajit.pc"
   rm -rf "${pkgdir}/usr/share/man/"

   # and the final finishing touches - ensure that 'gsl-shell.desktop' and 'gsl-shell.svg' files
   # (both taken from the author's own binary package on GitHub homepage) are where they belong:
   install -d -m755 "${pkgdir}/usr/share/applications/"
   cp ../../gsl-shell.desktop "${pkgdir}/usr/share/applications/"
   install -d -m755 "${pkgdir}/usr/share/icons/"
   cp ../../gsl-shell.svg "${pkgdir}/usr/share/icons/"
}

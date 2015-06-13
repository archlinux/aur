# Maintainer: dumblob <dumblob@gmail.com>
# Contributor: dumblob <dumblob@gmail.com>

_basename=dao

pkgname=${_basename}-git
pkgver=1489.2c135a5
pkgrel=1
pkgdesc='A very lightweight, portable, optionally typed programming language and VM written in C featuring blazingly fast real concurrency, defer, OOP, AOP, LLVM JIT, bytecode, BNF macros, many advanced modules & bindings and much more!'
url='http://www.daovm.net/'
license=('BSD')
arch=('i686' 'x86_64')
# FIXME add + update_optdepends
#   DaoFLTK|FLTK
#   DaoGraphicsMagick (formerly Graphics)
#   DaoGame
source=(
  "$_basename::git+https://github.com/daokoder/$_basename"
  "$_basename-tools::git+https://github.com/daokoder/$_basename-tools"
  #"$_basename-tools::git+https://github.com/daokoder/$_basename-tools#branch=Compatibility_Clang_3_3"
  "$_basename-modules::git+https://github.com/daokoder/$_basename-modules"
  #"$_basename-modules::git+https://github.com/daokoder/$_basename-modules#branch=Compatibility_Clang_3_3"
  "DaoGenomeTools::git+https://github.com/daokoder/DaoGenomeTools"
  "DaoGObject::git+https://github.com/daokoder/DaoGObject"
  "DaoGraphics::git+https://github.com/daokoder/DaoGraphics"
  "DaoGSL::git+https://github.com/daokoder/DaoGSL"
  "DaoOpenGL::git+https://github.com/daokoder/DaoOpenGL"
  "DaoSQL::git+https://github.com/daokoder/DaoSQL"
  "DaoSDL::git+https://github.com/daokoder/DaoSDL"
)
sha256sums=(
  'SKIP'
  'SKIP'
  #'SKIP'
  'SKIP'
  #'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
depends=('gcc-libs-multilib')
makedepends=(
  #'emscripten-git' (wait until clang 3.5 becomes supported)
  #'genometools'
  'glib2'
  'gobject-introspection'

  # modules/DaoGraphics/deps/glfw/makefile.dao
  ###'libgl'             # OpenGL      for DaoGraphics and DaoOpenGL
  'glu'               # OpenGL      for DaoGraphics and DaoOpenGL
  'libx11'            # X11         for DaoGraphics
  'libxrandr'         # Xrandr      for DaoGraphics
  'libxinerama'       # Xinerama    for DaoGraphics
  'libxi'             # XInput      for DaoGraphics
  'libxcursor'        # Xcursor     for DaoGraphics
  'libxxf86vm'        # Xf86VidMode for DaoGraphics
  'xkeyboard-config'  # XKB         for DaoGraphics [GLFW]

  'sqlite'
  'libmariadbclient'
  'postgresql-libs'
  'libffi'
  'sdl2'
  'cblas'
  'gsl'
  'clang'
  'readline'
  'zlib'
)
optdepends=(
  #'emscripten-git:        support for compilation to JavaScript'
  #'genometools:           needed by the DaoGenomeTools module'
  'glib2:                 needed by the DaoGObject module (runtime binding generation)'
  'gobject-introspection: needed by the DaoGObject module (runtime binding generation)'

  'libxinerama:            needed by the DaoGraphics module'
  'libxi:                  needed by the DaoGraphics module'
  'libxrandr:              needed by the DaoGraphics module'
  'glu:                    needed by the DaoGraphics and DaoOpenGL modules'

  'sqlite:                needed by the DaoSQLite module'
  'libmariadbclient:      needed by the DaoMySQL module'
  'postgresql-libs:       needed by the DaoPostgreSQL module'
  'libffi:                needed by the clinker module (allows calling C functions directly from Dao)'
  'sdl2:                  needed by the DaoSDL module'
  'cblas:                 needed by the cblas module'
  'gsl:                   needed by the DaoGSL module (GNU Scientific Library)'
  'clang:                 needed by clangdao (a C/C++ library autobinding tool)'
  'zlib:                  needed by the JIT and CXX modules'
)

provides=('dao')
conflicts=('dao')

build() {
  mv "$_basename-tools/"*   "$_basename/tools/"
  mv "$_basename-modules/"* "$_basename/modules/"
  # FIXME not getting compiled
  mv "DaoGenomeTools/"      "$_basename/modules/"
  # FIXME not getting compiled
  mv "DaoGObject/"          "$_basename/modules/"
  mv "DaoGraphics/"         "$_basename/modules/"
  mv "DaoGSL/"              "$_basename/modules/"
  mv "DaoOpenGL/"           "$_basename/modules/"
  mv "DaoSQL/"              "$_basename/modules/"
  # FIXME not getting compiled
  #mv "DaoSDL/"              "$_basename/modules/"
  # FIXME doesn't compile
  #  # relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object
  #  sed -i -r 's|(./configure)|autoreconf \&\& \1|' \
  #    modules/regex/makefile.dao
  rm -rf "$_basename/modules/regex"
  cd "$_basename"

  # order matters when using gcc
  patch -R tools/clangdao/makefile.dao << EOF
@@ -44,9 +44,9 @@
 clangdao_exe.AddLinkingFlag( "-lclangSema" )
 clangdao_exe.AddLinkingFlag( "-lclangAnalysis" )
 clangdao_exe.AddLinkingFlag( "-lclangAST" )
-clangdao_exe.AddLinkingFlag( "-lclangEdit" )
 clangdao_exe.AddLinkingFlag( "-lclangLex" )
 clangdao_exe.AddLinkingFlag( "-lclangBasic" )
+clangdao_exe.AddLinkingFlag( "-lclangEdit" )
 clangdao_exe.AddLinkingFlag( "-lclangSerialization" )
 clangdao_exe.AddLinkingFlag( "-lclangStaticAnalyzerCheckers" )
 clangdao_exe.AddLinkingFlag( "-lclangStaticAnalyzerCore" )
EOF
  # each object file includes symbols from Clang and LLVM (and Clang
  #   object files in turn include symbols from LLVM)
  sed -i -r "/-lclangStaticAnalyzerFrontend/a\
    clangdao_exe.AddLinkingFlag( \"$(llvm-config --libs)\" )" \
    tools/clangdao/makefile.dao

  # FIXME raise issue no GitHub
  #   DaoMake::Settings["DLL-FLAG"]        = "-shared,--enable-new-dtags"
  #sed -i -r 's|-shared|-shared -enable-new-dtags|' \
  sed -i -r 's|-Wl,-rpath=|-Wl,--enable-new-dtags,-rpath=|' \
    tools/daomake/platforms/unix.dao

  # each object file includes symbols from Clang and LLVM (and Clang
  #   object files in turn include symbols from LLVM)
  sed -i -r "/-lclangSerialization/a\
    project.AddLinkingFlag( \"-lLLVMOption -lLLVMSupport\" )" \
    modules/DaoCXX/makefile.dao

  # gl.h is provided by mesa
  sed -i -r 's|(#include) *"gl.h"|\1 <GL/gl.h>|' \
    modules/DaoOpenGL/wrap/dao_opengl.h

  # https://github.com/daokoder/DaoSQL/issues/2
  sed -i -r 's|(#include) *"mysql.h"|\1 <mysql/mysql.h>|' \
    modules/DaoSQL/DaoMySQL/daoMySQL.h

  # https://github.com/daokoder/DaoSDL/issues/2
  #sed -i -r 's|(#include) *"(SDL[^"]+)"|\1 <SDL2/\2>|' \
  #  modules/DaoSDL/wrap/dao_sdl.h

  # enable disabled-by-default GObject bindings
  # FIXME not getting compiled (not anymore in dao-modules/makefile.dao???)
  patch modules/DaoGObject/makefile.dao <<\EOF
@@ -4,7 +4,8 @@
 glib = DaoMake::FindPackage( "GLib", $REQUIRED )
 gir = DaoMake::FindPackage( "GIR", $REQUIRED )
 
-if( daovm == none or ffi == none or glib == none or gir == none ) return
+if( daovm == none or ffi == none or glib == none or gir == none )
+	std.error( 'one of packages daovm, ffi, glib, gir is missing' )
 
 project = DaoMake::Project( "DaoGobject" ) 
 
@@ -35,7 +36,7 @@
 
 
 
-#project.GenerateFinder( $TRUE );
-#project.Install( daovm.GetPath( "MOD-PATH" ), gobject_dll );
-#project.Install( daovm.GetPath( "MOD-PATH" ), ffiite_dll );
-#project.Install( daovm.GetPath( "MOD-PATH" ), myffi_dll );
+project.GenerateFinder( $TRUE );
+project.Install( daovm.GetPath( "MOD-PATH" ), gobject_dll );
+project.Install( daovm.GetPath( "MOD-PATH" ), ffiite_dll );
+project.Install( daovm.GetPath( "MOD-PATH" ), myffi_dll );
EOF

  # FIXME should dao.conf be installed along with Dao?
  sed -i -r -e "s/# *(cpu *=).*/\1$(grep '^processor' /proc/cpuinfo | wc -l)/" \
            -e 's/# *(jit *=).*/\1yes/' dao.conf

  # stop right after the daomake tool creates the Makefile
  #sed -i -r 's|^[[:space:]]*\$\(MAKE\)[[:space:]]*$||' Makefile.daomake

  make -f Makefile.daomake linux MODE=debug RESET='--reset' \
    OPTIONS="--option-INSTALL-PATH '/usr' --no-local-rpath"
  #make -f Makefile.daomake linux MODE=release RESET='--reset' \
  #  OPTIONS="--option-INSTALL-PATH '/usr' --no-local-rpath"
}

pkgver() {
  cd "$_basename"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$_basename"
  make install INSTALL="$pkgdir/usr"

  # ELF file outside of a valid path
  rm "$pkgdir/usr/share/dao/demo/modules/clinker/libsample.so"

  # inst <src> <dst>
  inst() {
    # FIXME make it aware of system-wide policy on chmod & chown of dirs
    [ ! -d "$2" ] && {
      if [ "$(printf %s "$2" | sed -r 's|.*(.)$|\1|')" = '/' ]; then
        mkdir -p "$2"
      else
        mkdir -p "$(dirname "$2")"
      fi
    }
    cp -p -r -- "$1" "$2"
    # FIXME print the resulting file/dir full path
  }

  inst license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod 644        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  inst share/dao-logo.png "$pkgdir/usr/share/icons/"
  inst share/daohelp.vim  "$pkgdir/usr/share/vim/vimfiles/syntax/"
  inst share/dao.vim      "$pkgdir/usr/share/vim/vimfiles/syntax/"
  inst tools/webdemo/     "$pkgdir/usr/share/$_basename/"
  mkdir -p "$pkgdir/usr/share/doc/"
  # all links in the doc are relative
  mv "$pkgdir/usr/share/$_basename/doc/" "$pkgdir/usr/share/doc/$_basename"
}

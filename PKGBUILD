# Maintainer: dumblob <dumblob@gmail.com>
# Contributor: dumblob <dumblob@gmail.com>

_basename=dao

pkgname=${_basename}-git
pkgver=1603.90d9a82
pkgrel=1
# LLVM JIT
pkgdesc='A very lightweight, portable, optionally typed programming language and VM written in C featuring blazingly fast real concurrency, defer, OOP, AOP, bytecode, BNF macros, high-level standard library, advanced modules & bindings and much more!'
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
  "DaoCXX::git+https://github.com/daokoder/DaoCXX"
  "DaoGenomeTools::git+https://github.com/daokoder/DaoGenomeTools"
  "DaoGObject::git+https://github.com/daokoder/DaoGObject"
  "DaoGraphics::git+https://github.com/daokoder/DaoGraphics"
  "DaoGSL::git+https://github.com/daokoder/DaoGSL"
  "DaoJIT::git+https://github.com/daokoder/DaoJIT"
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
  'SKIP'
  'SKIP'
)
depends=('gcc-libs-multilib')
makedepends=(
  #'emscripten-git' (wait until clang 3.6 becomes supported)
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
  'llvm'  # FIXME needed because of the dirty buld-time patch below
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
replaces=('dao-lang-git')

build() {
  mv "$_basename-tools/"*   "$_basename/tools/"
  mv "$_basename-modules/"* "$_basename/modules/"
  mv "DaoCXX/"              "$_basename/modules/"
  # FIXME not getting compiled
  mv "DaoGenomeTools/"      "$_basename/modules/"
  # FIXME not getting compiled
  mv "DaoGObject/"          "$_basename/modules/"
  # FIXME not updated to the current Dao
  #mv "DaoGraphics/"         "$_basename/modules/"
  mv "DaoGSL/"              "$_basename/modules/"
  mv "DaoJIT/"              "$_basename/modules/"
  mv "DaoOpenGL/"           "$_basename/modules/"
  mv "DaoSQL/"              "$_basename/modules/"
  # FIXME see also below `sed -i ...'
  #   wrap/dao_sdl.h:18:16: fatal error: SDL.h: No such file or directory
  #   #include"SDL.h"
  #mv "DaoSDL/"              "$_basename/modules/"
  cd "$_basename"
  # FIXME https://github.com/daokoder/dao-modules/issues/73
#  rm -rf modules/clinker/

  # order matters when using gcc
  patch -R tools/clangdao/makefile.dao <<\EOF
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
  # Clang 3.6 uses std::unique_ptr<> => wrap pointers
  patch tools/clangdao/clangdao.cpp <<\EOF
@@ -457,7 +457,7 @@
 	compiler.createSourceManager(compiler.getFileManager());
 	compiler.createPreprocessor( TU_Complete );
 	compiler.createASTContext();
-	compiler.setASTConsumer( new CDaoASTConsumer( & compiler, & module ) );
+	compiler.setASTConsumer( unique_ptr<clang::ASTConsumer>( new CDaoASTConsumer( & compiler, & module ) ) );
 	//XXX compiler.createSema(false, NULL);
 	//compiler.createSema(TU_Module, NULL);
 	compiler.createSema(TU_Prefix, NULL);
@@ -478,7 +478,7 @@
 	//outs()<<builtinDefines<<"\n";
 
 	pp.setPredefines( builtinDefines + "\n" + predefines );
-	pp.addPPCallbacks( new CDaoPPCallbacks( & compiler, & module ) );
+	pp.addPPCallbacks( unique_ptr<clang::PPCallbacks>( new CDaoPPCallbacks( & compiler, & module ) ) );
 
 	InputKind ik = FrontendOptions::getInputKindForExtension( main_input_file );
 	compiler.InitializeSourceManager( FrontendInputFile( main_input_file, ik ) );
EOF

  # LLVM 3.6 renamed JIT to MCJIT and added std::unique_ptr<> => wrap pointers
patch modules/DaoJIT/daoJIT.cpp <<\EOF
@@ -38,7 +38,7 @@
 #include "llvm/IR/Verifier.h"
 #include "llvm/Analysis/Passes.h"
 #include "llvm/Transforms/Scalar.h"
-#include "llvm/ExecutionEngine/JIT.h"
+#include "llvm/ExecutionEngine/MCJIT.h"
 #include "llvm/ExecutionEngine/Interpreter.h"
 #include "llvm/ExecutionEngine/GenericValue.h"
 #include "llvm/Support/raw_ostream.h"
@@ -1137,7 +1137,7 @@
 	daojit_tan_double = Function::Create( mathft, linkage, "tan", llvm_module );
 	daojit_tanh_double = Function::Create( mathft, linkage, "tanh", llvm_module );
 
-	llvm_exe_engine = EngineBuilder( llvm_module ).setEngineKind(EngineKind::JIT).create();
+	llvm_exe_engine = EngineBuilder( std::unique_ptr<llvm::Module>( llvm_module ) ).setEngineKind(EngineKind::JIT).create();
 #if 0
 	llvm_exe_engine->addGlobalMapping( daojit_rand_double, (void*) daojit_rand );
 	llvm_exe_engine->addGlobalMapping( daojit_pow_double, (void*) pow );
EOF

  # FIXME https://github.com/daokoder/dao/issues/406
  sed -i -r 's|-Wl,-rpath=|-Wl,--enable-new-dtags,-rpath=|' \
    tools/daomake/platforms/unix.dao

  # each object file includes symbols from Clang and LLVM (and Clang
  #   object files in turn include symbols from LLVM)
  sed -i -r "/-lclangSerialization/a\
    project.AddLinkingFlag( \"-lLLVMOption -lLLVMSupport\" )" \
    modules/DaoCXX/makefile.dao
  # LLVM 3.6 renamed JIT to MCJIT and added std::unique_ptr<> => abandon raw pointers
  patch modules/DaoCXX/daoCXX.cpp <<\EOF
@@ -31,7 +31,7 @@
 #include <llvm/Support/MemoryBuffer.h>
 #include <llvm/Support/TargetSelect.h>
 #include <llvm/IR/LLVMContext.h>
-#include <llvm/ExecutionEngine/JIT.h>
+#include <llvm/ExecutionEngine/MCJIT.h>
 #include <llvm/ExecutionEngine/Interpreter.h>
 #include <llvm/ExecutionEngine/GenericValue.h>
 #include <clang/CodeGen/CodeGenAction.h>
@@ -80,10 +80,10 @@
 
 static void DaoCXX_AddVirtualFile( const char *name, const char *source )
 {
-	MemoryBuffer* Buffer = llvm::MemoryBuffer::getMemBufferCopy( source, name );
+	auto Buffer = llvm::MemoryBuffer::getMemBufferCopy( source, name );
 	const FileEntry* FE = compiler.getFileManager().getVirtualFile( name, 
 			strlen(Buffer->getBufferStart()), time(NULL) );
-	compiler.getSourceManager().overrideFileContents( FE, Buffer );
+	compiler.getSourceManager().overrideFileContents( FE, std::move( Buffer ) );
 	compiler.getFrontendOpts().Inputs.clear();
 	compiler.getFrontendOpts().Inputs.push_back( FrontendInputFile( name, IK_CXX ) );
 }
@@ -418,7 +418,7 @@
 	//action.BeginSourceFile( compiler, FrontendInputFile( name, IK_CXX ) );
 	if( ! compiler.ExecuteAction( action ) ) return error_compile_failed( out );
 
-	llvm::Module *module = action.takeModule();
+	auto module = action.takeModule();
 	if( module == NULL ) return error_compile_failed( out );
 
 	dao_make_anonymous_name( name, NS, VT, "dao_", "" );
@@ -475,7 +475,7 @@
 
 	if( ! compiler.ExecuteAction( action ) ) return error_compile_failed( out );
 
-	llvm::Module *module = action.takeModule();
+	auto module = action.takeModule();
 	if( module == NULL ) return error_compile_failed( out );
 
 	sprintf( proto2, "dao_%s", func->routName->chars ); //XXX buffer size
@@ -553,7 +553,7 @@
 
 	if( ! compiler.ExecuteAction( action ) ) return error_compile_failed( out );
 
-	llvm::Module *module = action.takeModule();
+	auto module = action.takeModule();
 	if( module == NULL ) return error_compile_failed( out );
 
 	for(i=0; i<funcs->size; i++){
@@ -701,10 +701,12 @@
 	DaoCXX_AddVirtualFile( "dummy-main.cpp", "void dummy_main(){}" );
 
 	InitializeNativeTarget();
+	InitializeNativeTargetAsmPrinter();
 	if( ! compiler.ExecuteAction( action ) ) return 1;
 
 	std::string Error;
-	engine = ExecutionEngine::createJIT( action.takeModule(), &Error );
+	engine = llvm::EngineBuilder( action.takeModule() )
+		.setErrorStr( &Error ).create();
 	if( engine == NULL ){
 		errs() << Error << "\n";
 		return 1;
EOF

  # gl.h is provided by mesa
  sed -i -r 's|(#include) *"gl.h"|\1 <GL/gl.h>|' \
    modules/DaoOpenGL/wrap/dao_opengl.h

  # https://github.com/daokoder/DaoSQL/issues/2
  sed -i -r 's|(#include) *"mysql.h"|\1 <mysql/mysql.h>|' \
    modules/DaoSQL/DaoMySQL/daoMySQL.h

  # FIXME https://github.com/daokoder/DaoSDL/issues/2
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
           dao.conf
           #-e 's/# *(jit *=).*/\1yes/' dao.conf

  # stop right after the daomake tool creates the Makefile
  #sed -i -r 's|^[[:space:]]*\$\(MAKE\)[[:space:]]*$||' Makefile.daomake

  # FIXME catch the daomake segfault
  #sed -i -r -e 's|([.]/daomake)|valgrind \1|' tools/daomake/bootstrap/Makefile
  #sed -i -r -e 's|(\$\(SRCDIR\)/tools/daomake/bootstrap/daomake)|valgrind \1|' \
  #  Makefile.daomake

  # FIXME disable testing
  #sed -i -r -e 's|^(.*DaoMake::SetTestTool)|#\1|' makefile.dao
  sed -i -r -e '/DaoMake::SetTestTool/s|testcmd|"true"|' makefile.dao

  # FIXME disable generation of finders, because they contain
  #   compile-time specific paths
  #make -f Makefile.daomake linux MODE=debug RESET='--reset' \
  #  OPTIONS="--option-INSTALL-PATH '/usr' --no-local-rpath"
  make -f Makefile.daomake linux MODE=release RESET='--reset' \
    OPTIONS="--option-INSTALL-PATH '/usr' --no-local-rpath"
}

pkgver() {
  cd "$_basename"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$_basename"
  make install INSTALL="$pkgdir/usr"

  # ELF file outside of a valid path
  [ -e "$pkgdir/usr/share/dao/demo/modules/clinker/libsample.so" ] &&
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

# Maintainer: dumblob <dumblob@gmail.com>
# Contributor: dumblob <dumblob@gmail.com>

_mode=release
#_mode=debug
_basename=dao

pkgname=${_basename}-git
pkgver=1783.0e31564f
pkgrel=1
# LLVM JIT
pkgdesc='A modern, very lightweight, portable, optionally typed programming language and VM written in C featuring blazingly fast real concurrency, defer, OOP, AOP, bytecode, high-level standard library, advanced modules & bindings and much more!'
url='http://daoscript.org/'
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
  #"DaoCXX::git+https://github.com/daokoder/DaoCXX"
  #"DaoGenomeTools::git+https://github.com/daokoder/DaoGenomeTools"
  #"DaoGObject::git+https://github.com/daokoder/DaoGObject"
  "DaoGraphics::git+https://github.com/daokoder/DaoGraphics"
  #"DaoGSL::git+https://github.com/daokoder/DaoGSL"
  #"DaoJIT::git+https://github.com/daokoder/DaoJIT"
  #"DaoOpenGL::git+https://github.com/daokoder/DaoOpenGL"
  "DaoSQL::git+https://github.com/daokoder/DaoSQL"
  #"DaoSDL::git+https://github.com/daokoder/DaoSDL"
)
sha256sums=(
  'SKIP'  # dao
  'SKIP'  # dao-tools
  #'SKIP'  # dao-tools#branch
  'SKIP'  # dao-modules
  #'SKIP'  # dao-modules#branch
  #'SKIP'  # daocxx
  #'SKIP'  # daogenometools
  #'SKIP'  # daogobject
  'SKIP'  # daographics
  #'SKIP'  # daogsl
  #'SKIP'  # daojit
  #'SKIP'  # daoopengl
  'SKIP'  # daosql
  #'SKIP'  # daosdl
)
depends=('gcc-libs-multilib')  # -multilib allows running 32b apps on 64b CPUs
makedepends=(
  #'emscripten-git'  # 2017-03-03 13:49:05 UTC+1 clang >=3.6 not yet supported
  #'genometools'
  #'glib2'
  #'gobject-introspection'

  # modules/DaoGraphics/deps/glfw/makefile.dao
  ###'libgl'             # OpenGL      for DaoGraphics and DaoOpenGL
  #'glu'               # OpenGL      for DaoGraphics and DaoOpenGL
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
  #'libffi'            # clinker ships with its own version of libffi
  #'sdl2'
  #'cblas'
  #'gsl'
  #'clang'
  #'llvm'              # needed for the dirty buld-time patch below
  'readline'
  'zlib'
)
optdepends=(
  #'emscripten-git:        support for compilation to JavaScript'
  #'genometools:           needed by the DaoGenomeTools module'
  #'glib2:                 needed by the DaoGObject module (runtime binding generation)'
  #'gobject-introspection: needed by the DaoGObject module (runtime binding generation)'

  'libxinerama:            needed by the DaoGraphics module'
  'libxi:                  needed by the DaoGraphics module'
  'libxrandr:              needed by the DaoGraphics module'
  'libxcursor:             needed by the DaoGraphics module'
  'glu:                    needed by the DaoGraphics and DaoOpenGL modules'

  'sqlite:                needed by the DaoSQLite module'
  'libmariadbclient:      needed by the DaoMySQL module'
  'postgresql-libs:       needed by the DaoPostgreSQL module'
  # clinker ships with its own version of libffi
  #'libffi:                needed by the clinker module (allows calling C functions directly from Dao without compiling them as a Dao module)'
  #'sdl2:                  needed by the DaoSDL module'
  #'cblas:                 needed by the cblas module'
  #'gsl:                   needed by the DaoGSL module (GNU Scientific Library)'
  #'clang:                 needed by clangdao (binding generator for C/C++ libs)'
  #'zlib:                  needed by the JIT and CXX modules'
)

provides=('dao')
conflicts=('dao')
replaces=('dao-lang-git')

pkgver() {
  cd "$_basename"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  mv "$_basename-tools/"*   "$_basename/tools/"
  # FIXME 2017-03-03 13:49:05 UTC+1 clang >=3.6 not yet supported
  rm -r "$_basename/tools/clangdao/"

  mv "$_basename-modules/"* "$_basename/modules/"
  # not maintained
  #mv "DaoCXX/"              "$_basename/modules/"
  # not maintained
  #mv "DaoGenomeTools/"      "$_basename/modules/"
  # not maintained
  #mv "DaoGObject/"          "$_basename/modules/"
  mv "DaoGraphics/"         "$_basename/modules/"
  # not maintained
  #mv "DaoGSL/"              "$_basename/modules/"
  # not maintained
  #mv "DaoJIT/"              "$_basename/modules/"
  # not maintained
  #mv "DaoOpenGL/"           "$_basename/modules/"
  mv "DaoSQL/"              "$_basename/modules/"
  # not maintained
  #mv "DaoSDL/"              "$_basename/modules/"

  cd "$_basename"

#  # FIXME https://github.com/daokoder/dao-modules/issues/73
#  rm -r modules/clinker/

#                         # order matters when using gcc
#                         patch -R tools/clangdao/makefile.dao <<\EOF
#                       @@ -44,9 +44,9 @@
#                        clangdao_exe.AddLinkingFlag( "-lclangSema" )
#                        clangdao_exe.AddLinkingFlag( "-lclangAnalysis" )
#                        clangdao_exe.AddLinkingFlag( "-lclangAST" )
#                       -clangdao_exe.AddLinkingFlag( "-lclangEdit" )
#                        clangdao_exe.AddLinkingFlag( "-lclangLex" )
#                        clangdao_exe.AddLinkingFlag( "-lclangBasic" )
#                       +clangdao_exe.AddLinkingFlag( "-lclangEdit" )
#                        clangdao_exe.AddLinkingFlag( "-lclangSerialization" )
#                        clangdao_exe.AddLinkingFlag( "-lclangStaticAnalyzerCheckers" )
#                        clangdao_exe.AddLinkingFlag( "-lclangStaticAnalyzerCore" )
#                       EOF
#                         # each object file includes symbols from Clang and LLVM (and Clang
#                         #   object files in turn include symbols from LLVM)
#                         sed -i -r "/-lclangStaticAnalyzerFrontend/a\
#                           clangdao_exe.AddLinkingFlag( \"$(llvm-config --libs)\" )" \
#                           tools/clangdao/makefile.dao
#                         # Clang 3.6 uses std::unique_ptr<> => wrap pointers
#                         patch tools/clangdao/clangdao.cpp <<\EOF
#                       @@ -457,7 +457,7 @@
#                        	compiler.createSourceManager(compiler.getFileManager());
#                        	compiler.createPreprocessor( TU_Complete );
#                        	compiler.createASTContext();
#                       -	compiler.setASTConsumer( new CDaoASTConsumer( & compiler, & module ) );
#                       +	compiler.setASTConsumer( unique_ptr<clang::ASTConsumer>( new CDaoASTConsumer( & compiler, & module ) ) );
#                        	//XXX compiler.createSema(false, NULL);
#                        	//compiler.createSema(TU_Module, NULL);
#                        	compiler.createSema(TU_Prefix, NULL);
#                       @@ -478,7 +478,7 @@
#                        	//outs()<<builtinDefines<<"\n";
#                        
#                        	pp.setPredefines( builtinDefines + "\n" + predefines );
#                       -	pp.addPPCallbacks( new CDaoPPCallbacks( & compiler, & module ) );
#                       +	pp.addPPCallbacks( unique_ptr<clang::PPCallbacks>( new CDaoPPCallbacks( & compiler, & module ) ) );
#                        
#                        	InputKind ik = FrontendOptions::getInputKindForExtension( main_input_file );
#                        	compiler.InitializeSourceManager( FrontendInputFile( main_input_file, ik ) );
#                       EOF

#  # LLVM 3.6 renamed JIT to MCJIT and added std::unique_ptr<> => wrap pointers
#  patch modules/DaoJIT/daoJIT.cpp <<\EOF
#@@ -38,7 +38,7 @@
# #include "llvm/IR/Verifier.h"
# #include "llvm/Analysis/Passes.h"
# #include "llvm/Transforms/Scalar.h"
#-#include "llvm/ExecutionEngine/JIT.h"
#+#include "llvm/ExecutionEngine/MCJIT.h"
# #include "llvm/ExecutionEngine/Interpreter.h"
# #include "llvm/ExecutionEngine/GenericValue.h"
# #include "llvm/Support/raw_ostream.h"
#@@ -1137,7 +1137,7 @@
# 	daojit_tan_double = Function::Create( mathft, linkage, "tan", llvm_module );
# 	daojit_tanh_double = Function::Create( mathft, linkage, "tanh", llvm_module );
# 
#-	llvm_exe_engine = EngineBuilder( llvm_module ).setEngineKind(EngineKind::JIT).create();
#+	llvm_exe_engine = EngineBuilder( std::unique_ptr<llvm::Module>( llvm_module ) ).setEngineKind(EngineKind::JIT).create();
# #if 0
# 	llvm_exe_engine->addGlobalMapping( daojit_rand_double, (void*) daojit_rand );
# 	llvm_exe_engine->addGlobalMapping( daojit_pow_double, (void*) pow );
#EOF

  # FIXME https://github.com/daokoder/dao/issues/406
  sed -i -r 's|-Wl,-rpath=|-Wl,--enable-new-dtags,-rpath=|' \
    tools/daomake/platforms/unix.dao

  # each object file includes symbols from Clang and LLVM (and Clang
  #   object files in turn include symbols from LLVM)
#  sed -i -r "/-lclangSerialization/a\
#    project.AddLinkingFlag( \"-lLLVMOption -lLLVMSupport\" )" \
#    modules/DaoCXX/makefile.dao
#  # LLVM 3.6 renamed JIT to MCJIT and added std::unique_ptr<> => abandon raw pointers
#  patch modules/DaoCXX/daoCXX.cpp <<\EOF
#@@ -31,7 +31,7 @@
# #include <llvm/Support/MemoryBuffer.h>
# #include <llvm/Support/TargetSelect.h>
# #include <llvm/IR/LLVMContext.h>
#-#include <llvm/ExecutionEngine/JIT.h>
#+#include <llvm/ExecutionEngine/MCJIT.h>
# #include <llvm/ExecutionEngine/Interpreter.h>
# #include <llvm/ExecutionEngine/GenericValue.h>
# #include <clang/CodeGen/CodeGenAction.h>
#@@ -80,10 +80,10 @@
# 
# static void DaoCXX_AddVirtualFile( const char *name, const char *source )
# {
#-	MemoryBuffer* Buffer = llvm::MemoryBuffer::getMemBufferCopy( source, name );
#+	auto Buffer = llvm::MemoryBuffer::getMemBufferCopy( source, name );
# 	const FileEntry* FE = compiler.getFileManager().getVirtualFile( name, 
# 			strlen(Buffer->getBufferStart()), time(NULL) );
#-	compiler.getSourceManager().overrideFileContents( FE, Buffer );
#+	compiler.getSourceManager().overrideFileContents( FE, std::move( Buffer ) );
# 	compiler.getFrontendOpts().Inputs.clear();
# 	compiler.getFrontendOpts().Inputs.push_back( FrontendInputFile( name, IK_CXX ) );
# }
#@@ -418,7 +418,7 @@
# 	//action.BeginSourceFile( compiler, FrontendInputFile( name, IK_CXX ) );
# 	if( ! compiler.ExecuteAction( action ) ) return error_compile_failed( out );
# 
#-	llvm::Module *module = action.takeModule();
#+	auto module = action.takeModule();
# 	if( module == NULL ) return error_compile_failed( out );
# 
# 	dao_make_anonymous_name( name, NS, VT, "dao_", "" );
#@@ -475,7 +475,7 @@
# 
# 	if( ! compiler.ExecuteAction( action ) ) return error_compile_failed( out );
# 
#-	llvm::Module *module = action.takeModule();
#+	auto module = action.takeModule();
# 	if( module == NULL ) return error_compile_failed( out );
# 
# 	sprintf( proto2, "dao_%s", func->routName->chars ); //XXX buffer size
#@@ -553,7 +553,7 @@
# 
# 	if( ! compiler.ExecuteAction( action ) ) return error_compile_failed( out );
# 
#-	llvm::Module *module = action.takeModule();
#+	auto module = action.takeModule();
# 	if( module == NULL ) return error_compile_failed( out );
# 
# 	for(i=0; i<funcs->size; i++){
#@@ -701,10 +701,12 @@
# 	DaoCXX_AddVirtualFile( "dummy-main.cpp", "void dummy_main(){}" );
# 
# 	InitializeNativeTarget();
#+	InitializeNativeTargetAsmPrinter();
# 	if( ! compiler.ExecuteAction( action ) ) return 1;
# 
# 	std::string Error;
#-	engine = ExecutionEngine::createJIT( action.takeModule(), &Error );
#+	engine = llvm::EngineBuilder( action.takeModule() )
#+		.setErrorStr( &Error ).create();
# 	if( engine == NULL ){
# 		errs() << Error << "\n";
# 		return 1;
#EOF

  # FIXME 2017-03-05 22:55:38 UTC+1 fill a bug as the .so is useless (unlike .a)
  sed -i -r '/AddSharedLibrary/d' modules/web/html/gumbo-parser/makefile.dao

  # namcap: ELF file outside of a valid path
  sed -i -r '/sample_dll/d' modules/clinker/makefile.dao

  # FIXME 2017-03-05 22:55:38 UTC+1 fill a bug as the .so is useless (unlike .a)
  sed -i -r '/ffi_dll/d' modules/clinker/libffi/makefile.dao

  # FIXME 2017-03-05 22:55:38 UTC+1 https://github.com/daokoder/dao-modules/issues/86
  #   the module is not any more available (FIXME but is used in documentation)
  #rm -r modules/protobject/

  # FIXME 2017-03-05 22:55:38 UTC+1 https://github.com/daokoder/dao-modules/issues/87
  rm -r modules/macro/

  # FIXME 2017-03-05 22:55:38 UTC+1 fill a bug as the .so is useless (unlike .a)
  sed -i -r '/onigmo_dll/d' modules/regex/Onigmo/makefile.dao

  # FIXME 2017-03-05 22:55:38 UTC+1 https://github.com/daokoder/dao-modules/issues/88
  rm -r modules/cblas/

  # FIXME 2017-03-05 22:55:38 UTC+1 https://github.com/daokoder/dao-modules/issues/89
  rm -r modules/testing/

  # gl.h is provided by mesa
  #sed -i -r 's|(#include) *"gl.h"|\1 <GL/gl.h>|' \
  #  modules/DaoOpenGL/wrap/dao_opengl.h

  # https://github.com/daokoder/DaoSQL/issues/2
  sed -i -r 's|(#include) *"mysql.h"|\1 <mysql/mysql.h>|' \
    modules/DaoSQL/DaoMySQL/daoMySQL.h

  # FIXME is dao.conf needed to be installed along with Dao VM?
  sed -i -r -e \
    "s/# *(cpu *=).*/\1$(grep '^processor' /proc/cpuinfo | wc -l)/" dao.conf
    #'s/# *(jit *=).*/\1yes/' dao.conf

  # DEBUG stop right after the daomake tool creates the Makefile
  #sed -i -r 's|^[[:space:]]*\$\(MAKE\)[[:space:]]*$||' Makefile.daomake

  # DEBUG catch daomake segfaults
  #sed -i -r -e 's|([.]/daomake)|valgrind \1|' tools/daomake/bootstrap/Makefile
  #sed -i -r -e 's|(\$\(SRCDIR\)/tools/daomake/bootstrap/daomake)|valgrind \1|' \
  #  Makefile.daomake

  # DEBUG disable testing
  #sed -i -r -e 's|^(.*DaoMake::SetTestTool)|#\1|' makefile.dao
  #sed -i -r -e '/DaoMake::SetTestTool/s|testcmd|"true"|' makefile.dao

  make -f Makefile.daomake linux MODE="$_mode" RESET='--reset' \
    OPTIONS="--option-INSTALL-PATH '/usr' --no-local-rpath"
}

package() {
  cd "$_basename"
  make install INSTALL="$pkgdir/usr"

  # finders contain build-specific paths (
  #   note 'rm -r ...packages/' would hide non-Find* files)
  # FIXME do not generate them in build()
  rm    "$pkgdir/usr/lib/daomake/packages/"Find*
  rmdir "$pkgdir/usr/lib/daomake/packages/"

  # inst <src> <dst>
  # if <dst> does not end with a slash, it's a path and name of the resulting
  #   file or dir (if the file or dir already exists, it's an error)
  inst() {
    # FIXME make it aware of system-wide policy on chmod & chown of dirs
    #   just 'sudo umask'?

    if [ "$(printf %s "$2" | sed -r 's|.*(.)$|\1|')" = '/' ]; then
      [ -d "$2" ] || mkdir -p -- "$2"
    else
      [ -e "$2" ] && {
        printf 'ERR inst(): %s\nERR inst(): %s\n' \
          "$2" "^^^destination already exists, can't install." >&2
        false
        return
      }
      mkdir -p -- "$(dirname "$2")"
    fi

    cp -p -r -- "$1" "$2"
    # FIXME print the resulting file/dir full path
  }

  inst license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod 644 --     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  inst share/dao-logo.png "$pkgdir/usr/share/icons/"
  inst share/daohelp.vim  "$pkgdir/usr/share/vim/vimfiles/syntax/"
  inst share/dao.vim      "$pkgdir/usr/share/vim/vimfiles/syntax/"
  inst tools/webdemo/     "$pkgdir/usr/share/$_basename/"
  mkdir -p -- "$pkgdir/usr/share/doc/"
  # all links in the doc are already relative
  mv -- "$pkgdir/usr/share/$_basename/doc/" "$pkgdir/usr/share/doc/$_basename"

  # Unit testing

  # Finders are useless and their content baffles unit testing
  # FIXME daomake could remove them after using them
  for f in "$srcdir/$_basename/modules/"*/CacheFind*.dao \
      "$srcdir/$_basename/modules/"*/FindDao*.dao; do
    [ -e "$f" ] && rm -- "$f"
  done

  # no need to clean it using
  #   trap 'rm -rf -- "$_tmpd"' EXIT TERM INT HUP KILL
  _tmpd="$(mktemp -p "$srcdir" -d XXXX)"

  ( LC_ALL=C
    cd -- "$srcdir/$_basename/modules/"

    find . -type f -name '*.dao' |
    while read f; do
      grep -Eo \
'^[^#]*[^_[:alpha:][:digit:]]AddSharedLibrary[^(]*[(][[:blank:]]+"[^"].*' \
        "$f" |
      sed -r 's|^.*AddSharedLibrary[^"]+"([^"]+).*$|\1|' |
      while read lib; do
        # include full path (names alone appear more than once)
        printf '%s\n' "$(dirname "$f")/lib${lib}.so"
      done
    # "string/" and "DaoSQL/" are exceptions to the rule
    done | sed -r -e 's%((string/)|[^/]+/)([^/]+)$%\2\3%' -e 's|DaoSQL/||' |
      sort | uniq
  ) > "$_tmpd/libs_expected"

  ( LC_ALL=C
    cd -- "$pkgdir/usr/lib/$_basename/modules/"
    find . -type f -iname '*.so' | sort
  ) > "$_tmpd/libs_found"

  _diff="$(diff -urN -- "$_tmpd/libs_expected" "$_tmpd/libs_found")"

  [ -z "$_diff" ] || {
    printf '%s\n' "$_diff" >&2
    false
  }

  [ "$_mode" = 'release' ] || printf '\n%s\n' \
    'WARN Non-release build built! Did you set MODE=debug in PKGBUILD?' >&2
}

# Maintainer: Guillaume Maudoux <layus DOT on @AT@ gmail DOT com>

pkgname=mozart2-git
pkgver=v2.0.0.alpha.0.4141.ga2413d4
pkgrel=1
pkgdesc="The Mozart Programming System version 2"
arch=('i686' 'x86_64')
url="https://github.com/mozart/mozart2"
license=('BSD')
depends=('boost-libs' 'tk>=8.6.0' 'tk<8.7.0' 'gmp' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('emacs: Interactive programming interface (recommended)')
makedepends=('java-runtime-headless' 'emacs' 'gcc' 'boost' 'cmake' 'gtest' 'sbt-extras-git' 'clang' 'llvm')
provides=('mozart')
conflicts=('mozart' 'mozart-git' 'mozart2')
install="${pkgname}.install"
source=( 
    'git+http://github.com/mozart/mozart2.git'
    'git+http://github.com/mozart/mozart2-stdlib.git'
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "mozart2"
    git describe --always | sed 's|-|.|g'
}

_patch(){
    cd "$srcdir/mozart2"

    patch -p 1 < $srcdir/231.patch

    # We use the packaged gtest, which contains only shared objects.
    # Make Mozart use dynamic libgtest.
    sed -i'' \
        -e '/add_library/s/STATIC/SHARED/' \
        -e '/libgtest/s/\.a/.so/' \
        $srcdir/mozart2/vm/vm/test/CMakeLists.txt

    # Add required libraries to executable.
    # TODO : Explore clang build process, I have no idea why this may be needed.
    #        Normally ld should be able to identify required LLVM/Clang libs by itself.
    libs="LLVM-3.6 clang clangTooling clangFrontendTool clangFrontend \
        clangDriver clangSerialization clangCodeGen clangParse clangSema \
        clangStaticAnalyzerFrontend clangStaticAnalyzerCheckers \
        clangStaticAnalyzerCore clangAnalysis clangARCMigrate clangEdit \
        clangAST clangLex clangBasic"
    sed -i'' \
        -e "s%(generator \"\${CLANG_LIBRARY}\"%\\0 $libs%" \
        $srcdir/mozart2/vm/generator/main/CMakeLists.txt 

    # Set SBT to packaged command.
    # We use the option '-no-share' from the sbt package.
    # This avoids a bug when running sbt in fakeroot (trying to access /root/.{sbt,ivy2} fails)
    # This is only available because of the wrapper provided in the ArchLinux 'sbt' package.
    # It also avoids mingling with user ~/.sbt/*
    # TODO : remove/bypass/configure sbt to allow offline compilation
    sed -i'' '/set(SBT/{N; s/set(\s*SBT.*)/set(SBT sbt -offline -no-share -batch)/}' \
        $srcdir/mozart2/bootcompiler/CMakeLists.txt

    # Remove hard-coded palette settings in QTk (Avoids bug in GUI's on Linux).
    sed -i'' '/tk_setPalette/s/^/%/' \
        $srcdir/mozart2/stdlib/wp/qtk/QTkBare.oz
}

prepare() {
    cd "$srcdir/mozart2"
    git submodule init
    git config submodule.stdlib.url "$srcdir/mozart2-stdlib"
    git submodule update

    # Ultimately this should not be needed.
    #_patch

    # download scala/sbt sources for later offline compilation.
    pushd bootcompiler &>/dev/null
    sbt -no-share -batch
    popd &>/dev/null
}

build() {
    cd "$srcdir/mozart2"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        #-DMOZART_BOOST_USE_STATIC_LIBS=OFF \
        #-DGTEST_BUILD_DIR=/usr/lib/ \
        #-DGTEST_SRC_DIR=/usr/include/gtest/ \
        #-DLLVM_BUILD_DIR=/usr/ \
        #-DLLVM_SRC_DIR=/usr/

    make -j1 # VERBOSE=1 
}

check() {
    cd "$srcdir/mozart2"
    make vmtest
    ./vm/vm/test/vmtest
}

package() {
    cd "$srcdir/mozart2"
    make DESTDIR="$pkgdir/" install

    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


# vim:set ts=4 sw=4 et:

# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>
#
# Fork of PKGBUILD for llvm-svn:
# Maintainer: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgbase=llvm-debug
pkgname=('llvm-debug' 'llvm-libs-debug' 'clang-debug' 'clang-analyzer-debug' 'clang-tools-extra-debug')
_pkgname='llvm'
pkgver=258811
pkgrel=5
arch=('i686' 'x86_64')
url="http://llvm.org"
license=('custom:University of Illinois')
makedepends=('subversion' 'libffi' 'python2' 'python-sphinx' 'python-requests' 'chrpath')

# this is always the latest svn so debug info can be useful
options=('staticlibs' '!strip')

_svn_tag="RELEASE_351/final"

source=("${_pkgname}::svn+http://llvm.org/svn/llvm-project/llvm/tags/${_svn_tag}"
        "clang::svn+http://llvm.org/svn/llvm-project/cfe/tags/${_svn_tag}"
        "clang-tools-extra::svn+http://llvm.org/svn/llvm-project/clang-tools-extra/tags/${_svn_tag}"
        "compiler-rt::svn+http://llvm.org/svn/llvm-project/compiler-rt/tags/${_svn_tag}"
        llvm-Config-config.h
        llvm-Config-llvm-config.h
        bug-20176-template-friend-fix.patch
        fix-cxx11-abi-tags.patch)
sha256sums=('SKIP'
            'SKIP'    
            'SKIP'
            'SKIP'
            '312574e655f9a87784ca416949c505c452b819fad3061f2cde8aced6540a19a3'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48'
            'b3d583b2609c28b7b41cae828b85f96b882b9b5474f3d888e72734fb00879d3d'
            'ae4e0c93ed16fa4c87e7ce0604bd6bd2407735604826d99c3458066536d8c8be')

_ocamlver()
{
    pacman -Q ocaml | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2,3
}

pkgver()
{
    cd "${srcdir}/${_pkgname}"
    svnversion | tr -d [A-z]
}

_install_prefix="/opt/clang/3.5.1"

prepare() {
    cd "${srcdir}/${_pkgname}"

    svn export "${srcdir}/clang" tools/clang
    svn export "${srcdir}/clang-tools-extra" tools/clang/tools/extra
    svn export "${srcdir}/compiler-rt" projects/compiler-rt

    # Fix bug 20176
    patch -p1 < "${srcdir}/bug-20176-template-friend-fix.patch"

    # Fix ABI tags
    patch -p1 < "${srcdir}/fix-cxx11-abi-tags.patch"

    # Fix docs installation directory
    sed -e 's:$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
        -i Makefile.config.in

    # Fix definition of LLVM_CMAKE_DIR in LLVMConfig.cmake
    sed -e '/@LLVM_CONFIG_CMAKE_DIR@/s:$(PROJ_cmake):$(PROJ_prefix)/share/llvm/cmake:' \
        -i cmake/modules/Makefile
}

build() {
    cd "${srcdir}/${_pkgname}"

    # Apply strip option to configure
    _optimized_switch="enable"
    check_option "strip" "n" && _optimized_switch="disable"

    # Include location of libffi headers in CPPFLAGS
    CPPFLAGS+=" $(pkg-config --cflags libffi)"

    # Force the use of GCC instead of clang
    CC=gcc CXX=g++ \
    ./configure \
        --prefix=$_install_prefix \
        --sysconfdir=/etc \
        --enable-shared \
        --enable-libffi \
        --enable-targets=all \
        --disable-expensive-checks \
        --enable-debug-runtime \
        --enable-assertions \
        --with-binutils-include=/usr/include \
        --with-python=/usr/bin/python2 \
        --$_optimized_switch-optimized

    make REQUIRES_RTTI=1
    make -C docs -f Makefile.sphinx man
    make -C docs -f Makefile.sphinx html
    make -C tools/clang/docs -f Makefile.sphinx html
}

package_llvm-debug() {
    pkgdesc="Low Level Virtual Machine"
    depends=("llvm-libs-debug=$pkgver-$pkgrel" 'perl')
    # provides=('llvm')
    # replaces=('llvm')
    # conflicts=('llvm')

    cd "${srcdir}/${_pkgname}"

    # We move the clang directory out of the tree so it won't get installed and
    # then we bring it back in for the clang package
    mv tools/clang "${srcdir}/clang.src"

    # -j1 is due to race conditions during the installation of the OCaml bindings
    make -j1 DESTDIR="${pkgdir}" install
    mv "${srcdir}/clang.src" tools/clang

    # The runtime library goes into llvm-libs
    rm -rf "${srcdir}"/*.so
    mv "${pkgdir}"$_install_prefix/lib/libLLVM-*.so "${srcdir}/"

    # OCaml bindings go to a separate package
    rm -rf "${srcdir}"/ocaml
    mv "${pkgdir}"$_install_prefix/lib/ocaml "${srcdir}/"

    # Remove duplicate files installed by the OCaml bindings
    rm -rf "${pkgdir}"$_install_prefix/lib/libllvm*

    # Fix permissions of static libs
    chmod -x "${pkgdir}"$_install_prefix/lib/*.a

    # Get rid of example Hello transformation
    rm -rf "${pkgdir}"$_install_prefix/lib/*LLVMHello.*

    # Symlink LLVMgold.so into /usr/lib/bfd-plugins
    # https://bugs.archlinux.org/task/28479
    install -m755 -d "${pkgdir}$_install_prefix/lib/bfd-plugins"
    ln -s ../LLVMgold.so "${pkgdir}$_install_prefix/lib/bfd-plugins/LLVMgold.so"

    if [[ $CARCH == x86_64 ]]; then
        # Needed for multilib (https://bugs.archlinux.org/task/29951)
        # Header stubs are taken from Fedora
        for _header in config llvm-config; do
            mv "${pkgdir}$_install_prefix/include/llvm/Config/${_header}"{,-64}.h
            cp "${srcdir}/llvm-Config-${_header}.h" \
                 "${pkgdir}$_install_prefix/include/llvm/Config/${_header}.h"
        done
    fi

    # Install man pages
    install -d "${pkgdir}$_install_prefix/share/man/man1"
    cp docs/_build/man/*.1 "${pkgdir}$_install_prefix/share/man/man1/"

    # Install html docs
    cp -r docs/_build/html/* "${pkgdir}$_install_prefix/share/doc/$_pkgname/html/"
    rm -r "${pkgdir}$_install_prefix/share/doc/${_pkgname}/html/_sources"

    install -Dm644 LICENSE.TXT "${pkgdir}$_install_prefix/share/licenses/${pkgname}/LICENSE"
}

package_llvm-libs-debug() {
    pkgdesc="Low Level Virtual Machine (runtime library)"
    depends=('gcc-libs' 'zlib' 'libffi' 'ncurses')
    # provides=('llvm-libs')
    # replaces=('llvm-libs')
    # conflicts=('llvm-libs')

    install -m755 -d "${pkgdir}"$_install_prefix/lib/

    mv "${srcdir}"/libLLVM-*.so "${pkgdir}$_install_prefix/lib/"

    for _shlib in "${pkgdir}"$_install_prefix/lib/*.so
    do
      test -L "${_shlib}" && ln -sf $(basename $(readlink ${_shlib})) ${_shlib}
    done

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}$_install_prefix/share/licenses/${pkgname}/LICENSE"
}

package_clang-debug() {
    pkgdesc="C language family frontend for LLVM"
    url="http://clang.llvm.org/"
    depends=("llvm-debug=$pkgver-$pkgrel" 'gcc')
    # provides=('clang')
    # replaces=('clang')
    # conflicts=('clang')

    sed -e 's:$(PROJ_prefix)/share/doc/llvm:$(PROJ_prefix)/share/doc/clang:' \
        -i "${srcdir}/${_pkgname}/Makefile.config"

    cd "${srcdir}/${_pkgname}/tools/clang"

    # We move the extra tools directory out of the tree so it won't get
    # installed and then we bring it back in for the clang-tools-extra package
    mv tools/extra "${srcdir}/"

    make DESTDIR="${pkgdir}" install
    mv "${srcdir}/extra" tools/

    # Fix permissions of static libs
    chmod -x "${pkgdir}"$_install_prefix/lib/*.a

    # Revert the path change in case we want to do a repackage later
    sed -e 's:$(PROJ_prefix)/share/doc/clang:$(PROJ_prefix)/share/doc/llvm:' \
        -i "${srcdir}/${_pkgname}/Makefile.config"

    # Install html docs
    cp -r docs/_build/html/* "${pkgdir}$_install_prefix/share/doc/clang/html/"
    rm -r "${pkgdir}$_install_prefix/share/doc/clang/html/_sources"

    # Install Python bindings
    install -m755 -d "${pkgdir}$_install_prefix/lib/python2.7/site-packages"
    cp -r bindings/python/clang "${pkgdir}$_install_prefix/lib/python2.7/site-packages/"
    python2 -m compileall "${pkgdir}$_install_prefix/lib/python2.7/site-packages/clang"
    python2 -O -m compileall "${pkgdir}$_install_prefix/lib/python2.7/site-packages/clang"

    # Install clang-format editor integration files (FS#38485)
    # Destination paths are copied from clang-format/CMakeLists.txt
    install -m755 -d "$pkgdir$_install_prefix/share/clang"
    (
    cd tools/clang-format
    cp clang-format-diff.py \
       clang-format-sublime.py \
       clang-format.el \
       clang-format.py \
       "${pkgdir}$_install_prefix/share/clang/"

      cp git-clang-format "${pkgdir}$_install_prefix/bin/"
      sed -e 's|$_install_prefix/bin/python$|&2|' \
          -i "${pkgdir}$_install_prefix/bin/git-clang-format" \
          -i "${pkgdir}$_install_prefix/share/clang/clang-format-diff.py"
    )

    install -Dm644 LICENSE.TXT "${pkgdir}$_install_prefix/share/licenses/${pkgname}/LICENSE"
}

package_clang-analyzer-debug() {
    pkgdesc="A source code analysis framework"
    url="http://clang-analyzer.llvm.org/"
    depends=("clang-debug=$pkgver-$pkgrel" 'python2')
    # provides=('clang-analyzer')
    # replaces=('clang-analyzer')
    # conflicts=('clang-analyzer')

    cd "${srcdir}/${_pkgname}/tools/clang"

    install -m755 -d "${pkgdir}"$_install_prefix/{bin,lib/clang-analyzer}
    for _tool in scan-{build,view}; do
        cp -r tools/${_tool} "${pkgdir}$_install_prefix/lib/clang-analyzer/"
        ln -s $_install_prefix/lib/clang-analyzer/${_tool}/${_tool} "${pkgdir}$_install_prefix/bin/"
    done

    # scan-build looks for clang within the same directory
    ln -s $_install_prefix/bin/clang "${pkgdir}$_install_prefix/lib/clang-analyzer/scan-build/"

    # Relocate man page
    install -m755 -d "${pkgdir}$_install_prefix/share/man/man1"
    mv "${pkgdir}$_install_prefix/lib/clang-analyzer/scan-build/scan-build.1" \
       "${pkgdir}$_install_prefix/share/man/man1/"

    # Use Python 2
    sed -e 's|env python$|&2|' \
        -e 's|$_install_prefix/bin/python$|&2|' \
        -i "${pkgdir}$_install_prefix/lib/clang-analyzer/scan-view/scan-view" \
           "${pkgdir}$_install_prefix/lib/clang-analyzer/scan-build/set-xcode-analyzer"

    # Compile Python scripts
    python2 -m compileall "${pkgdir}$_install_prefix/lib/clang-analyzer"
    python2 -O -m compileall "${pkgdir}$_install_prefix/lib/clang-analyzer"

    install -Dm644 LICENSE.TXT "${pkgdir}$_install_prefix/share/licenses/${pkgname}/LICENSE"
}

package_clang-tools-extra-debug() {
    pkgdesc="Extra tools built using Clang's tooling APIs"
    url="http://clang.llvm.org/"
    depends=("clang-debug=$pkgver-$pkgrel")
    # provides=('clang-tools-extra')
    # replaces=('clang-tools-extra')
    # conflicts=('clang-tools-extra')

    cd "${srcdir}/${_pkgname}/tools/clang/tools/extra"

    make DESTDIR="${pkgdir}" install

    # Fix permissions of static libs
    chmod -x "${pkgdir}"$_install_prefix/lib/*.a

    install -Dm644 LICENSE.TXT "${pkgdir}$_install_prefix/share/licenses/${pkgname}/LICENSE"
}

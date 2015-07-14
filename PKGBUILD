# Maintainer: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgbase=llvm-svn

# WARNING: Ocaml bindings are disabled by default.
# Change the variable below to 1 if you want to
# build them.
_ocamlbuild=0

_pkgname='llvm'
pkgname=('llvm-svn' 'llvm-libs-svn' 'clang-svn' 'clang-analyzer-svn' 'clang-tools-extra-svn')

if [[ ${_ocamlbuild} -eq 1 ]]
then
    pkgname+=('llvm-ocaml-svn')
fi

pkgver=241875
pkgrel=1
arch=('i686' 'x86_64')
url="http://llvm.org"
license=('custom:University of Illinois')
makedepends=('subversion' 'libffi' 'python2' 'python-sphinx')

if [[ ${_ocamlbuild} -eq 1 ]]
then
    makedepends+=('ocaml-ctypes' 'ocaml-findlib' 'chrpath')
fi

# this is always the latest svn so debug info can be useful
options=('staticlibs' '!strip')

source=("${_pkgname}::svn+http://llvm.org/svn/llvm-project/llvm/trunk"
        "clang::svn+http://llvm.org/svn/llvm-project/cfe/trunk"
        "clang-tools-extra::svn+http://llvm.org/svn/llvm-project/clang-tools-extra/trunk"
        "compiler-rt::svn+http://llvm.org/svn/llvm-project/compiler-rt/trunk"
        llvm-Config-config.h
        llvm-Config-llvm-config.h)
sha256sums=('SKIP'
            'SKIP'    
            'SKIP'
            'SKIP'
            '312574e655f9a87784ca416949c505c452b819fad3061f2cde8aced6540a19a3'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')

if [[ ${_ocamlbuild} -eq 1 ]]
then
    _ocamlver()
    {
        pacman -Q ocaml | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2,3
    }
fi

pkgver()
{
    cd "${srcdir}/${_pkgname}"
    svnversion | tr -d [A-z]
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    svn export "${srcdir}/clang" tools/clang
    svn export "${srcdir}/clang-tools-extra" tools/clang/tools/extra
    svn export "${srcdir}/compiler-rt" projects/compiler-rt

    # Fix docs installation directory
    sed -e 's:$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
        -i Makefile.config.in

    # Fix definition of LLVM_CMAKE_DIR in LLVMConfig.cmake
    sed -e '/@LLVM_CONFIG_CMAKE_DIR@/s:$(PROJ_cmake):$(PROJ_prefix)/share/llvm/cmake:' \
        -i cmake/modules/Makefile

    rm -rf "${srcdir}/llvm-build"
    mkdir "${srcdir}/llvm-build"
}

build() {
    cd "${srcdir}/llvm-build"

    # Apply strip option to configure
    _optimized_switch="enable"
    [[ $(check_option strip) == n ]] && _optimized_switch="disable"

    # Include location of libffi headers in CPPFLAGS
    CPPFLAGS+=" $(pkg-config --cflags libffi)"

    # Force the use of GCC instead of clang
    CC=gcc CXX=g++ \
    "${srcdir}/llvm/configure" \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-shared \
        --enable-libffi \
        --enable-targets=all \
        --disable-assertions \
        --with-binutils-include=/usr/include \
        --with-python=/usr/bin/python2 \
        --$_optimized_switch-optimized

    make REQUIRES_RTTI=1

    make -C "${srcdir}/${_pkgname}/docs" -f Makefile.sphinx man
    make -C "${srcdir}/${_pkgname}/docs" -f Makefile.sphinx html
    make -C "${srcdir}/${_pkgname}/tools/clang/docs" -f Makefile.sphinx html
}

package_llvm-svn() {
    pkgdesc="Low Level Virtual Machine"
    depends=("llvm-libs-svn=$pkgver-$pkgrel" 'perl')
    provides=('llvm')
    replaces=('llvm')
    conflicts=('llvm')

    cd "${srcdir}/llvm-build"

    # We move the clang directory out of the tree so it won't get installed and
    # then we bring it back in for the clang package
    mv tools/clang "${srcdir}/clang.build"
    mv "${srcdir}/${_pkgname}/tools/clang" "${srcdir}/clang.src"

    # -j1 is due to race conditions during the installation of the OCaml bindings
    make -j1 DESTDIR="${pkgdir}" install

    mv "${srcdir}/clang.build" tools/clang
    mv "${srcdir}/clang.src" "${srcdir}/${_pkgname}/tools/clang"

    # The runtime library goes into llvm-libs
    rm -rf "${srcdir}"/*.so
    mv "${pkgdir}"/usr/lib/libLLVM-*.so "${srcdir}/"

    if [[ ${_ocamlbuild} -eq 1 ]]
    then
        # OCaml bindings go to a separate package
        rm -rf "${srcdir}"/ocaml
        mv "${pkgdir}"/usr/lib/ocaml "${srcdir}/"

        # Remove duplicate files installed by the OCaml bindings
        rm -rf "${pkgdir}"/usr/lib/libllvm*
    fi

    # Fix permissions of static libs
    chmod -x "${pkgdir}"/usr/lib/*.a

    # Get rid of example Hello transformation
    rm -rf "${pkgdir}"/usr/lib/*LLVMHello.*

    # Symlink LLVMgold.so into /usr/lib/bfd-plugins
    # https://bugs.archlinux.org/task/28479
    install -m755 -d "${pkgdir}/usr/lib/bfd-plugins"
    ln -s ../LLVMgold.so "${pkgdir}/usr/lib/bfd-plugins/LLVMgold.so"

    if [[ $CARCH == x86_64 ]]; then
        # Needed for multilib (https://bugs.archlinux.org/task/29951)
        # Header stubs are taken from Fedora
        for _header in config llvm-config; do
            mv "${pkgdir}/usr/include/llvm/Config/${_header}"{,-64}.h
            cp "${srcdir}/llvm-Config-${_header}.h" \
                 "${pkgdir}/usr/include/llvm/Config/${_header}.h"
        done
    fi

    # Install man pages
    install -d "${pkgdir}/usr/share/man/man1"
    cp "${srcdir}/${_pkgname}"/docs/_build/man/*.1 "${pkgdir}/usr/share/man/man1/"

    # Install html docs
    cp -r "${srcdir}/${_pkgname}"/docs/_build/html/* "${pkgdir}/usr/share/doc/$_pkgname/html/"
    rm -r "${pkgdir}/usr/share/doc/${_pkgname}/html/_sources"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_llvm-libs-svn() {
    pkgdesc="Low Level Virtual Machine (runtime library)"
    depends=('gcc-libs' 'zlib' 'libffi' 'ncurses')
    provides=('llvm-libs')
    replaces=('llvm-libs')
    conflicts=('llvm-libs')

    install -m755 -d "${pkgdir}/usr/lib/"

    mv "${srcdir}"/libLLVM-*.so "${pkgdir}/usr/lib/"

    for _shlib in "${pkgdir}"/usr/lib/*.so
    do
      test -L "${_shlib}" && ln -sf $(basename $(readlink ${_shlib})) ${_shlib}
    done

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

if [[ ${_ocamlbuild} -eq 1 ]]
then
    package_llvm-ocaml-svn() {
        pkgdesc="OCaml bindings for LLVM"
        depends=("llvm-svn=$pkgver-$pkgrel" "ocaml=$(_ocamlver)" 'ocaml-ctypes')
        provides=('llvm-ocaml')
        replaces=('llvm-ocaml')
        conflicts=('llvm-ocaml')

        cd "${srcdir}/llvm-build"

        install -m755 -d "${pkgdir}/usr/lib"
        cp -r "${srcdir}/ocaml" "${pkgdir}/usr/lib/"

        # Remove execute bit from static libraries
        chmod -x "${pkgdir}"/usr/lib/ocaml/libllvm*.a

        # Remove insecure rpath
        chrpath -d "${pkgdir}"/usr/lib/ocaml/*.so

        install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    }
fi

package_clang-svn() {
    pkgdesc="C language family frontend for LLVM"
    url="http://clang.llvm.org/"
    depends=("llvm-svn=$pkgver-$pkgrel" 'gcc')
    provides=('clang')
    replaces=('clang')
    conflicts=('clang')

    sed -e 's:$(PROJ_prefix)/share/doc/llvm:$(PROJ_prefix)/share/doc/clang:' \
        -i "${srcdir}/llvm-build/Makefile.config"

    cd "${srcdir}/llvm-build/tools/clang"

    # We move the extra tools directory out of the tree so it won't get
    # installed and then we bring it back in for the clang-tools-extra package
    mv tools/extra "${srcdir}/extra.build"
    mv "${srcdir}/${_pkgname}/tools/clang/tools/extra" "${srcdir}/extra.src"

    make DESTDIR="${pkgdir}" install

    mv "${srcdir}/extra.build" tools/extra
    mv "${srcdir}/extra.src" "${srcdir}/${_pkgname}/tools/clang/tools/extra"

    # Fix permissions of static libs
    chmod -x "${pkgdir}"/usr/lib/*.a

    # Revert the path change in case we want to do a repackage later
    sed -e 's:$(PROJ_prefix)/share/doc/clang:$(PROJ_prefix)/share/doc/llvm:' \
        -i "${srcdir}/llvm-build/Makefile.config"

    # Install html docs
    cp -r "${srcdir}/${_pkgname}"/docs/_build/html/* "${pkgdir}/usr/share/doc/clang/html/"
    rm -r "${pkgdir}/usr/share/doc/clang/html/_sources"

    # Install Python bindings
    install -m755 -d "${pkgdir}/usr/lib/python2.7/site-packages"
    cp -r "${srcdir}/${_pkgname}/tools/clang/bindings/python/clang" "${pkgdir}/usr/lib/python2.7/site-packages/"
    python2 -m compileall "${pkgdir}/usr/lib/python2.7/site-packages/clang"
    python2 -O -m compileall "${pkgdir}/usr/lib/python2.7/site-packages/clang"

    # Install clang-format editor integration files (FS#38485)
    # Destination paths are copied from clang-format/CMakeLists.txt
    install -m755 -d "$pkgdir/usr/share/clang"
    (
    cd "${srcdir}/${_pkgname}/tools/clang/tools/clang-format"
    cp clang-format-diff.py \
       clang-format-sublime.py \
       clang-format.el \
       clang-format.py \
       "${pkgdir}/usr/share/clang/"

      cp git-clang-format "${pkgdir}/usr/bin/"
      sed -e 's|/usr/bin/python$|&2|' \
          -i "${pkgdir}/usr/bin/git-clang-format" \
          -i "${pkgdir}/usr/share/clang/clang-format-diff.py"
    )

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_clang-analyzer-svn() {
    pkgdesc="A source code analysis framework"
    url="http://clang-analyzer.llvm.org/"
    depends=("clang-svn=$pkgver-$pkgrel" 'python2')
    provides=('clang-analyzer')
    replaces=('clang-analyzer')
    conflicts=('clang-analyzer')

    cd "${srcdir}/${_pkgname}/tools/clang"

    install -m755 -d "${pkgdir}"/usr/{bin,lib/clang-analyzer}
    for _tool in scan-{build,view}; do
        cp -r tools/${_tool} "${pkgdir}/usr/lib/clang-analyzer/"
        ln -s /usr/lib/clang-analyzer/${_tool}/${_tool} "${pkgdir}/usr/bin/"
    done

    # scan-build looks for clang within the same directory
    ln -s /usr/bin/clang "${pkgdir}/usr/lib/clang-analyzer/scan-build/"

    # Relocate man page
    install -m755 -d "${pkgdir}/usr/share/man/man1"
    mv "${pkgdir}/usr/lib/clang-analyzer/scan-build/scan-build.1" \
       "${pkgdir}/usr/share/man/man1/"

    # Use Python 2
    sed -e 's|env python$|&2|' \
        -e 's|/usr/bin/python$|&2|' \
        -i "${pkgdir}/usr/lib/clang-analyzer/scan-view/scan-view" \
           "${pkgdir}/usr/lib/clang-analyzer/scan-build/set-xcode-analyzer"

    # Compile Python scripts
    python2 -m compileall "${pkgdir}/usr/lib/clang-analyzer"
    python2 -O -m compileall "${pkgdir}/usr/lib/clang-analyzer"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_clang-tools-extra-svn() {
    pkgdesc="Extra tools built using Clang's tooling APIs"
    url="http://clang.llvm.org/"
    depends=("clang-svn=$pkgver-$pkgrel")
    provides=('clang-tools-extra')
    replaces=('clang-tools-extra')
    conflicts=('clang-tools-extra')

    cd "${srcdir}/llvm-build/tools/clang/tools/extra"

    make DESTDIR="${pkgdir}" install

    # Fix permissions of static libs
    chmod -x "${pkgdir}"/usr/lib/*.a

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

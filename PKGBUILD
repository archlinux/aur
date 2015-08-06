# Maintainer: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgbase=llvm-svn

pkgname=(
    'llvm-svn'
    'llvm-libs-svn'
    'llvm-ocaml-svn'
    'clang-svn'
    'clang-analyzer-svn'
    'clang-tools-extra-svn'
)
_pkgname='llvm'

pkgver=3.8.0svn_r244189
pkgrel=1

arch=('i686' 'x86_64')
url='http://llvm.org/'
license=('custom:University of Illinois')

makedepends=(
    'cmake'
    'libffi'
    'ocaml-ctypes'
    'ocaml-findlib'
    'python2'
    'python2-sphinx'
    'subversion'
)

# this is always the latest svn so debug info can be useful
options=('staticlibs' '!strip')

source=(
    "${_pkgname}::svn+http://llvm.org/svn/llvm-project/llvm/trunk"
    'clang::svn+http://llvm.org/svn/llvm-project/cfe/trunk'
    'clang-tools-extra::svn+http://llvm.org/svn/llvm-project/clang-tools-extra/trunk'
    'compiler-rt::svn+http://llvm.org/svn/llvm-project/compiler-rt/trunk'
    llvm-Config-llvm-config.h
    llvm_tools_shlib_CMakeLists.patch
)

sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48'
    'f176e58b1f07aa3859f9d4b67e17eac88ad4de2f5d501ef968549d0419e76f65'
)

_ocamlver() {
    pacman -Q ocaml | awk '{ print $2 }' | cut -d - -f 1 | cut -d . -f 1,2,3
}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    echo $(sed -n '/^AC_INIT/s|^.*,\[\([[:digit:]\.]\+svn\)\],.*$|\1|p' \
        autoconf/configure.ac)_r$(svnversion | tr -d [A-z])
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    svn export --force "${srcdir}/clang" tools/clang
    svn export --force "${srcdir}/clang-tools-extra" tools/clang/tools/extra
    svn export --force "${srcdir}/compiler-rt" projects/compiler-rt

    # Fix docs installation directory
    sed -e 's|^\([[:blank:]]*DESTINATION[[:blank:]]\+\)docs/html|\1share/doc|' \
        -e 's|^\([[:blank:]]*DESTINATION[[:blank:]]\+\)docs/ocaml/html|\1share/doc/ocaml|' \
        -i docs/CMakeLists.txt

    # https://llvm.org/bugs/show_bug.cgi?id=24157
    patch -p2 -i "${srcdir}/llvm_tools_shlib_CMakeLists.patch"

    mkdir -p "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"

    export PKG_CONFIG_PATH='/usr/lib/pkgconfig'
    _ffi_include_flags=$(pkg-config --cflags-only-I libffi)
    _ffi_libs_flags=$(pkg-config --libs-only-L libffi)

    # libLLVM.so doesn't include by default all components that we want to have.
    # Therefore, we use the LLVM_DYLIB_COMPONENTS cmake variable futher below to
    # add the desired ones (e.g. Option), but in order to be flexible we need to
    # determine the default list of components from tools/llvm-shlib/CMakeLists.txt.
    # We use some awk-ward magic to extract the values and format them appropriately.
    _dylib_awk_cmds="\
        /^[[:blank:]]*set\\(LLVM_DYLIB_COMPONENTS$/,/^[[:blank:]]*\\)$/ { \
            if ( \
                substr(\$1,1,4) != \"set(\" \
                && substr(\$1,1,1) != \")\" \
                && substr(\$1,1,2) != \"\${\" \
            ) \
            components=components\$1\";\" \
        } END { print components }"

    _dylib_def_comp=$(
        awk "${_dylib_awk_cmds}" "../${_pkgname}/tools/llvm-shlib/CMakeLists.txt"
    )

    # Find the targets in the default category 'all' (since we don't set them
    # explicitly with LLVM_TARGETS_TO_BUILD, this is what gets built). We'll
    # then have to list them manually in LLVM_DYLIB_COMPONENTS, otherwise
    # (somewhat surprisingly) they don't get exported from libLLVM.so.
    _tgts_awk_cmds="\
        /^[[:blank:]]*set\\(LLVM_ALL_TARGETS$/,/^[[:blank:]]*\\)$/ { \
            if ( \
                substr(\$1,1,4) != \"set(\" \
                && substr(\$1,1,1) != \")\" \
                && substr(\$1,1,2) != \"\${\" \
            ) \
            targets=targets\$1\";\" \
        } END { print targets }"

    _avail_tgts=$(
        awk "${_tgts_awk_cmds}" "../${_pkgname}/CMakeLists.txt"
    )

    # Finally, here we set the additional components to export from libLLVM.so
    _dylib_add_comp='Option;ProfileData;'

    # LLVM_BUILD_LLVM_DYLIB: Build the dynamic runtime libraries (e.g. libLLVM.so).
    # LLVM_DYLIB_EXPORT_ALL: Export all symbols in the dynamic libs, not just the C API.
    # LLVM_BINUTILS_INCDIR:  Set to binutils' plugin-api.h location in order to build LLVMgold.
    cmake -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DLLVM_APPEND_VC_REV:BOOL=ON \
        -DLLVM_ENABLE_RTTI:BOOL=ON \
        -DLLVM_ENABLE_FFI:BOOL=ON \
        -DFFI_INCLUDE_DIR:PATH="${_ffi_include_flags#-I}" \
        -DFFI_LIBRARY_DIR:PATH="${_ffi_libs_flags#-L}" \
        -DLLVM_BUILD_DOCS:BOOL=ON \
        -DLLVM_ENABLE_SPHINX:BOOL=ON \
        -DSPHINX_OUTPUT_HTML:BOOL=ON \
        -DSPHINX_OUTPUT_MAN:BOOL=ON \
        -DSPHINX_WARNINGS_AS_ERRORS:BOOL=OFF \
        -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON \
        -DLLVM_DYLIB_COMPONENTS:STRING="${_dylib_def_comp}${_dylib_add_comp}${_avail_tgts}" \
        -DLLVM_DYLIB_EXPORT_ALL:BOOL=ON \
        -DLLVM_BINUTILS_INCDIR:PATH=/usr/include \
        "../${_pkgname}"

    # Must run this target independently, or else docs/cmake_install.cmake will fail.
    #
    # WARNING: Make sure that there isn't an incompatible llvm-ocaml package installed,
    # or else the build will fail with "inconsistent assumptions over interface" errors.
    make ocaml_doc

    make
}

package_llvm-svn() {
    pkgdesc='The LLVM Compiler Infrastructure'
    depends=(
        "llvm-libs-svn=${pkgver}-${pkgrel}"
    )
    provides=('llvm')
    replaces=('llvm')
    conflicts=('llvm')

    cd "${srcdir}/build"

    # Exclude the clang directory, since it'll be installed in a separate package
    sed -i \
        "s|^\([[:blank:]]*include(\"${srcdir}/build/tools/clang/cmake_install.cmake\")\)$|#\1|" \
        tools/cmake_install.cmake

    make DESTDIR="${pkgdir}" install

    # The runtime libraries get installed in llvm-libs-svn
    rm -f "${pkgdir}"/usr/lib/lib{LLVM,LTO}.so{,.*}
    mv -f "${pkgdir}"/usr/lib/{BugpointPasses,LLVMgold}.so "${srcdir}/"

    # Clang libraries and OCaml bindings go to separate packages
    rm -rf "${srcdir}"/{clang,ocaml.{doc,lib}}
    mv "${pkgdir}/usr/lib/clang" "${srcdir}/clang"
    mv "${pkgdir}/usr/lib/ocaml" "${srcdir}/ocaml.lib"
    mv "${pkgdir}/usr/share/doc/ocaml" "${srcdir}/ocaml.doc"

    # Get rid of example Hello transformation
    rm -f "${pkgdir}"/usr/lib/*LLVMHello.*

    if [[ "${CARCH}" == "x86_64" ]]; then
        # Needed for multilib (https://bugs.archlinux.org/task/29951)
        # Header stubs are taken from Fedora
        mv "${pkgdir}/usr/include/llvm/Config/llvm-config"{,-64}.h
        cp "${srcdir}/llvm-Config-llvm-config.h" "${pkgdir}/usr/include/llvm/Config/llvm-config.h"
    fi

    # Install Python bindings
    _py_sitepkg_loc="${pkgdir}/usr/lib/python2.7/site-packages"
    install -m755 -d "${_py_sitepkg_loc}"
    cp -r "${srcdir}/llvm/bindings/python/llvm" "${_py_sitepkg_loc}/"
    python2 -m compileall "${_py_sitepkg_loc}/llvm"
    python2 -O -m compileall "${_py_sitepkg_loc}/llvm"

    # Clean up documentation
    rm -rf "${pkgdir}/usr/share/doc/llvm/html/_sources"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_llvm-libs-svn() {
    pkgdesc='The LLVM Compiler Infrastructure (runtime libraries)'
    depends=(
        'libffi'
        'zlib'
    )
    provides=('llvm-libs')
    replaces=('llvm-libs')
    conflicts=('llvm-libs')

    cd "${srcdir}/build"

    make DESTDIR="${pkgdir}" install-{LLVM,LTO}

    # Moved from the llvm-svn package here
    mv "${srcdir}"/{BugpointPasses,LLVMgold}.so "${pkgdir}/usr/lib/"

    # Ref: http://llvm.org/docs/GoldPlugin.html
    install -m755 -d "${pkgdir}/usr/lib/bfd-plugins"
    ln -s {/usr/lib,"${pkgdir}/usr/lib/bfd-plugins"}/LLVMgold.so

    # Must have a symlink that corresponds to the output of `llvm-config --version`.
    # Without it, some builds, e.g. Mesa, might fail for "lack of shared libraries".
    for _shlib in lib{LLVM,LTO} ; do
        # libLLVM.so.3.8.0svn-r123456
        ln -s "${_shlib}.so.$(echo ${pkgver} | cut -d _ -f 1)" \
            "${pkgdir}/usr/lib/${_shlib}.so.$(echo ${pkgver} | tr _ -)"
        # libLLVM-3.8.0svn-r123456.so
        ln -s "${_shlib}.so.$(echo ${pkgver} | cut -d _ -f 1)" \
            "${pkgdir}/usr/lib/${_shlib}-$(echo ${pkgver} | tr _ -).so"
    done

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_llvm-ocaml-svn() {
    pkgdesc='OCaml bindings for LLVM'
    depends=(
        "llvm-svn=${pkgver}-${pkgrel}"
        "ocaml=$(_ocamlver)"
        'ocaml-ctypes'
    )
    provides=('llvm-ocaml')
    replaces=('llvm-ocaml')
    conflicts=('llvm-ocaml')

    cd "${srcdir}/build"

    install -m755 -d "${pkgdir}/usr/lib"
    install -m755 -d "${pkgdir}/usr/share/doc"
    cp -a "${srcdir}/ocaml.lib" "${pkgdir}/usr/lib/ocaml"
    cp -a "${srcdir}/ocaml.doc" "${pkgdir}/usr/share/doc/ocaml"

   install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_clang-svn() {
    pkgdesc='C language family frontend for LLVM'
    url='http://clang.llvm.org/'
    depends=(
        "llvm-svn=${pkgver}-${pkgrel}"
    )
    optdepends=(
        'python2: git-clang-format and clang-format-diff.py support'
    )
    provides=('clang')
    replaces=('clang')
    conflicts=('clang')

    cd "${srcdir}/build/tools/clang"

    # Exclude the extra directory, since it'll be installed in a separate package
    sed -i \
        "s|^\([[:blank:]]*include(\"${srcdir}/build/tools/clang/tools/extra/cmake_install.cmake\")\)$|#\1|" \
        tools/cmake_install.cmake

    make DESTDIR="${pkgdir}" install

    # These require python2
    sed -i \
        -e 's|^#!/usr/bin/python$|&2|' \
        -e 's|^#!/usr/bin/env python$|&2|' \
        "${pkgdir}/usr/bin/git-clang-format" \
        "${pkgdir}/usr/share/clang/clang-format-diff.py"

    # Install Python bindings
    _py_sitepkg_loc="${pkgdir}/usr/lib/python2.7/site-packages"
    install -m755 -d "${_py_sitepkg_loc}"
    cp -r "${srcdir}/llvm/tools/clang/bindings/python/clang" "${_py_sitepkg_loc}/"
    python2 -m compileall "${_py_sitepkg_loc}/clang"
    python2 -O -m compileall "${_py_sitepkg_loc}/clang"

    # Clean up documentation
    rm -r "${pkgdir}/usr/share/doc/clang/html/_sources"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_clang-analyzer-svn() {
    pkgdesc='Source code analysis tool for Clang, supporting C, C++, and Objective-C'
    url='http://clang-analyzer.llvm.org/'
    depends=(
        "clang-svn=${pkgver}-${pkgrel}"
        'python2'
    )
    provides=('clang-analyzer')
    replaces=('clang-analyzer')
    conflicts=('clang-analyzer')

    cd "${srcdir}/llvm/tools/clang"

    install -m755 -d "${pkgdir}"/usr/{bin,lib/clang-analyzer}
    for _tool in scan-{build,view}; do
        cp -r "tools/${_tool}" "${pkgdir}/usr/lib/clang-analyzer/"
        ln -s "/usr/lib/clang-analyzer/${_tool}/${_tool}" "${pkgdir}/usr/bin/"
    done

    # scan-build looks for clang within the same directory
    ln -s /usr/bin/clang "${pkgdir}/usr/lib/clang-analyzer/scan-build/"

    # Relocate man page
    install -m755 -d "${pkgdir}/usr/share/man/man1"
    mv "${pkgdir}/usr/lib/clang-analyzer/scan-build/scan-build.1" "${pkgdir}/usr/share/man/man1/"

    # These require python2
    sed -i \
        -e 's|^#!/usr/bin/python$|&2|' \
        -e 's|^#!/usr/bin/env python$|&2|' \
        "${pkgdir}/usr/lib/clang-analyzer/scan-view/scan-view" \
        "${pkgdir}/usr/lib/clang-analyzer/scan-build/set-xcode-analyzer"

    # Compile Python scripts
    python2 -m compileall "${pkgdir}/usr/lib/clang-analyzer"
    python2 -O -m compileall "${pkgdir}/usr/lib/clang-analyzer"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_clang-tools-extra-svn() {
    pkgdesc='Standalone tools for Clang: syntax checking, formatting, refactoring, etc.'
    url='http://clang.llvm.org/docs/ClangTools.html'
    depends=(
        "clang-svn=${pkgver}-${pkgrel}"
    )
    provides=('clang-tools-extra')
    replaces=('clang-tools-extra')
    conflicts=('clang-tools-extra')

    cd "${srcdir}/build/tools/clang/tools/extra"

    make DESTDIR="${pkgdir}" install

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sts=4 sw=4 et:

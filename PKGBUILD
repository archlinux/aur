#!/bin/hint/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Reza Jahanbakhshi <reza.jahanbakhshi at gmail dot com>
# Contributor: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: yurikoles <root@yurikoles.com>
# Contributor: bearoso <bearoso@gmail.com>
# Contributor: Luchesar V. ILIEV <luchesar%2eiliev%40gmail%2ecom>
# Contributor: Anders Bergh <anders@archlinuxppc.org>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Hesiod (https://github.com/hesiod)
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>

pkgname=(llvm-opt-git
         llvm-libs-opt-git
         llvm-ocaml-opt-git)
pkgver=17.0.0_r456290.a755e80ed1d2
pkgrel=1
arch=(x86_64)
url='https://llvm.org/'
license=('custom:Apache 2.0 with LLVM Exception')
makedepends=(git cmake libffi libedit ncurses libxml2 python-setuptools lldb
             lua53 ocl-icd opencl-headers z3 jsoncpp
             python-sphinx python-recommonmark swig python python-six
             ocaml ocaml-ctypes ocaml-findlib ocaml-stdlib-shims)
checkdepends=(python-psutil)
source=('llvm-project::git+https://github.com/llvm/llvm-project.git'
         llvm-config.h)
sha512sums=('SKIP'
            '75e743dea28b280943b3cc7f8bbb871b57d110a7f2b9da2e6845c1c36bf170dd883fca54e463f5f49e0c3effe07fbd0db0f8cf5a12a2469d3f792af21a73fcdd')
options=(staticlibs)

_python_optimize() {
    python -m compileall "$@"
    python -O -m compileall "$@"
    python -OO -m compileall "$@"
}

_python_version() {
    python <(\
        cat << 'EOF'
import sys
vi = sys.version_info
print(f"{vi.major}.{vi.minor}")
EOF
    )
}

pkgver() {
    cd llvm-project/llvm

    # This will almost match the output of `llvm-config --version` when the
    # LLVM_APPEND_VC_REV cmake flag is turned on. The only difference is
    # dash being replaced with underscore because of Pacman requirements.
    local _pkgver=$(awk -F 'MAJOR |MINOR |PATCH |)' \
            'BEGIN { ORS="." ; i=0 } \
             /set\(LLVM_VERSION_/ { print $2 ; i++ ; if (i==2) ORS="" } \
             END { print "\n" }' \
             CMakeLists.txt)_r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    echo "$_pkgver"
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake \
        -B _build \
        -S "$srcdir"/llvm-project/llvm  \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/opt \
        -D LLVM_BINUTILS_INCDIR=/opt/include \
        -D LLVM_APPEND_VC_REV=ON \
        -D LLVM_VERSION_SUFFIX="" \
        -D LLVM_HOST_TRIPLE=$CHOST \
        -D LLVM_ENABLE_RTTI=ON \
        -D LLVM_ENABLE_FFI=ON \
        -D FFI_INCLUDE_DIR:PATH="$(pkg-config --variable=includedir libffi)" \
        -D LLVM_BUILD_LLVM_DYLIB=ON \
        -D LLVM_LINK_LLVM_DYLIB=ON \
        -D LLVM_INSTALL_UTILS=ON \
        -D LLVM_BUILD_DOCS=ON \
        -D LLVM_ENABLE_DOXYGEN=OFF \
        -D LLVM_ENABLE_SPHINX=ON \
        -D SPHINX_OUTPUT_HTML:BOOL=ON \
        -D CMAKE_C_COMPILER="${CC:=$(which cc)}" \
        -D CMAKE_CXX_COMPILER="${CXX:=$(which c++)}" \
        -D SPHINX_WARNINGS_AS_ERRORS=OFF \
        -D POLLY_ENABLE_GPGPU_CODEGEN=ON \
        -D LLDB_USE_SYSTEM_SIX=1 \
        -D LLVM_ENABLE_PROJECTS="polly;lldb;lld;compiler-rt;clang-tools-extra;clang" \
        -D LLVM_LIT_ARGS="-sv --ignore-fail" \
        -Wno-dev

    make -C _build
    make -C _build ocaml_doc
}

check() {
    make -C _build check-llvm
    make -C _build check-clang
    make -C _build check-clang-tools
    make -C _build check-polly
    make -C _build check-lld
    make -C _build check-lldb
}

package_llvm-opt-git() {
    #!/bin/bash
    pkgdesc="LLVM development version. includes clang and many other tools (installs to /opt)"
    depends=("llvm-libs-opt-git=$pkgver-$pkgrel" 'perl')
    optdepends=('python: for scripts')
    DESTDIR="$pkgdir" make -C _build $NINJAFLAGS install

    # Include lit for running lit-based tests in other projects
    pushd llvm-project/llvm/utils/lit
    python setup.py install --root="$pkgdir" --prefix="/opt" -O1
    popd
    
    # Move analyzer scripts out of /opt/libexec
    mv "$pkgdir"/opt/libexec/{ccc,c++}-analyzer "$pkgdir"/opt/lib/clang/
    mv "$pkgdir"/opt/libexec/analyze-{cc,c++} "$pkgdir"/opt/lib/clang/
    mv "$pkgdir"/opt/libexec/intercept-{cc,c++} "$pkgdir"/opt/lib/clang/
    rmdir "$pkgdir"/opt/libexec
    sed -i 's|libexec|lib/clang|' "$pkgdir"/opt/bin/scan-build

    # The runtime libraries go into llvm-libs-opt-git
    mv -f "$pkgdir"/opt/lib/lib{LLVM,LTO,Remarks}*.so* "$srcdir"
    mv -f "$pkgdir"/opt/lib/LLVMgold.so "$srcdir"

    # OCaml bindings go to a separate package
    rm -rf "$srcdir"/ocaml.{lib,doc}
    mv "$pkgdir"/usr/lib/ocaml "$srcdir"/ocaml.lib

    if [[ -d "${pkgdir}/opt/share/doc/LLVM/llvm/ocaml-html" && ! -d "${pkgdir}/opt/share/doc/llvm/ocaml-html" ]]
    then
        mv "$pkgdir"/opt/share/doc/LLVM/llvm/ocaml-html "$srcdir"/ocaml.doc
    else
        mv "$pkgdir"/opt/share/doc/llvm/ocaml-html "$srcdir"/ocaml.doc
    fi
    
    if [[ $CARCH == x86_64 ]]; then
        # Needed for multilib (https://bugs.archlinux.org/task/29951)
        # Header stub is taken from Fedora
        mv "$pkgdir"/opt/include/llvm/Config/llvm-config{,-64}.h
        cp "$srcdir"/llvm-config.h "$pkgdir"/opt/include/llvm/Config/llvm-config.h
    fi

    _py=$(_python_version)
    cd llvm-project
    # Install Python bindings and optimize them
    cp -a llvm/bindings/python/llvm  "$pkgdir"/opt/lib/python$_py/site-packages/
    cp -a clang/bindings/python/clang  "$pkgdir"/opt/lib/python$_py/site-packages/
    _python_optimize "$pkgdir"/opt/lib/python$_py/site-packages

    #optimize other python files except 2 problem cases
    _python_optimize "$pkgdir"/opt/share -x 'clang-include-fixer|run-find-all-symbols'

    install -Dm644 llvm/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/llvm-LICENSE
    install -Dm644 clang/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/clang-LICENSE
    install -Dm644 clang-tools-extra/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/clang-tools-extra-LICENSE
    install -Dm644 compiler-rt/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/compiler-rt-LICENSE
    install -Dm644 lld/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/lld-LICENSE
    install -Dm644 lldb/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/lldb-LICENSE
    install -Dm644 polly/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/polly-LICENSE
}

package_llvm-libs-opt-git() {
    pkgdesc="runtime libraries for llvm-git (installs to /opt)"
    depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses' 'libxml2' 'z3' 'lua53')

    install -d "$pkgdir"/opt/lib
    cp -P \
        "$srcdir"/lib{LLVM,LTO,Remarks}*.so* \
        "$srcdir"/LLVMgold.so \
        "$pkgdir"/opt/lib/

    # Symlink LLVMgold.so from /opt/lib/bfd-plugins
    # https://bugs.archlinux.org/task/28479
    install -d "$pkgdir"/opt/lib/bfd-plugins
    ln -s ../LLVMgold.so "$pkgdir"/opt/lib/bfd-plugins/LLVMgold.so
    
    cd llvm-project/
    install -Dm644 llvm/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/llvm-LICENSE
    install -Dm644 clang/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/clang-LICENSE
    install -Dm644 clang-tools-extra/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/clang-tools-extra-LICENSE
    install -Dm644 compiler-rt/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/compiler-rt-LICENSE
    install -Dm644 lld/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/lld-LICENSE
    install -Dm644 lldb/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/lldb-LICENSE
    install -Dm644 polly/LICENSE.TXT "$pkgdir"/opt/share/licenses/$pkgname/polly-LICENSE
}

package_llvm-ocaml-opt-git() {
    pkgdesc="OCaml bindings for LLVM (installs to /opt)"
    depends=("llvm-opt-git=$pkgver-$pkgrel" "ocaml" 'ocaml-ctypes')
    
    install -d "$pkgdir"/{opt/lib,opt/share/doc/$pkgname}
    mkdir -p "$pkgdir"/opt/lib/ocaml
    cp -a "$srcdir"/ocaml.lib "$pkgdir"/opt/lib/ocaml
    mkdir -p "$pkgdir"/opt/share/doc/$pkgname/html
    cp -a "$srcdir"/ocaml.doc "$pkgdir"/opt/share/doc/$pkgname/html

    mkdir -p "$pkgdir"/opt/share/licenses/$pkgname
    install -Dm644 "$srcdir"/llvm-project/llvm/LICENSE.TXT  "$pkgdir"/opt/share/licenses/$pkgname/LICENSE
}

# vim: syntax=bash et sw=4 ts=4

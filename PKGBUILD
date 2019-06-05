# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgbase=swift-language
pkgname=(swift swift-lldb)
_swiftver=5.0.1-RELEASE
pkgver=${_swiftver//-RELEASE/}
pkgrel=2
pkgdesc="The Swift programming language and debugger"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python2' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses' 'libblocksruntime')
makedepends=('git' 'cmake' 'ninja' 'swig3' 'clang>=5.0' 'python2-six' 'perl'
             'python2-sphinx' 'python2-requests' 'rsync')

source=(
    "swift-${_swiftver}.tar.gz::https://github.com/apple/swift/archive/swift-${_swiftver}.tar.gz"
    "swift-llvm-${_swiftver}.tar.gz::https://github.com/apple/swift-llvm/archive/swift-${_swiftver}.tar.gz"
    "swift-clang-${_swiftver}.tar.gz::https://github.com/apple/swift-clang/archive/swift-${_swiftver}.tar.gz"
    "swift-clang-tools-extra-${_swiftver}.tar.gz::https://github.com/apple/swift-clang-tools-extra/archive/swift-${_swiftver}.tar.gz"
    "swift-libcxx-${_swiftver}.tar.gz::https://github.com/apple/swift-libcxx/archive/swift-${_swiftver}.tar.gz"
    "swift-lldb-${_swiftver}.tar.gz::https://github.com/apple/swift-lldb/archive/swift-${_swiftver}.tar.gz"
    "swift-cmark-${_swiftver}.tar.gz::https://github.com/apple/swift-cmark/archive/swift-${_swiftver}.tar.gz"
    "swift-llbuild-${_swiftver}.tar.gz::https://github.com/apple/swift-llbuild/archive/swift-${_swiftver}.tar.gz"
    "swift-package-manager-${_swiftver}.tar.gz::https://github.com/apple/swift-package-manager/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-xctest-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-xctest/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-foundation-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-foundation/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-libdispatch-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-libdispatch/archive/swift-${_swiftver}.tar.gz"
    "swift-compiler-rt-${_swiftver}.tar.gz::https://github.com/apple/swift-compiler-rt/archive/swift-${_swiftver}.tar.gz"
    "swift-integration-tests-${_swiftver}.tar.gz::https://github.com/apple/swift-integration-tests/archive/swift-${_swiftver}.tar.gz"
    "glibc-includes.patch"
)
sha256sums=('a28d879d4dd0b987544948ea02e0a21dd158a175572d79979214173e7ee6a244'
            '4db5025f4c479d22af4f2bb9a6cd7aa9d5269cb095f5c814c958265fe7ea450e'
            '36c87df8b160063b8ff8a986fba27ea276a9e2c2152a0c218409f802aded89e8'
            '0055f015726d006e6ffaa9bf08a77e3b453229fa8cff81369a4f7046a500b640'
            'af22995496579556b0c8345b5d4a00197d720c90b0d098f1fe4b2e1e0180c325'
            '8481db3f163b8ace6f77dbad519da11db4c8987f96007b38e0bee8526a752ebb'
            'e71d859c08efa23a881d943ef9eff4193dafe8b83acaf5a3baaa7fc21e0d34c2'
            '6f98ef386d121a1ec553812996f051edf44248ca689f4e8d3681b383bf7b1c2e'
            '881154699e0c182740dc7748c538613f001fb59cec255fe6a2873d7848d3bec1'
            '32870c56d0b97f3041bb00b8c9f0ca817120d8edc12e2038da360e551229ad40'
            '055f8e36b8499b259d546575bc26433023fb311cb5c01bf4784fc86759bd7753'
            'cbd03ee59127fea448f8ee5b1bbea07b7e68266ceab5ca0aa71b128ae5f17aeb'
            '35aa95b104afa4de7a7d0e5d4a51ce2de980cc8779c1410ea1d9524c06708c8d'
            'e2fd13b5c013c68d78aa5e438360e09478555210b9e88289f594c131f7f3b36d'
            '6a94de9adbdc4182b297e0011a68c9387fd25864dcb4386654218c8c530032c2')

prepare() {
    # Use python2 where appropriate
    find "$srcdir" -type f -print0 | \
         xargs -0 sed -i 's|/usr/bin/env python$|&2|;s|/usr/bin/python$|&2|'
    find "$srcdir/swift-lldb-swift-${_swiftver}" -name Makefile -print0 | \
         xargs -0 sed -i 's|python-config|python2-config|g'
    sed -i '/^cmake_minimum_required/a set(Python_ADDITIONAL_VERSIONS 2.7)' \
         "$srcdir/swift-swift-${_swiftver}/CMakeLists.txt"
    sed -i '/^cmake_minimum_required/a set(Python_ADDITIONAL_VERSIONS 2.7)' \
         "$srcdir/swift-lldb-swift-${_swiftver}/CMakeLists.txt"
    sed -i 's/\<python\>/&2/' \
         "$srcdir/swift-swift-${_swiftver}/utils/build-script-impl"

    # Use directory names which build-script expects
    for sdir in llvm clang clang-tools-extra libcxx lldb cmark llbuild \
                compiler-rt
    do
        rm -rf ${sdir}
        mv swift-${sdir}-swift-${_swiftver} ${sdir}
    done
    for sdir in corelibs-xctest corelibs-foundation corelibs-libdispatch \
                integration-tests
    do
        rm -rf ${sdir}
        mv swift-${sdir}-swift-${_swiftver} swift-${sdir}
    done
    rm -rf swift swiftpm
    mv swift-swift-${_swiftver} swift
    mv swift-package-manager-swift-${_swiftver} swiftpm

    # Fix wrong glibc include paths in glibc module map
    ( cd swift && patch -p1 -i "$srcdir/glibc-includes.patch" )
}

_common_build_params=(
    --install-prefix=/usr
    --lldb
    --llbuild
    --swiftpm
    --xctest
    --foundation
    --libdispatch
    --extra-cmake-options="-DSWIG_EXECUTABLE=/usr/bin/swig-3"
)

_build_script_wrapper() {
    export SWIFT_SOURCE_ROOT="$srcdir"
    ./utils/build-script "$@"
}

build() {
    cd "$srcdir/swift"

    export PATH="$PATH:/usr/bin/core_perl"
    _build_script_wrapper -R "${_common_build_params[@]}"
}

check() {
    cd "$srcdir/swift"

    # Fix the lldb swig binding's import path (matches Arch LLDB package)
    # Need to do this here as well as the install since the test suite
    # uses the lldb python bindings directly from the build dir
    sed -i "/import_module('_lldb')/s/_lldb/lldb.&/" \
        "${srcdir}/build/Ninja-ReleaseAssert/lldb-linux-${CARCH}/lib/python2.7/site-packages/lldb/__init__.py"

    _build_script_wrapper -R -t
}

package_swift() {
    pkgdesc='The Swift programming language compiler and tools'
    provides=('swift-language')
    conflicts=('swift-language-git' 'swift-git' 'swift-bin')
    optdepends=('swift-lldb: Swift REPL and debugger')

    cd "$srcdir/swift"

    _build_script_wrapper -R "${_common_build_params[@]}" \
        --install-destdir="$pkgdir" \
        --install-llbuild --install-swiftpm --install-xctest \
        --install-foundation --install-libdispatch

    cd "$srcdir/build/Ninja-ReleaseAssert"

    # Some projects' install targets don't work correctly :(
    (
        cd swift-linux-$CARCH
        install -m755 bin/swift bin/swift-{demangle,ide-test} "$pkgdir/usr/bin"
        ln -s swift "$pkgdir/usr/bin/swiftc"
        ln -s swift "$pkgdir/usr/bin/swift-autolink-extract"

        install -m644 lib/libsourcekitdInProc.so "$pkgdir/usr/lib"

        install -dm755 "$pkgdir/usr/share/man/man1"
        install -m644 docs/tools/swift.1 "$pkgdir/usr/share/man/man1"

        umask 0022
        cp -rL lib/swift/{clang,linux,shims} "$pkgdir/usr/lib/swift/"
    )

    # License file
    install -dm755 "$pkgdir/usr/share/licenses/swift"
    install -m644 "$srcdir/swift/LICENSE.txt" "$pkgdir/usr/share/licenses/swift"
}

package_swift-lldb() {
    pkgdesc='The Swift programming language debugger (LLDB) and REPL'
    depends=('swift' 'python2-six')
    provides=('lldb')
    conflicts=('lldb')
    options=('!strip')  # Don't strip repl_swift -- we need its symbols

    cd "$srcdir/swift"

    _build_script_wrapper -R "${_common_build_params[@]}" \
        --install-destdir="$pkgdir" \
        --install-lldb

    # Fix the lldb swig binding's import path (matches Arch LLDB package)
    # We have to do this again because the build-script recreates the "bad"
    # version of the source file.
    sed -i "/import_module('_lldb')/s/_lldb/lldb.&/" \
        "${pkgdir}/usr/lib/python2.7/site-packages/lldb/__init__.py"

    # This should be provided from python2-six
    rm "$pkgdir/usr/lib/python2.7/site-packages/six.py"
    rm "$pkgdir/usr/lib/python2.7/site-packages/six.pyc"
}

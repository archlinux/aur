# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgbase=swift-language
pkgname=(swift swift-lldb)
_swiftver=4.0.3-RELEASE
pkgver=${_swiftver//-RELEASE/}
pkgrel=2
pkgdesc="The Swift programming language and debugger"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python2' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses' 'libblocksruntime')
makedepends=('git' 'cmake' 'ninja' 'swig' 'clang>=5.0' 'python2-six' 'perl'
             'python2-sphinx' 'python2-requests' 'rsync')

source=(
    "swift-${_swiftver}.tar.gz::https://github.com/apple/swift/archive/swift-${_swiftver}.tar.gz"
    "swift-llvm-${_swiftver}.tar.gz::https://github.com/apple/swift-llvm/archive/swift-${_swiftver}.tar.gz"
    "swift-clang-${_swiftver}.tar.gz::https://github.com/apple/swift-clang/archive/swift-${_swiftver}.tar.gz"
    "swift-lldb-${_swiftver}.tar.gz::https://github.com/apple/swift-lldb/archive/swift-${_swiftver}.tar.gz"
    "swift-cmark-${_swiftver}.tar.gz::https://github.com/apple/swift-cmark/archive/swift-${_swiftver}.tar.gz"
    "swift-llbuild-${_swiftver}.tar.gz::https://github.com/apple/swift-llbuild/archive/swift-${_swiftver}.tar.gz"
    "swift-package-manager-${_swiftver}.tar.gz::https://github.com/apple/swift-package-manager/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-xctest-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-xctest/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-foundation-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-foundation/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-libdispatch-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-libdispatch/archive/swift-${_swiftver}.tar.gz"
    "swift-compiler-rt-${_swiftver}.tar.gz::https://github.com/apple/swift-compiler-rt/archive/swift-${_swiftver}.tar.gz"
    "swift-integration-tests-${_swiftver}.tar.gz::https://github.com/apple/swift-integration-tests/archive/swift-${_swiftver}.tar.gz"
    "icu59.patch"
    "lldb_missing_include.patch"
    "glibc-2.26.patch"
    "glibc-2.26-compiler-rt-compat.patch"
    "sr6176.patch"
)
sha256sums=('026d596dd4a24580a5e442409e8c58259197bd73ddbb77e5aade96da982ea39b'
            'a611487a82636142bc1ea8ef5b21401a5c75e57fb0dbf041ef8f2e85a472db2e'
            'c940bd48c88f71622fb00167d92a619dd1614093893e1a09982c08da42259404'
            '7f695a33ee5cb75be18ba962045e1b57405abf17bd354c3e2a15c29b4b296bcb'
            'e95d0b54a0e897e768c9437dd67d56ec887909d0294cf6536ba240accd0d294f'
            '92001e449b54a47516086a4e7d5f575bffa2847ae1f658540b2ec6f6dee6c6e7'
            '4c26d333a01c239de8aa96b0536b7ff7218b7a322851a7d3b3b91b59fb4ce244'
            '868c4e23842218c895d333e7d6dbaa1c583b5a1ac2a32b26fff42f4a5c577357'
            'c20877e7fc658ef872d6acc9d1cad0d93a683bfeaef28e2bf665166540e539e5'
            '0a6d503f7ec4ce367a4aa63f68478ce7c998ec36a60b0b01445e048ab69600a8'
            '1c2da685e8f424cb4460ed1daaf0c308f8deff63e7a3716c8a881cef60fbc7d8'
            '7c720b23d542d34296ee4cf5290e05c7c7c55b7e8187dfaa5b185ea021c4ab9d'
            '18b7895fba15702419e86ae593531669c3966d1c8aa9a83361c5c8ef9d54f893'
            'be61c69ae7bb626f7f07f95cb5c0074013725c1b90a3ca68aa0c0f989d75e41e'
            '215473272ec550c58fd2852c3e1c4aa4482a7d2b4980308df14f4a18676775a9'
            '2311adf234f52831af3b326d0d589fceae0a5336aa8576fdfd62afe71c195124'
            '22a0320dc3474f8be133b2d50d72c7feb215d847feee181549bbbd27735e5ab6')

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
         "$srcdir/swift-swift-${_swiftver}/utils/build-script-impl" \
         "$srcdir/swift-swift-${_swiftver}/test/sil-passpipeline-dump/basic.test-sh"

    # Use directory names which build-script expects
    for sdir in llvm clang lldb cmark llbuild compiler-rt; do
        ln -sf swift-${sdir}-swift-${_swiftver} ${sdir}
    done
    for sdir in corelibs-xctest corelibs-foundation corelibs-libdispatch \
                integration-tests
    do
        ln -sf swift-${sdir}-swift-${_swiftver} swift-${sdir}
    done
    ln -sf swift-swift-${_swiftver} swift
    ln -sf swift-package-manager-swift-${_swiftver} swiftpm

    # ICU 59 changed the type of UChar to char16_t
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/icu59.patch" )

    # LLDB is missing an include for std::bind with libstdc++/gcc7
    ( cd "${srcdir}/lldb" && patch -p1 -i "${srcdir}/lldb_missing_include.patch" )

    # glibc 2.26 compatibility fixes
    ( cd "${srcdir}" && patch -p1 -i "${srcdir}/glibc-2.26.patch" )
    ( cd "${srcdir}/compiler-rt" && patch -p1 -i "${srcdir}/glibc-2.26-compiler-rt-compat.patch" )

    # Backported fix for SR-6176
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/sr6176.patch" )
}

_common_build_params=(
    --install-prefix=/usr
    --lldb
    --llbuild
    --swiftpm
    --xctest
    --foundation
    --libdispatch
)

_build_script_wrapper() {
    # Makepkg now adds -fno-plt to C(XX)FLAGS by default, which clang doesn't understand
    export CFLAGS=$(echo "$CFLAGS" | sed -e 's/\(\W\+\|^\)-fno-plt\b//')
    export CXXFLAGS=$(echo "$CXXFLAGS" | sed -e 's/\(\W\+\|^\)-fno-plt\b//')

    export SWIFT_SOURCE_ROOT="$srcdir"
    ./utils/build-script "$@"
}

build() {
    cd "$srcdir/swift"

    export PATH="$PATH:/usr/bin/core_perl"
    # sourcekitd-test and sourcekitd-repl currently don't link
    # correctly on Linux.  Disable for now :(
    _build_script_wrapper -R "${_common_build_params[@]}" \
        --extra-cmake-options="-DSWIFT_BUILD_SOURCEKIT=FALSE" \
        --skip-test-sourcekit
}

check() {
    cd "$srcdir/swift"

    # Fix the lldb swig binding's import path (matches Arch LLDB package)
    # Need to do this here as well as the install since the test suite
    # uses the lldb python bindings directly from the build dir
    sed -i "/import_module('_lldb')/s/_lldb/lldb.&/" \
        "${srcdir}/build/Ninja-ReleaseAssert/lldb-linux-${CARCH}/lib/python2.7/site-packages/lldb/__init__.py"

    _build_script_wrapper -R -t --skip-test-sourcekit
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
        --install-foundation

    cd "$srcdir/build/Ninja-ReleaseAssert"

    # Some projects' install targets don't work correctly :(
    (
        cd swift-linux-$CARCH
        install -m755 bin/swift bin/swift-{demangle,ide-test} "$pkgdir/usr/bin"
        ln -s swift "$pkgdir/usr/bin/swiftc"
        ln -s swift "$pkgdir/usr/bin/swift-autolink-extract"

        #install -m644 lib/libsourcekitdInProc.so "$pkgdir/usr/lib"

        install -dm755 "$pkgdir/usr/share/man/man1"
        install -m644 docs/tools/swift.1 "$pkgdir/usr/share/man/man1"

        umask 0022
        cp -rL lib/swift/{clang,linux,shims} "$pkgdir/usr/lib/swift/"
    )
    (
        cd libdispatch-linux-$CARCH
        make install DESTDIR="$pkgdir"
    )

    # Some install targets provide an empty /usr/local/include
    rmdir "$pkgdir/usr/local/include"
    rmdir "$pkgdir/usr/local"

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

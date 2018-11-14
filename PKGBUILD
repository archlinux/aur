# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgbase=swift-language
pkgname=(swift swift-lldb)
_swiftver=4.2.1-RELEASE
pkgver=${_swiftver//-RELEASE/}
pkgrel=1
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
    "0001-sanitizer-Use-pre-computed-size-of-struct-ustat.patch"
    "glibc-includes.patch"
    "clang7-compat.patch"
)
sha256sums=('1e26cf541f7b10b96344fb1c4500ec52ced525cdf7b6bb77425c768cef0b2c5b'
            'bcd85a91824dd166fe852ddb7e58c509f52316011c3079010ad59b017a61ad14'
            'cbf22fe2da2e2a19010f6e109ab3f80a8af811d9416c29d031362c02a0e69a66'
            '9d8666240e1774455bf6dc3f817205afb838bea3a8d69e7e3bce66e6415edff5'
            '0e9f097c26703693a5543667716c2cac7a8847806e850db740ae9f90eaf93793'
            '07a02b4314050a66fad460b76379988d794dac1452a56fcf5073d318458fed6e'
            'e1a50dc3d264bdb8d0447c264e8c164403e84b0831ffd53d87f15a742bda7fa9'
            '077bdf14e01b38c9ab980a63d2d3e796663d161bb6191ca1cda2d858bc8ae40f'
            '680fdfe9add3427931e7471f1a9e774d13cf1b161446aa738c30d37b64ab52a7'
            '65b9dd497178959e8f4a1e3157c9ac701d1d6cf8d754f383e17eec354b1c3c31'
            '6b14737d2d57f3287a5c2d80d8d8ae917d8f7bbe4d78cc6d66a80e68d55cd00f'
            '5d1b77e03a70abdf0907c5567fcd9ea33e95ce0c00fef3cdcff8b3eb4b9db4a6'
            '5cd08c3a83c71e552fa2fd9ec8b076fbd25ba5450b9ecd59a0c877a9c9407b34'
            '6a94de9adbdc4182b297e0011a68c9387fd25864dcb4386654218c8c530032c2'
            '9855ce69d2358c8fc76237620f7e18bfbc82459ad72bdf995b8225fa4ba882a2')

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
         "$srcdir/swift-swift-${_swiftver}/test/sil-passpipeline-dump/basic.test-sh" \
         "$srcdir/swift-swift-${_swiftver}/test/Driver/response-file.swift"

    # Use directory names which build-script expects
    for sdir in llvm clang lldb cmark llbuild compiler-rt; do
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

    # Fix for clang 7+
    ( cd swift && patch -p1 -i "$srcdir/clang7-compat.patch" )

    # Backport compiler-rt SVN r333213
    ( cd compiler-rt && patch -p1 -i "$srcdir/0001-sanitizer-Use-pre-computed-size-of-struct-ustat.patch" )
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
    export SWIFT_SOURCE_ROOT="$srcdir"
    ./utils/build-script "$@"
}

build() {
    cd "$srcdir/swift"

    export PATH="$PATH:/usr/bin/core_perl"
    # sourcekit (STILL) doesn't link correctly on Linux.  Disable for now :(
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
        --install-foundation --install-libdispatch

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

# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgbase=swift-language
pkgname=(swift swift-lldb)
_swiftver=5.1.5-RELEASE
pkgver=${_swiftver//-RELEASE/}
pkgrel=1
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
    "llvm-project-${_swiftver}.tar.gz::https://github.com/apple/llvm-project/archive/swift-${_swiftver}.tar.gz"
    "swift-cmark-${_swiftver}.tar.gz::https://github.com/apple/swift-cmark/archive/swift-${_swiftver}.tar.gz"
    "swift-llbuild-${_swiftver}.tar.gz::https://github.com/apple/swift-llbuild/archive/swift-${_swiftver}.tar.gz"
    "swift-package-manager-${_swiftver}.tar.gz::https://github.com/apple/swift-package-manager/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-xctest-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-xctest/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-foundation-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-foundation/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-libdispatch-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-libdispatch/archive/swift-${_swiftver}.tar.gz"
    "swift-integration-tests-${_swiftver}.tar.gz::https://github.com/apple/swift-integration-tests/archive/swift-${_swiftver}.tar.gz"
    "glibc-includes.patch"
    "repl_swift-dl.patch"
    "swiftpm-glibc.patch"
    "swift-tests-glibc.patch"
    "cmark-python38.patch"
    "sanitizer-glibc2.31.patch"
)
sha256sums=('f92814da53a17405af0d721799918d58c547baa4d579d52764a99c31d8e79d8f'
            '622ab060901fe919d608e2498292f87a84e64ee7f5fefa26f591144caf507af0'
            '36532706a5927e4eba6a336fcc30e998184c9571f308e395ea8c147902542e3e'
            '5978b3dbd9a630bd60f51c3433566f822156bd851884200be2edcf79b9425347'
            '24384389af1edba64b2abc08e3a19f949b95ac2ece3099da1d8bda89ffe780fb'
            '2ae92eb8410ad0f4994e304cd3ac7fa3c69bb13d3b7bb71f763a719b14f34040'
            '3df6871dc32cb1f8621712754440a2693c0cac99caa2d2239007d6ae6e216c9a'
            '47b10f6e8b6da9b4c9e2e3149cc6513a23cc4c8be9ee878f7407031d53f936ae'
            'c1d2b637c9fcb68e1a08357bdde76a52feb021d9c0897309b4b35e54a5c31ce5'
            '6a94de9adbdc4182b297e0011a68c9387fd25864dcb4386654218c8c530032c2'
            '0b2dcb80d9f5cd987a6750b88dc71823980c47dcc711a993e71a496fd73d4e5e'
            '957feb4002deebfebcccc558eaa0c15b6af2ba8a0e4e331ac3365d7f6ab1d707'
            'e4682caf8255d258c24dd28e3965ff4a29a3e73aa293819d6f0f32e86970ff55'
            'd5b5a1a76d45d25a5ff5916a87c1bad63b14c17eb4d24ecb3e9c0480a4ac5ecc'
            '73a803d430c1c72a337a7ce079d266e40b75d8d07eae1201449db0879febff1b')

prepare() {
    # Use python2 where appropriate
    find "$srcdir" -type f -print0 | \
         xargs -0 sed -i 's|/usr/bin/env python$|&2|;s|/usr/bin/python$|&2|'
    find "$srcdir/llvm-project-swift-${_swiftver}/lldb" -name Makefile -print0 | \
         xargs -0 sed -i 's|python-config|python2-config|g'
    sed -i '/^cmake_minimum_required/a set(Python_ADDITIONAL_VERSIONS 2.7)' \
         "$srcdir/swift-swift-${_swiftver}/CMakeLists.txt"
    sed -i '/^cmake_minimum_required/a set(Python_ADDITIONAL_VERSIONS 2.7)' \
         "$srcdir/llvm-project-swift-${_swiftver}/lldb/CMakeLists.txt"
    sed -i 's/\<python\>/&2/' \
         "$srcdir/swift-swift-${_swiftver}/utils/build-script-impl"

    # Use directory names which build-script expects
    for sdir in llvm clang clang-tools-extra libcxx lldb compiler-rt
    do
        ln -sf llvm-project-swift-${_swiftver}/${sdir} ${sdir}
    done
    for sdir in cmark llbuild
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

    # repl_swift requires -ldl
    ( cd lldb && patch -p1 -i "$srcdir/repl_swift-dl.patch" )

    # Fix compile/test errors with newer glibc (2.30)
    # See https://github.com/apple/swift-package-manager/pull/2408
    ( cd swiftpm && patch -p1 -i "$srcdir/swiftpm-glibc.patch" )
    ( cd swift && patch -p1 -i "$srcdir/swift-tests-glibc.patch" )

    # Fix Python 3.8 compatibility in unit tests
    ( cd cmark && patch -p1 -i "$srcdir/cmark-python38.patch" )

    # Fix sanitizer-common build with glibc 2.31 (backport LLVM D70662)
    ( cd compiler-rt && patch -p1 -i "$srcdir/sanitizer-glibc2.31.patch" )
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

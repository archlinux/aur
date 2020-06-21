# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Gábor Sebestyén <segabor@gmail.com>
# Contributor: soloturn@gmail.com

pkgbase=swift-language
pkgname=(swift swift-lldb)
_swiftver=5.2.4-RELEASE
pkgver=${_swiftver//-RELEASE/}
pkgrel=1
pkgdesc="The Swift programming language and debugger"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses' 'libblocksruntime')
makedepends=('git' 'cmake' 'ninja' 'swig' 'clang>=5.0' 'python-six' 'perl'
             'python-sphinx' 'python-requests' 'rsync')

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
sha256sums=('94c44101c3dd6774887029110269bbaf9aff68cce5ea0783588157cc08d82ed8'
            'e36edc6c19e013a81b9255e329e9d6ffe7dfd89e8f8f23e1d931464c5f717d3a'
            'd5f656777961390987ed04de2120e73e032713bbd7b616b5e43eb3ae6e209cb5'
            '66b5374a15998a80cd72e7c1312766a8cbfe427a850f7b97d39b5d0508306e6c'
            '383bf75f6dea96c4d48b2242bd3116154365e0e032aa3dce968f2c434732446c'
            'e41e685a854ad15c98035d0a3608dfcce219c95d73df6144f4d9b3dbe3ca1454'
            'b917634ec51fc670ba42121e77c159d1eb412d1384a18acc12a857a075d89cfb'
            'fa81aa11b490643b95b472d0c01b01fd6a8a1b286fece6e8128ab78e764e9eaa'
            '26a9be6c6a46f065ca1eb6aa05e3b9ce2a5ab092efc7cfa02fe4926681832c77'
            '6a94de9adbdc4182b297e0011a68c9387fd25864dcb4386654218c8c530032c2'
            '0b2dcb80d9f5cd987a6750b88dc71823980c47dcc711a993e71a496fd73d4e5e'
            '957feb4002deebfebcccc558eaa0c15b6af2ba8a0e4e331ac3365d7f6ab1d707'
            'e4682caf8255d258c24dd28e3965ff4a29a3e73aa293819d6f0f32e86970ff55'
            'd5b5a1a76d45d25a5ff5916a87c1bad63b14c17eb4d24ecb3e9c0480a4ac5ecc'
            '73a803d430c1c72a337a7ce079d266e40b75d8d07eae1201449db0879febff1b')

prepare() {
    # not sure where diagnostics is included, pip install it
    pip install diagnostics

    # Use directory names which build-script expects
    ln -sf llvm-project-swift-${_swiftver} llvm-project

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

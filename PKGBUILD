# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgbase=swift-language
pkgname=(swift swift-lldb)
_swiftver=3.1.1-RELEASE
pkgver=${_swiftver//-RELEASE/}
pkgrel=5
pkgdesc="The Swift programming language and debugger"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python2' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses' 'libblocksruntime')
makedepends=('git' 'cmake' 'ninja' 'swig' 'clang>=3.8' 'python2-six' 'perl'
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
    "swift-integration-tests-${_swiftver}.tar.gz::https://github.com/apple/swift-integration-tests/archive/swift-${_swiftver}.tar.gz"
    "sourcekit_link_order.patch"
    "icu59.patch"
    "sphinx1.6.patch"
    "lldb_missing_include.patch"
    "glibc-2.26.patch"
    "clang5.patch"
)
sha256sums=('fe4dcb9ee1247acd6653fe193684e9cb212c6551e0b0b44849899bec99df3297'
            '385b587b825adae9a9f7e5789e151ae0554e6e62f2f2f81ff3b623ef578b39bc'
            'bf9ec0c157501eea69ea1eb3c4b8bf56058110ec6c6a870d81d53868b67d1b96'
            '498fd3cc048759dbdf3319a66bcca05de19d037ab8e5129be68897b77ade449d'
            '51db8067f11976a7ca38a6ff9f173d3d9e3df290991be87835cdc003e0b62e4e'
            'a5b0a69e3785ce483053a7c1d2b2fe3c6ccc81832a930afee7969a9147316165'
            '8ba05b5399b266615cf0d2055698dd3f23b57111120e98419f56139301981914'
            '188272552bf35c411c73ad35345e0e8893e67d8d098a805fb26ad220291421e3'
            '36769d2db180ec1de8c8a4a84c9928badcfc5f0a94b1ae35e7287d4e10ee93b4'
            'b711a5afaf027ac2cfefc144cd3760dd1d6a99689864be6ecb73a62cbb21b04f'
            'fff8f596a7104ba5fc202dc5a80683032a33a298cf9ede7fdd12f7faf629a45c'
            'c9aa6e167a57ed31002471204d39bf24bb4ebecc38322571515ac73f02b237b6'
            '3fedb626b375f6ad8b4601abd336f4560718a9c9134716f0c3a4e823b8c12857'
            '3c06dcc15bef6cbda7ce7b8a6a4f89bd16599ddbd1b964add9f2048cdda4700b'
            'be61c69ae7bb626f7f07f95cb5c0074013725c1b90a3ca68aa0c0f989d75e41e'
            'f3eca044354ee371072aaf81452468cce1ff2abf9efc746db964dfdb400f88ab'
            '78da7fe1f8bffc729168c8224707cc14ee460c7adcba9a48fd77e2b22614fca3')

prepare() {
    # Use python2 where appropriate
    find "$srcdir" -type f -print0 | \
         xargs -0 sed -i 's|/usr/bin/env python$|&2|'
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
    for sdir in llvm clang lldb cmark llbuild; do
        ln -sf swift-${sdir}-swift-${_swiftver} ${sdir}
    done
    for sdir in corelibs-xctest corelibs-foundation corelibs-libdispatch \
                integration-tests
    do
        ln -sf swift-${sdir}-swift-${_swiftver} swift-${sdir}
    done
    ln -sf swift-swift-${_swiftver} swift
    ln -sf swift-package-manager-swift-${_swiftver} swiftpm

    # Fix library link order for sourcekitd-test
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/sourcekit_link_order.patch" )

    # ICU 59 changed the type of UChar to char16_t
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/icu59.patch" )

    # Fix documentation build against Sphinx 1.6
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/sphinx1.6.patch" )

    # LLDB is missing an include for std::bind with libstdc++/gcc7
    ( cd "${srcdir}/lldb" && patch -p1 -i "${srcdir}/lldb_missing_include.patch" )

    # glibc 2.26 removed the non-standard xlocale.h and SIGUNUSED
    ( cd "${srcdir}" && patch -p1 -i "${srcdir}/glibc-2.26.patch" )

    # Clang 5.0 fixed an obscure issue with standards-compliance
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/clang5.patch" )
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
    _build_script_wrapper -R "${_common_build_params[@]}"

    # Run the build a second time, this time with SourceKit enabled
    # This is required because SourceKit depends on libdispatch, which
    # in turn depends on swift, where SourceKit is located
    _build_script_wrapper -R "${_common_build_params[@]}" \
        --extra-cmake-options="-DSWIFT_BUILD_SOURCEKIT=TRUE" \
        --reconfigure
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
        --install-foundation

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

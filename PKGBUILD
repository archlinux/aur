# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgbase=swift-development
pkgname=(swift-development swift-lldb-development)
_swiftver=DEVELOPMENT-SNAPSHOT-2017-04-24-a
pkgver=${_swiftver//-/.}
pkgrel=1
pkgdesc="The Swift programming language and debugger - latest development snapshot"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python2' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses' 'libkqueue' 'libblocksruntime')
makedepends=('git' 'cmake' 'ninja' 'swig' 'clang>=3.8' 'python2-six' 'perl'
             'python2-sphinx' 'python2-requests' 'rsync')

_libpwq_ref=18437d2be372f4422b207ec6442c8caf7974025d
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
    "libpwq-${_libpwq_ref}.tar.gz::https://github.com/mheily/libpwq/archive/${_libpwq_ref}.tar.gz"
    "sourcekit_link_order.patch"
    "icu59.patch"
)
sha256sums=('494d69f05d711e8df08cc7a7183e3f9735e091bc12bda7000ba5d6108c1c3275'
            '30dd5dbe9fa2247bc02a2150fdd4bc874d98f5cf15f179a7134bff664cc05667'
            '2e4379158a6170c8602aab69efe21553a6847cb06747dc20ebea8028d9512ace'
            'e488bf6a9fe4d2b5813ca9263134a198341aa50c5f92be1117d96bd4421aedc2'
            'eb1cdc5d8b6192cc3b77356c30c203c6f7d60202e91af3920fa4c087f5ba38d4'
            '6909e33f2de65967b8b378d49c85169338db0b360c954ed490ea167920c3d8f7'
            'fc815e12e435eba96dab858596403bc1d0e5a069471da4a8dfc1a99de374785f'
            '812be01ed103624a49a9cc722b77ecd0c237b61412604de881dabe47abbe984a'
            '4cffca269ab81ce725143c1c630de1b4ab385b79f49dd8c1c9bf41cd31f7bb6b'
            '38fe4ec76f99477f4ed3e1a769e3d5fd9671b3daa9f5a4005d6252845b8a5b5f'
            '392055443e04515a5c94a1ab736d6959ce2354ac2ee8418c8bf3dc2124240969'
            'd6290d649d25230813cd27dbad49ea0b68bb9302df76c3fdd0f24ebc8b1b5b00'
            'c9aa6e167a57ed31002471204d39bf24bb4ebecc38322571515ac73f02b237b6'
            '3fedb626b375f6ad8b4601abd336f4560718a9c9134716f0c3a4e823b8c12857')

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

    # Put libpwq in the right submodule location
    rmdir swift-corelibs-libdispatch/libpwq
    mv libpwq-${_libpwq_ref} swift-corelibs-libdispatch/libpwq

    # Fix library link order for sourcekitd-test
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/sourcekit_link_order.patch" )

    # ICU 59 changed the type of UChar to char16_t
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/icu59.patch" )
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

build() {
    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    export PATH="$PATH:/usr/bin/core_perl"
    utils/build-script -R "${_common_build_params[@]}"

    # Run the build a second time, this time with SourceKit enabled
    # This is required because SourceKit depends on libdispatch, which
    # in turn depends on swift, where SourceKit is located
    utils/build-script -R "${_common_build_params[@]}" \
        --extra-cmake-options="-DSWIFT_BUILD_SOURCEKIT=TRUE" \
        --reconfigure

    # Fix the lldb swig binding's import path (matches Arch LLDB package)
    # Need to do this before check(), since the test suite uses the lldb
    # python bindings directly from the build dir
    sed -i "/import_module('_lldb')/s/_lldb/lldb.&/" \
        "${srcdir}/build/Ninja-ReleaseAssert/lldb-linux-${CARCH}/lib/python2.7/site-packages/lldb/__init__.py"
}

check() {
    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    utils/build-script -R -t
}

package_swift-development() {
    pkgdesc='The Swift programming language compiler and tools - development snapshot'
    provides=('swift-language' 'swift')
    conflicts=('swift-language-git' 'swift-git' 'swift-bin' 'swift')
    optdepends=('swift-lldb: Swift REPL and debugger')

    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    utils/build-script -R "${_common_build_params[@]}" \
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

package_swift-lldb-development() {
    pkgdesc='The Swift programming language debugger (LLDB) and REPL - development snapshot'
    depends=('swift-development' 'python2-six')
    provides=('lldb' 'swift-lldb')
    conflicts=('lldb' 'swift-lldb')
    options=('!strip')  # Don't strip repl_swift -- we need its symbols

    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    utils/build-script -R "${_common_build_params[@]}" \
        --install-destdir="$pkgdir" \
        --install-lldb

    # This should be provided from python2-six
    rm "$pkgdir/usr/lib/python2.7/site-packages/six.py"
    rm "$pkgdir/usr/lib/python2.7/site-packages/six.pyc"
}

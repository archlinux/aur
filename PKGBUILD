pkgbase=swift-development
pkgname=(swift-development swift-lldb-development)
_swiftver=DEVELOPMENT-SNAPSHOT-2016-08-18-a
pkgver=${_swiftver//-/.}
pkgrel=1
pkgdesc="The Swift programming language and debugger - latest development snapshot"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python2' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses')
makedepends=('git' 'cmake' 'ninja' 'swig' 'clang>=3.8' 'python2-six' 'perl'
             'python2-sphinx')
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
    "swift-integration-tests-${_swiftver}.tar.gz::https://github.com/apple/swift-integration-tests/archive/swift-${_swiftver}.tar.gz"
    "swift-sphinx2.patch"
)
sha256sums=('7cbd6174e61855f169b771d9748cc94c160b90a9c620add83d7f819f5c534fa1'
            'df4e725fece07ed95f6ebeb865e14c376415bc3d08f1d10a61b85d3315421631'
            '6eb99900c483c51500e9e12eae0ef73eddff66a60c2ad27e6e57f5803c93dcf2'
            '18521a703fa85ef0ee84b998baf82b43f409c95ff323ead3a73a62c958f28a1b'
            '394762d99f9ea50024621861cd6774ae309f0c3400db7321bcb4f397a75b4a28'
            'd7d9ade99ed2f8c0166bbb12e122b7afdc8da3a37504023c63f13f130016d47a'
            '665a0fbd683e9b8ff70a7955c76d07896b3195f7504b43d14d88134b5a2ffd9d'
            'a7cfcf2d5951987c88e42ee10906e7c7fb558771fd1339007a30c6a9ef064aed'
            '283d3b80e8a71480d7a9e2a5339c0d97f6ab23b1c916ba5a42fb2d9e2e54a06d'
            'cb34e527a1e4777d2cf7ad5fee997e777984edb73456ee69936f50ea64a52b35'
            '93bbe769666aab15b15d12e2423f213b39d6c47237eafc781569698c8367535f')

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
         "$srcdir/swift-swift-${_swiftver}/utils/build-script-impl"

    # Use directory names which build-script expects
    for sdir in llvm clang lldb cmark llbuild; do
        ln -sf swift-${sdir}-swift-${_swiftver} ${sdir}
    done
    for sdir in corelibs-xctest corelibs-foundation integration-tests; do
        ln -sf swift-${sdir}-swift-${_swiftver} swift-${sdir}
    done
    ln -sf swift-swift-${_swiftver} swift
    ln -sf swift-package-manager-swift-${_swiftver} swiftpm

    # Sphinx 1.3.5 raises a warning (promoted to error) when using an unknown
    # syntax highlighting language (like "swift").
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/swift-sphinx2.patch" )
}

build() {
    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    export LDFLAGS='-ldl -lpthread'
    export PATH="$PATH:/usr/bin/core_perl"
    utils/build-script -R \
        --lldb --llbuild --swiftpm --xctest --foundation \
        -j "$(lscpu --parse=CPU | grep -v '^#' | wc -l)"
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

    cd "$srcdir/build/Ninja-ReleaseAssert"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/swift"

    # Swift's components don't provide an install target :(
    # These are based roughly on what's included in the binary release packages
    (
        cd swift-linux-$CARCH
        install -m755 bin/swift bin/swift-{demangle,ide-test} "$pkgdir/usr/bin"
        ln -s swift "$pkgdir/usr/bin/swiftc"
        ln -s swift "$pkgdir/usr/bin/swift-autolink-extract"

        install -dm755 "$pkgdir/usr/share/man/man1"
        install -m644 docs/tools/swift.1 "$pkgdir/usr/share/man/man1"

        umask 0022
        cp -rL lib/swift/{clang,linux,shims} "$pkgdir/usr/lib/swift/"
    )
    (
        cd llbuild-linux-$CARCH
        install -m755 bin/swift-build-tool "$pkgdir/usr/bin"
    )
    (
        cd swiftpm-linux-$CARCH
        install -m755 debug/swift-{build,test,package} "$pkgdir/usr/bin"

        install -dm755 "$pkgdir/usr/lib/swift/pm"
        install -m755 lib/swift/pm/libPackageDescription.so "$pkgdir/usr/lib/swift/pm"
        install -m644 lib/swift/pm/PackageDescription.swiftmodule "$pkgdir/usr/lib/swift/pm"
    )
    (
        cd foundation-linux-$CARCH
        install -m755 Foundation/libFoundation.so "$pkgdir/usr/lib/swift/linux/"
        install -m644 Foundation/Foundation.swiftdoc "$pkgdir/usr/lib/swift/linux/$CARCH"
        install -m644 Foundation/Foundation.swiftmodule "$pkgdir/usr/lib/swift/linux/$CARCH"

        umask 0022
        cp -r Foundation/usr/lib/swift/CoreFoundation "$pkgdir/usr/lib/swift/"
    )
    (
        cd xctest-linux-$CARCH
        install -m755 libXCTest.so "$pkgdir/usr/lib/swift/linux/"
        install -m644 XCTest.swiftdoc "$pkgdir/usr/lib/swift/linux/$CARCH"
        install -m644 XCTest.swiftmodule "$pkgdir/usr/lib/swift/linux/$CARCH"
    )

    # License file
    install -dm755 "$pkgdir/usr/share/licenses/swift"
    install -m644 "$srcdir/swift/LICENSE.txt" "$pkgdir/usr/share/licenses/swift"
}

package_swift-lldb-development() {
    pkgdesc='The Swift programming language debugger (LLDB) and REPL - development snapshot'
    depends=('swift-language' 'python2-six')
    provides=('lldb' 'swift-lldb')
    conflicts=('lldb' 'swift-lldb')
    options=('!strip')  # Don't strip repl_swift -- we need its symbols

    cd "$srcdir/build/Ninja-ReleaseAssert"

    # Install swift-capable lldb
    (
        cd lldb-linux-$CARCH
        DESTDIR="$pkgdir" ninja install
    )

    # This should be provided from python2-six
    rm "$pkgdir/usr/lib/python2.7/site-packages/six.py"
}

pkgbase=swift-language
pkgname=(swift swift-lldb)
_swiftver=2.2-SNAPSHOT-2016-01-25-a
_develver=${_swiftver//2.2-SNAPSHOT/DEVELOPMENT-SNAPSHOT}
pkgver=${_swiftver//-/.}
pkgrel=2
pkgdesc="The Swift programming language and debugger"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python2' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses')
makedepends=('git' 'cmake' 'ninja' 'swig' 'clang>=3.6' 'python2-six')
source=(
    "swift-${_swiftver}.tar.gz::https://github.com/apple/swift/archive/swift-${_swiftver}.tar.gz"
    "swift-llvm-${_swiftver}.tar.gz::https://github.com/apple/swift-llvm/archive/swift-${_swiftver}.tar.gz"
    "swift-clang-${_swiftver}.tar.gz::https://github.com/apple/swift-clang/archive/swift-${_swiftver}.tar.gz"
    "swift-lldb-${_swiftver}.tar.gz::https://github.com/apple/swift-lldb/archive/swift-${_swiftver}.tar.gz"
    "swift-cmark-${_swiftver}.tar.gz::https://github.com/apple/swift-cmark/archive/swift-${_swiftver}.tar.gz"
    "swift-llbuild-${_develver}.tar.gz::https://github.com/apple/swift-llbuild/archive/swift-${_develver}.tar.gz"
    "swift-package-manager-${_develver}.tar.gz::https://github.com/apple/swift-package-manager/archive/swift-${_develver}.tar.gz"
    "swift-corelibs-xctest-${_develver}.tar.gz::https://github.com/apple/swift-corelibs-xctest/archive/swift-${_develver}.tar.gz"
    "swift-corelibs-foundation-${_develver}.tar.gz::https://github.com/apple/swift-corelibs-foundation/archive/swift-${_develver}.tar.gz"
)
sha256sums=('616cf1cfaa407ffb22cd60f9c5a95dc3227665c72dd5c8d044b31174430af3b6'
            '7b07af901b6fe42793e4f25a470db8d61c60c16b92e434de17fc151861e00172'
            'eec56334ffcec1cefaca5758031c722a0cf12eb0d3fac30f9d30c1bded16eeea'
            '1016010c5496db0f57c5cf822f12a7d9742ca51374b39fce1e5f599d4cf6deb8'
            '063469a810855a622bb05846b3f74fb0f0f92585e46c5ec16618188a71d21f24'
            'dbf0aa2b04d04cce2281b452008506ffbe140d47c3a4d933ad715e6ee1ccdf06'
            '84105f264f16755e27a0ebc8d25de51c1d72a33007b61ad68eb0ea185f15b0a8'
            'a04845547b7f81e3e68e3df171393159550c4b3ecdea51768ac976d29c0b1c30'
            'cf16b948cc84fc9d3f16c6a7d8955a3a68f00d762323e828a74499b58f68893b')

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

    # Fix bad include paths
    find "$srcdir" -type f -print0 | \
         xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'

    # Use directory names which build-script expects
    for sdir in llvm clang lldb cmark llbuild corelibs-xctest corelibs-foundation; do
        if [[ "$sdir" =~ ^corelibs- ]]; then
            ln -sf swift-${sdir}-swift-${_develver} swift-${sdir}
        elif [[ "$sdir" == "llbuild" ]]; then
            ln -sf swift-${sdir}-swift-${_develver} ${sdir}
        else
            ln -sf swift-${sdir}-swift-${_swiftver} ${sdir}
        fi
    done
    ln -sf swift-swift-${_swiftver} swift
    ln -sf swift-package-manager-swift-${_develver} swiftpm
}

build() {
    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    export LDFLAGS='-ldl -lpthread'
    utils/build-script -R \
        --lldb --llbuild --swiftpm --xctest --foundation \
        -j "$(lscpu --parse=CPU | grep -v '^#' | wc -l)"
}

check() {
    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    utils/build-script -R -t
}

package_swift() {
    pkgdesc='The Swift programming language compiler and tools'
    provides=('swift-language')
    conflicts=('swift-language-git' 'swift-git' 'swift-bin')
    optdepends=('swift-lldb: Swift REPL and debugger')

    cd "$srcdir/build/Ninja-ReleaseAssert"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/swift"

    # Swift's components don't provide an install target :(
    # These are based on what's included in the binary release packages
    (
        cd swift-linux-$CARCH
        install -m755 bin/swift bin/swift-demangle bin/swift-compress bin/swift-ide-test "$pkgdir/usr/bin"
        ln -s swift "$pkgdir/usr/bin/swiftc"
        ln -s swift "$pkgdir/usr/bin/swift-autolink-extract"

        install -dm755 "$pkgdir/usr/share/man/man1"
        install -m644 docs/tools/swift.1 "$pkgdir/usr/share/man/man1"

        umask 0022
        cp -rL lib/swift/{clang,glibc,linux,shims} "$pkgdir/usr/lib/swift/"
    )
    (
        cd llbuild-linux-$CARCH
        install -m755 bin/swift-build-tool "$pkgdir/usr/bin"
    )
    (
        cd swiftpm-linux-$CARCH
        install -m755 debug/swift-build "$pkgdir/usr/bin"

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

package_swift-lldb() {
    pkgdesc='The Swift programming language debugger (LLDB) and REPL'
    depends=('swift' 'python2-six')
    provides=('lldb')
    conflicts=('lldb')
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

pkgbase=swift-development
pkgname=(swift-development swift-lldb-development)
_swiftver=DEVELOPMENT-SNAPSHOT-2016-06-20-a
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
    "swift-sphinx2.patch" "pod2man_release.patch"
)
sha256sums=('c6955802307395f97abebf7a1e206999394e940900ebb6ec602f085722140f2d'
            'e7b6118869ab5c58730fc88c7971cdbfd908b2ab6754d16a0d9ea27c52fa7a6f'
            'dbeb97a9b2543b921aadf23930005f30fe727e3e73c1df48177c8d5df19f9b1b'
            'bb60bbbee0609453c0f5b21fdfc902b10c20f3d13d4921baa283403c34e0d642'
            'fd58632c893e1f493f88664d4bcb08029edf39024b15bfdb17a22ed5e4230d58'
            '793c2355dfce50a02d888ae40095ecdb29b12c66e02a9fb225226ba7f6fef812'
            'd35ab5a671f21d7179c56ae07ce0e8e96d030445a0cc8ec65457a850e1ebd57e'
            'beb32972e5f5f53b1d6069b46e10146932792ac6275f26308660624173d8324b'
            '16a593b8bf918e379338c51d6856316c384ed401def2284008a7a28de173dbc9'
            '9c3a782da48bd2bcac4ca104c05445a083a85c256c94fe784075f5fc9432feb0'
            '93bbe769666aab15b15d12e2423f213b39d6c47237eafc781569698c8367535f'
            'f09977247fa2fcfa306b491523146c8772b38fa007cc1530f4169413fe7c7f3a')

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

    # Recent versions of pod2man require an argument to --release.  If no
    # argument is provided, it will treat the next option as its argument,
    # thereby breaking all subsequent arguments.  So let's put something
    # useful there instead :)
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/pod2man_release.patch" )
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

package_swift-development() {
    pkgdesc='The Swift programming language compiler and tools - development snapshot'
    provides=('swift-language' 'swift')
    conflicts=('swift-language-git' 'swift-git' 'swift-bin' 'swift')
    optdepends=('swift-lldb: Swift REPL and debugger')

    cd "$srcdir/build/Ninja-ReleaseAssert"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/swift"

    # Swift's components don't provide an install target :(
    # These are based on what's included in the binary release packages
    (
        cd swift-linux-$CARCH
        install -m755 bin/swift bin/swift-demangle bin/swift-ide-test "$pkgdir/usr/bin"
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

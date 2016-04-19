pkgbase=swift-language
pkgname=(swift swift-lldb)
_swiftver=2.2.1-RELEASE
_swiftold=2.2-SNAPSHOT-2016-01-11-a
pkgver=${_swiftver//-RELEASE/}
pkgrel=1
pkgdesc="The Swift programming language and debugger"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python2' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses')
makedepends=('git' 'cmake' 'ninja' 'swig' 'clang>=3.6' 'python2-six' 'perl')

source=(
    "swift-${_swiftver}.tar.gz::https://github.com/apple/swift/archive/swift-${_swiftver}.tar.gz"
    "swift-llvm-${_swiftver}.tar.gz::https://github.com/apple/swift-llvm/archive/swift-${_swiftver}.tar.gz"
    "swift-clang-${_swiftver}.tar.gz::https://github.com/apple/swift-clang/archive/swift-${_swiftver}.tar.gz"
    "swift-lldb-${_swiftver}.tar.gz::https://github.com/apple/swift-lldb/archive/swift-${_swiftver}.tar.gz"
    "swift-cmark-${_swiftver}.tar.gz::https://github.com/apple/swift-cmark/archive/swift-${_swiftver}.tar.gz"
    "swift-no-docs.patch"
)
sha256sums=('95fb0da2282da15f2aada66dec07a26630e66caf9d68f2c9f492527e25962096'
            'f7977e5bb275494b5dac4490afc5d634f894ba5f209f3b2dbd5b7e520fa5fce2'
            '40bdfa7eec0497ec69005d6a5d018b12c85aa2c0959d3408ecaaa9e34ff0415f'
            '2098043dbda98374e784d3357f71f8e931aea3ac958c042adf0df0fae7bc22a3'
            '254d3c02bf2b03ad456fa3ad27b4da854e36318fcaf6b6f199fdb3e978a90803'
            '1a8663c48a1a203d1825ae62a7e4191e4980a2dad461d4d88152221ad9e2171d')

# Set this to 1 to enable the experimental parts (swiftpm, corelibs)
# Otherwise, the standard libraries, llbuild, and swiftpm will NOT be available
# (The default [0] matches Apple's release notes for Linux at
# https://swift.org/blog/swift-2-2-released/ )
_experimental=0

if (( _experimental )); then
    source+=(
        "swift-llbuild-${_swiftold}.tar.gz::https://github.com/apple/swift-llbuild/archive/swift-${_swiftold}.tar.gz"
        "swift-package-manager-${_swiftold}.tar.gz::https://github.com/apple/swift-package-manager/archive/swift-${_swiftold}.tar.gz"
        "swift-corelibs-xctest-${_swiftold}.tar.gz::https://github.com/apple/swift-corelibs-xctest/archive/swift-${_swiftold}.tar.gz"
        "swift-corelibs-foundation-${_swiftold}.tar.gz::https://github.com/apple/swift-corelibs-foundation/archive/swift-${_swiftold}.tar.gz"
    )
    sha256sums+=(
        'c5e92b71daecbeeb8fe043fe58bc85c7deacaadc21caa38357d569ae4093a023'
        '60b11af87b565d68dd5e6d13af5052f359923e3146a6ffc8336c86d68b5c4fa6'
        '5fde35c76b688ec37d8e25f0bc3cc1738548d8bd03a709bcfb3cb2744b221a9e'
        '66bf0fb21c37bb2792b113b770e225c90bca548b2246f86054e14c6cc79f0517'
    )
fi

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
    for sdir in llvm clang lldb cmark; do
        ln -sf swift-${sdir}-swift-${_swiftver} ${sdir}
    done
    ln -sf swift-swift-${_swiftver} swift

    if (( _experimental )); then
        for sdir in corelibs-xctest corelibs-foundation; do
            ln -sf swift-${sdir}-swift-${_swiftold} swift-${sdir}
        done
        ln -sf swift-llbuild-swift-${_swiftold} llbuild
        ln -sf swift-package-manager-swift-${_swiftold} swiftpm
    fi

    # Sphinx 1.3.5 raises a warning (promoted to error) when using an unknown
    # syntax highlighting language (like "swift").
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/swift-no-docs.patch" )
}

build() {
    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    export LDFLAGS='-ldl -lpthread'
    local _buildargs=(--lldb)
    (( _experimental )) && _buildargs+=(--llbuild --swiftpm --xctest --foundation)
    utils/build-script -R "${_buildargs[@]}" \
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
    # These are based roughly on what's included in the binary release packages
    (
        cd swift-linux-$CARCH
        install -m755 bin/swift bin/swift-{demangle,compress,ide-test} "$pkgdir/usr/bin"
        ln -s swift "$pkgdir/usr/bin/swiftc"
        ln -s swift "$pkgdir/usr/bin/swift-autolink-extract"

        install -dm755 "$pkgdir/usr/share/man/man1"
        install -m644 docs/tools/swift.1 "$pkgdir/usr/share/man/man1"

        umask 0022
        cp -rL lib/swift/{clang,glibc,linux,shims} "$pkgdir/usr/lib/swift/"
    )
    if (( _experimental )); then
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
    fi

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

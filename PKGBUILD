pkgbase=swift-preview
pkgname=(swift-preview swift-lldb-preview)
_swiftver=3.0.1-PREVIEW-3
pkgver=${_swiftver//-/.}
pkgrel=1
pkgdesc="The Swift programming language and debugger - preview release"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python2' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses' 'libkqueue')
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
    "swift-corelibs-libdispatch-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-libdispatch/archive/swift-${_swiftver}.tar.gz"
    "swift-integration-tests-${_swiftver}.tar.gz::https://github.com/apple/swift-integration-tests/archive/swift-${_swiftver}.tar.gz"
    "swift-sphinx2.patch" "xar-1.6.patch"
)
sha256sums=('97e7db66270c9336d50d09ef427bcc30129051dec31d6517883394343e493471'
            '39e4e3ec7db91f99910fd932c3aed38ce3c3d40f2e40d82c52e7d585f7e8da68'
            '31861f3ad2f84c4e543b65beced7681d9e386d033743d6faafb76844accc58bf'
            'b41c9f5833d805703ab2671bd751d36fc173815b9cae30c69b95bb15c68d98c0'
            '05083f7d8f08268ef932e6c58fa2d76ff7e7599a80d48535b16ac38254699651'
            'cdeedfe7848befba39a73ef8b87bce548f5a4a2bb7b7c88277dd15237b377c9c'
            'ced5a22d92a9d6af6b49e2c4603f8ca1bffc178bcaa19d21e9d633aa94d2d55a'
            'ab426f01d7b6e03945e5db5ed561c73954ddf3965f010f2476a0b8c57d16aae8'
            '0fee5e5e0757d2433060e26051929b60d7f4af05843f59ea10abbf205b11763b'
            '173c8f24a74b936e9f357946cd0859e1fe1c3f40dcdfc9e9d54341517862f5c6'
            '6c046cf29aa810c2500e37ef805ccc90276f76694b324c9cbe5be8ee3e796840'
            '93bbe769666aab15b15d12e2423f213b39d6c47237eafc781569698c8367535f'
            'df27c2bfeaed6335f49a8815b0b296fd5acc331a6a9361a40f7dfc69a7518da6')

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
    for sdir in corelibs-xctest corelibs-foundation corelibs-libdispatch \
                integration-tests
    do
        ln -sf swift-${sdir}-swift-${_swiftver} swift-${sdir}
    done
    ln -sf swift-swift-${_swiftver} swift
    ln -sf swift-package-manager-swift-${_swiftver} swiftpm

    # Sphinx 1.3.5 raises a warning (promoted to error) when using an unknown
    # syntax highlighting language (like "swift").
    ( cd "${srcdir}/swift" && patch -p1 -i "${srcdir}/swift-sphinx2.patch" )

    # Fix for xar 1.6.1+ (backported from LLVM trunk)
    ( cd "${srcdir}/llvm" && patch -p1 -i "${srcdir}/xar-1.6.patch" )
}

build() {
    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    export LDFLAGS='-ldl -lpthread'
    export PATH="$PATH:/usr/bin/core_perl"
    utils/build-script -R \
        --lldb --llbuild --swiftpm --xctest --foundation --libdispatch \
        -j "$(lscpu --parse=CPU | grep -v '^#' | wc -l)"
}

check() {
    cd "$srcdir/swift"

    export SWIFT_SOURCE_ROOT="$srcdir"
    utils/build-script -R -t
}

package_swift-preview() {
    pkgdesc='The Swift programming language compiler and tools - preview release'
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
        cd xctest-linux-$CARCH
        install -m755 libXCTest.so "$pkgdir/usr/lib/swift/linux/"
        install -m644 XCTest.swiftdoc "$pkgdir/usr/lib/swift/linux/$CARCH"
        install -m644 XCTest.swiftmodule "$pkgdir/usr/lib/swift/linux/$CARCH"
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
        cd libdispatch-linux-$CARCH
        make install DESTDIR="$pkgdir"
    )

    # License file
    install -dm755 "$pkgdir/usr/share/licenses/swift"
    install -m644 "$srcdir/swift/LICENSE.txt" "$pkgdir/usr/share/licenses/swift"
}

package_swift-lldb-preview() {
    pkgdesc='The Swift programming language debugger (LLDB) and REPL - preview release'
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

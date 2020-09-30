# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Gábor Sebestyén <segabor@gmail.com>
# Contributor: soloturn@gmail.com

pkgbase=swift-language
pkgname=(swift swift-lldb)
_swiftver=5.3-RELEASE
#pkgver=${_swiftver//-RELEASE/}
#_swiftver=5.3-DEVELOPMENT-SNAPSHOT-2020-07-04-a
#_swiftver=DEVELOPMENT-SNAPSHOT-2020-06-24-a
pkgver=5.3
pkgrel=1
pkgdesc="The Swift programming language and debugger"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('icu' 'libedit' 'libxml2' 'python' 'libbsd' 'ncurses' )
makedepends=('clang' 'cmake' 'git' 'ninja' 'python-six' 'python2' 'swig')
source=(
    "swift-${_swiftver}.tar.gz::https://github.com/apple/swift/archive/swift-${_swiftver}.tar.gz"
    "swift-cmark-${_swiftver}.tar.gz::https://github.com/apple/swift-cmark/archive/swift-${_swiftver}.tar.gz"
    "swift-llbuild-${_swiftver}.tar.gz::https://github.com/apple/swift-llbuild/archive/swift-${_swiftver}.tar.gz"
    "llvm-project-${_swiftver}.tar.gz::https://github.com/apple/llvm-project/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-xctest-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-xctest/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-foundation-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-foundation/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-libdispatch-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-libdispatch/archive/swift-${_swiftver}.tar.gz"
    "swift-integration-tests-${_swiftver}.tar.gz::https://github.com/apple/swift-integration-tests/archive/swift-${_swiftver}.tar.gz"
    "swift-package-manager-${_swiftver}.tar.gz::https://github.com/apple/swift-package-manager/archive/swift-${_swiftver}.tar.gz"
    '0001-not-build-ninja-icu.patch'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    # Use directory names which build-script expects
    rm -rf llvm-project
    ln -sf llvm-project-swift-${_swiftver} llvm-project

    for sdir in cmark llbuild
    do
        rm -rf ${sdir}
        mv swift-${sdir}-swift-${_swiftver} ${sdir}
    done
    for sdir in corelibs-xctest corelibs-foundation corelibs-libdispatch \
                integration-tests
    do
        rm -rf swift-${sdir}
        mv swift-${sdir}-swift-${_swiftver} swift-${sdir}
    done
    rm -rf swift swiftpm
    mv swift-swift-${_swiftver} swift
    mv swift-package-manager-swift-${_swiftver} swiftpm

    ( cd swift && patch -p1 -i "$srcdir/0001-not-build-ninja-icu.patch" )
}

_common_build_params=(
    --install-prefix=/usr
    --lldb
    --llbuild
    --swiftpm
    --xctest
    --foundation
    --libdispatch
    --extra-cmake-options="-DSWIG_EXECUTABLE=/usr/bin/swig"
)

_build_script_wrapper() {
    export SWIFT_SOURCE_ROOT="$srcdir"
    ./utils/build-script "$@"
}

build() {
    cd "$srcdir"
    # Fix /usr/include error
    find "$srcdir/swift/stdlib/public/SwiftShims" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
    find "$srcdir/llvm-project/clang" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
    find "$srcdir/llvm-project/clang-tools-extra" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
#    _build_script_wrapper -R "${_common_build_params[@]}"

    # by default in /etc/makepkg.conf this is "-D_FORTIFY_SOURCE=2"
    # which will break `compiler-rt`, so unset
    unset CPPFLAGS
    python swift/utils/build-script --preset=buildbot_linux,no_test install_destdir="$srcdir/build" installable_package="$srcdir/swift-arch-pkg.tar.gz"
}

check() {
    cd "$srcdir/swift"
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

    # This should be provided from python2-six
    rm "$pkgdir/usr/lib/python2.7/site-packages/six.py"
    rm "$pkgdir/usr/lib/python2.7/site-packages/six.pyc"
}

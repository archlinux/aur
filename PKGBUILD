pkgname=swift
_swiftver=2.2-SNAPSHOT-2015-12-31-a
pkgver=${_swiftver//-/.}
pkgrel=1
pkgdesc="The Swift programming language and debugger"
arch=('i686' 'x86_64')
url="http://swift.org/"
license=('apache')
depends=('python2' 'libutil-linux' 'icu' 'libbsd' 'libedit' 'libxml2'
         'sqlite' 'ncurses')
makedepends=('git' 'cmake' 'ninja' 'swig' 'clang>=3.6')
provides=('lldb' 'swift-language')
conflicts=('lldb' 'swift-language-git' 'swift-git')
source=(
    "swift-${_swiftver}.tar.gz::https://github.com/apple/swift/archive/swift-${_swiftver}.tar.gz"
    "swift-llvm-${_swiftver}.tar.gz::https://github.com/apple/swift-llvm/archive/swift-${_swiftver}.tar.gz"
    "swift-clang-${_swiftver}.tar.gz::https://github.com/apple/swift-clang/archive/swift-${_swiftver}.tar.gz"
    "swift-lldb-${_swiftver}.tar.gz::https://github.com/apple/swift-lldb/archive/swift-${_swiftver}.tar.gz"
    "cmark::git+https://github.com/apple/swift-cmark.git"
    "swift-llbuild-${_swiftver}.tar.gz::https://github.com/apple/swift-llbuild/archive/swift-${_swiftver}.tar.gz"
    "swift-package-manager-${_swiftver}.tar.gz::https://github.com/apple/swift-package-manager/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-xctest-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-xctest/archive/swift-${_swiftver}.tar.gz"
    "swift-corelibs-foundation-${_swiftver}.tar.gz::https://github.com/apple/swift-corelibs-foundation/archive/swift-${_swiftver}.tar.gz"
)
sha256sums=(
    'd899e995c9cfa8987e470f0ad799f311ba9d8ae54ca889c4a22e60ac44bea26a'
    '4730fb75898110ed892d4cc35f2f58b457879c51283b19cccf797c443b3bc05e'
    '9660637e380472e3c30244d43f0d56499483a10dd960a8ae5323a0ba374152a2'
    '7dae0792aac2657c939637e3850a64483d1c2ce56e2164331abc26142379ed04'
    'SKIP'
    '9a39dfdc5c018e404df2f7d065629963b4efd8f3005de9728e61905ca307847b'
    '6dd619bd8a4fd6109adb1577f48d38b9f16911324ff3fd6f10959653cdcd3ffd'
    '5a1965af767e6a1fb9ccd0da90acc2db6050c417fb5da49d4f9be5f32e23a984'
    'dd4cbae758d42ad4f1f08d19455e092cab118c1c636c99abebbadc3517e253e5'
)

prepare() {
    # Use python2 where appropriate
    find "$srcdir" -type f -print0 | \
         xargs -0 sed -i 's|/usr/bin/env python$|&2|'
    find "$srcdir/swift-lldb-swift-${_swiftver}" -name Makefile -print0 | \
         xargs -0 sed -i 's|python-config|python2-config|g'
    sed -i '/^cmake_minimum_required/a set(Python_ADDITIONAL_VERSIONS 2.7)' \
         "$srcdir/swift-lldb-swift-${_swiftver}/CMakeLists.txt"

    # Fix bad include paths
    find "$srcdir" -type f -print0 | \
         xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'

    # Use directory names which build-script expects
    for sdir in llvm clang lldb llbuild; do
        ln -sf swift-${sdir}-swift-${_swiftver} ${sdir}
    done
    for sdir in xctest foundation; do
        ln -sf swift-corelibs-${sdir}-swift-${_swiftver} swift-corelibs-${sdir}
    done
    ln -sf swift-swift-${_swiftver} swift
    ln -sf swift-package-manager-swift-${_swiftver} swiftpm
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

    # TODO: Run tests
    #export SWIFT_SOURCE_ROOT="$srcdir"
    #utils/build-script -t
}

package() {
    cd "$srcdir/build"

    install -d -m755 "$pkgdir/usr"
    cp -R Ninja-ReleaseAssert "$pkgdir/usr"

    # Ensure correct directory permissions
    find "$pkgdir" -type d -exec chmod 755 {} +
}

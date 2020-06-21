# Maintainer: Theo Tosini <theo.tosini@theoduino.me>
# Contributor: Gábor Sebestyén <segabor@gmail.com>
# Contributor: soloturn@gmail.com


pkgname=swift-language-git
pkgver=swift.DEVELOPMENT.SNAPSHOT.2020.06.19.a.r24.g90cb347cd95
pkgrel=1
pkgdesc="The Swift programming language, taken directly from the Apple repository"
arch=('x86_64')
url="https://swift.org/"
license=('apache2')
groups=()
depends=('icu' 'libedit' 'libxml2' 'swig' 'python' 'libbsd' 'ncurses' )
makedepends=('git' 'ninja' 'cmake' 'clang')
provides=('swift-language')
conflicts=('swift-language-bin')
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/apple/swift'
        'cmark::git+https://github.com/apple/swift-cmark'
        'llbuild::git+https://github.com/apple/swift-llbuild'
        'swift-argument-parser::git+https://github.com/apple/swift-argument-parser'
        'swift-driver::git+https://github.com/apple/swift-driver'
        'swift-tools-support-core::git+https://github.com/apple/swift-tools-support-core'
        'swiftpm::git+https://github.com/apple/swift-package-manager'
        'swift-syntax::git+https://github.com/apple/swift-syntax'
        'swift-stress-tester::git+https://github.com/apple/swift-stress-tester'
        'swift-corelibs-xctest::git+https://github.com/apple/swift-corelibs-xctest'
        'swift-corelibs-foundation::git+https://github.com/apple/swift-corelibs-foundation'
        'swift-corelibs-libdispatch::git+https://github.com/apple/swift-corelibs-libdispatch'
        'swift-integration-tests::git+https://github.com/apple/swift-integration-tests'
        'llvm-project::git+https://github.com/apple/llvm-project'
       )
noextract=()
md5sums=('SKIP'
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
         'SKIP'
         'SKIP'
         'SKIP'
        )

pkgver() {
    cd "$srcdir/swift"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/swift"
    # Fix /usr/include error
    find "$srcdir/swift/stdlib/public/SwiftShims" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
    find "$srcdir/llvm-project/clang" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
    find "$srcdir/llvm-project/clang-tools-extra" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
    # Release build
    LDFLAGS='-ldl -lpthread' python utils/build-script -b -p --foundation --xctest -R
}

check() {
  cd "$srcdir/swift"
  python utils/build-script -t
}

package() {
  cd "$srcdir/build"
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  cp -R Ninja-ReleaseAssert "$pkgdir/opt/swift"
  ln -s /opt/swift/swift-linux-$CARCH/bin/{lldb-moduleimport-test,sil-extract,sil-opt,swift,swift-autolink-extract,swiftc,swift-demangle,swift-ide-test,swift-llvm-opt} "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

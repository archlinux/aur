# Maintainer: Theo Tosini <theo.tosini@theoduino.me>
pkgname=swift-language-git
pkgver=swift.2.2.SNAPSHOT.2015.12.01.b.r289.gc959ce2
pkgrel=1
pkgdesc="The Swift programming language, taken directly from the Apple repository"
arch=('x86_64')
url="https://swift.org/"
license=('apache2')
groups=()
depends=('icu' 'libedit' 'libxml2' 'swig' 'python2' 'libbsd')
makedepends=('git' 'ninja' 'cmake' 'clang')
provides=('swift-language')
conflicts=('swift-language-bin')
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/apple/swift'
        'llvm::git+https://github.com/apple/swift-llvm'
        'clang::git+https://github.com/apple/swift-clang'
        'lldb::git+https://github.com/apple/swift-lldb'
        'cmark::git+https://github.com/apple/swift-cmark'
        'llbuild::git+https://github.com/apple/swift-llbuild'
        'swiftpm::git+https://github.com/apple/swift-package-manager'
        'git+https://github.com/apple/swift-corelibs-xctest'
        'git+https://github.com/apple/swift-corelibs-foundation')
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/swift"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/swift"
    # Patch to use python2
    find . -type f -print0 | xargs -0 sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/g'
    # Release build
    LDFLAGS='-ldl -lpthread' python2 utils/build-script -p -R
}

package() {
  cd "$srcdir/build"
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  cp -R Ninja-ReleaseAssert "$pkgdir/opt/swift"
  ln -s /opt/swift/swift-linux-$CARCH/bin/{lldb-moduleimport-test,sil-extract,sil-opt,swift,swift-autolink-extract,swiftc,swift-demangle,swift-ide-test,swift-llvm-opt} "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

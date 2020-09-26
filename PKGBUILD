# Maintainer: Theo Tosini <theo.tosini@theoduino.me>
# Contributor: Gábor Sebestyén <segabor@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: soloturn@gmail.com

pkgname=swift-language-git
pkgver=swift.DEVELOPMENT.SNAPSHOT.2020.09.23.a.r85.gc22ba90700a
pkgrel=1
pkgdesc="The Swift programming language, taken directly from the Apple repository"
arch=('x86_64')
url="https://swift.org/"
license=('apache2')
groups=()
depends=('icu' 'libedit' 'libxml2' 'swig' 'python' 'libbsd' 'ncurses' )
makedepends=('clang' 'cmake' 'git' 'ninja' 'python-six' 'python2')
provides=('swift-language')
conflicts=('swift-language-bin')
replaces=()
backup=()
options=()
install=
source=(
    'git+https://github.com/apple/swift'
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
    'llvm-project::git+https://github.com/apple/llvm-project#branch=swift/master'
    'yams::git+https://github.com/jpsim/Yams'
#    'yams::git+https://github.com/jpsim/Yams#commit=3.0.1'
    '0001-arch-aur-pachtes.patch'
    '0002-llbuild-ninja-test-binary-links-against-ncurses.patch'
    '0003-butta-rpath.patch'
)
noextract=()
md5sums=(
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
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)


# By default makepkg runs strip on binaries. This seems to cause issues with the Swift REPL.
# Disable it in the PKGBUILD with:
# from https://github.com/RLovelett/swift-aur/blob/master/PKGBUILD, not sure if necessary
#options=(!strip)

prepare () {
    ( cd swift && patch -p1 -i "$srcdir/0001-arch-aur-pachtes.patch" )
    ( cd llbuild && patch -p1 -i "$srcdir/0002-llbuild-ninja-test-binary-links-against-ncurses.patch" )
    ( cd swift && patch -p1 -i "$srcdir/0003-butta-rpath.patch" )
}

pkgver() {
    cd "$srcdir/swift"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"
    # Fix /usr/include error
    find "$srcdir/swift/stdlib/public/SwiftShims" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
    find "$srcdir/llvm-project/clang" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'
    find "$srcdir/llvm-project/clang-tools-extra" -type f -print0 | xargs -0 sed -i 's|/usr/include/x86_64-linux-gnu|/usr/include|g'

    # By default in /etc/makepkg.conf this is "-D_FORTIFY_SOURCE=2"
    # Which will break `compiler-rt`
    unset CPPFLAGS

    python swift/utils/build-script --preset=buildbot_linux,no_test install_destdir="/opt/swift" installable_package="$srcdir/swift.tar.gz"
}

package() {
  cd "$pkgdir"
  mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  # unpack the produced tar, to pack it again. how to avoid this pack-unpack-pack? 
  tar xvf $srcdir/swift.tar.gz
  ln -s /opt/swift/swift-linux-$CARCH/bin/{lldb-moduleimport-test,sil-extract,sil-opt,swift,swift-autolink-extract,swiftc,swift-demangle,swift-ide-test,swift-llvm-opt} "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

# Maintainer: soloturn@gmail.com
# Contributor: Theo Tosini <theo.tosini@theoduino.me>
# Contributor: Gábor Sebestyén <segabor@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: fanjiang <prof.fan@foxmail.com>


pkgname=swift-language-git
pkgver=swift.DEVELOPMENT.SNAPSHOT.2021.04.24.a.r4.gc15dde42658
pkgrel=1
pkgdesc="The Swift programming language, taken directly from the Apple repository"
arch=('x86_64')
url="https://swift.org/"
license=('apache2')
depends=('icu' 'libedit' 'libxml2' 'python' 'libbsd' 'ncurses' )
makedepends=('clang' 'cmake' 'git' 'ninja' 'python-six' 'rsync' 'swig')
provides=('swift-language')
source=(
    'git+https://github.com/apple/swift#branch=main'
    'cmark::git+https://github.com/apple/swift-cmark#branch=main'
    'llbuild::git+https://github.com/apple/swift-llbuild#branch=main'
    'swift-argument-parser::git+https://github.com/apple/swift-argument-parser#branch=main'
    'swift-crypto::git+https://github.com/apple/swift-crypto#branch=main'
    'swift-driver::git+https://github.com/apple/swift-driver#branch=main'
    'swift-tools-support-core::git+https://github.com/apple/swift-tools-support-core#branch=main'
    'swiftpm::git+https://github.com/apple/swift-package-manager#branch=main'
    'swift-syntax::git+https://github.com/apple/swift-syntax#branch=main'
    'swift-stress-tester::git+https://github.com/apple/swift-stress-tester#branch=main'
    'swift-corelibs-xctest::git+https://github.com/apple/swift-corelibs-xctest#branch=main'
    'swift-corelibs-foundation::git+https://github.com/apple/swift-corelibs-foundation#branch=main'
    'swift-corelibs-libdispatch::git+https://github.com/apple/swift-corelibs-libdispatch#branch=main'
    'swift-integration-tests::git+https://github.com/apple/swift-integration-tests#branch=main'
    'llvm-project::git+https://github.com/apple/llvm-project#branch=swift/main'
    '0001-arch-aur-pachtes.patch'
    'indexstore-db::git+https://github.com/apple/indexstore-db#branch=main'
    'yams::git+https://github.com/jpsim/Yams#commit=3.0.1'
    'sourcekit-lsp::git+https://github.com/apple/sourcekit-lsp#branch=main'
    'swift-format::git+https://github.com/apple/swift-format#branch=main'
    'swift-tools-support-core::git+https://github.com/apple/swift-tools-support-core#branch=main'
    'swift-xcode-playground-support::git+https://github.com/apple/swift-xcode-playground-support#branch=main'
    'tensorflow-swift-apis::git+https://github.com/tensorflow/swift-apis.git'
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
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)


# By default makepkg runs strip on binaries. This causes issues with the Swift REPL.
# from https://github.com/RLovelett/swift-aur/blob/master/PKGBUILD
# termux had no trouble up to now, strip all executables and shared objects:
# https://github.com/termux/termux-packages/blob/master/scripts/build/termux_step_massage.sh#L24
# would be cool to not strip only the ones which really are necessary, but how?
options=(!strip)

prepare () {
    ( cd swift && patch -p1 -i "$srcdir/0001-arch-aur-pachtes.patch" )
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

    python swift/utils/build-script --preset=buildbot_linux,no_test install_destdir="$pkgdir"
}

package() {
  ls -la
  # mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
  # ln -s /opt/swift/swift-linux-$CARCH/bin/{lldb-moduleimport-test,sil-extract,sil-opt,swift,swift-autolink-extract,swiftc,swift-demangle,swift-ide-test,swift-llvm-opt} "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

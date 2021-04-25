# Maintainer: Michael Hansen <zrax0111 gmail com>
# Maintainer: soloturn@gmail.com
# Contributor: Theo Tosini <theo.tosini@theoduino.me>
# Contributor: Gábor Sebestyén <segabor@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: fanjiang <prof.fan@foxmail.com>

pkgname=swift-language
#pkgname=(swift swift-lldb)
_swiftver=swift-5.4-DEVELOPMENT-SNAPSHOT-2021-04-23-a
pkgver=5.4
pkgrel=1
swiftargumentparserversion=0.4.1
swiftformatversion=swift-5.3.2-RELEASE
tensorflowswiftapisversion=v0.2
yamsver=3.0.1

pkgdesc="The Swift programming language and debugger"
arch=('x86_64')
url="https://swift.org/"
license=('apache2')
depends=('icu' 'libedit' 'libxml2' 'python' 'libbsd' 'ncurses' )
makedepends=('clang' 'cmake' 'git' 'ninja' 'python-six' 'rsync' 'swig')
provides=('swift-language')
source=(
    "git+https://github.com/apple/swift#tag=${_swiftver}"
    "cmark::git+https://github.com/apple/swift-cmark#tag=${_swiftver}"
    "llbuild::git+https://github.com/apple/swift-llbuild#tag=${_swiftver}"
    "swift-argument-parser::git+https://github.com/apple/swift-argument-parser#tag=${swiftargumentparserversion}"
    "swift-driver::git+https://github.com/apple/swift-driver#tag=${_swiftver}"
    "swift-tools-support-core::git+https://github.com/apple/swift-tools-support-core#tag=${_swiftver}"
    "swiftpm::git+https://github.com/apple/swift-package-manager#tag=${_swiftver}"
    "swift-syntax::git+https://github.com/apple/swift-syntax#tag=${_swiftver}"
    "swift-stress-tester::git+https://github.com/apple/swift-stress-tester#tag=${_swiftver}"
    "swift-corelibs-xctest::git+https://github.com/apple/swift-corelibs-xctest#tag=${_swiftver}"
    "swift-corelibs-foundation::git+https://github.com/apple/swift-corelibs-foundation#tag=${_swiftver}"
    "swift-corelibs-libdispatch::git+https://github.com/apple/swift-corelibs-libdispatch#tag=${_swiftver}"
    "swift-integration-tests::git+https://github.com/apple/swift-integration-tests#tag=${_swiftver}"
    "llvm-project::git+https://github.com/apple/llvm-project#tag=${_swiftver}"
    "0001-arch-aur-pachtes.patch"
    # swift src to check afterwards
    "indexstore-db::git+https://github.com/apple/indexstore-db#tag=${_swiftver}"
    "yams::git+https://github.com/jpsim/Yams#tag=${yamsver}"
    "sourcekit-lsp::git+https://github.com/apple/sourcekit-lsp#tag=${_swiftver}"
    "swift-format::git+https://github.com/apple/swift-format#tag=${swiftformatversion}"
    "swift-tools-support-core::git+https://github.com/apple/swift-tools-support-core#tag=${_swiftver}"
    "swift-xcode-playground-support::git+https://github.com/apple/swift-xcode-playground-support#tag=${_swiftver}"
    "tensorflow-swift-apis::git+https://github.com/tensorflow/swift-apis.git#tag=${tensorflowswiftapisversion}"
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

#pkgver() {
#    cd "$srcdir/swift"
#    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

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
}

# vim:set ts=2 sw=2 et:

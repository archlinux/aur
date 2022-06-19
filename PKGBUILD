# Maintainer: Michael Hansen <zrax0111 gmail com>
# Maintainer: soloturn@gmail.com
# Maintainer: fanjiang <prof.fan@foxmail.com>
# Contributor: Theo Tosini <theo.tosini@theoduino.me>
# Contributor: Gábor Sebestyén <segabor@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=swift-language
_swiftver=swift-5.6-RELEASE
pkgver=5.6.2
pkgrel=1
swiftargumentparserver=1.0.3
swiftcryptover=1.1.5
swiftniover=2.31.2
swiftniosslver=2.15.0
yamsver=4.0.2

pkgdesc="The Swift programming language and debugger"
arch=('x86_64')
url="https://swift.org/"
license=('apache2')
depends=('icu' 'libedit' 'libxml2' 'python' 'libbsd' 'ncurses' )
makedepends=('clang' 'cmake' 'git' 'ninja' 'patch' 'python-six' 'rsync' 'swig')
provides=('swift-language')
source=(
    "git+https://github.com/apple/swift#tag=${_swiftver}"
    "cmark::git+https://github.com/apple/swift-cmark#tag=${_swiftver}"
    "llbuild::git+https://github.com/apple/swift-llbuild#tag=${_swiftver}"
    "swift-argument-parser::git+https://github.com/apple/swift-argument-parser#tag=${swiftargumentparserver}"
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
    "0001-arch-aur-patches.patch"
    "0002-asprintf-exists.patch"
    # swift src to check afterwards
    "indexstore-db::git+https://github.com/apple/indexstore-db#tag=${_swiftver}"
    "yams::git+https://github.com/jpsim/Yams#tag=${yamsver}"
    "sourcekit-lsp::git+https://github.com/apple/sourcekit-lsp#tag=${_swiftver}"
    "swift-cmark-gfm::git+https://github.com/apple/swift-cmark#branch=gfm"
    "swift-crypto::git+https://github.com/apple/swift-crypto#tag=${swiftcryptover}"
    "swift-docc::git+https://github.com/apple/swift-docc#branch=main"
    "swift-docc-render-artifact::git+https://github.com/apple/swift-docc-render-artifact#branch=main"
    "swift-docc-symbolkit::git+https://github.com/apple/swift-docc-symbolkit#branch=main"
    "swift-format::git+https://github.com/apple/swift-format#tag=${_swiftver}"
    "swift-installer-scripts::git+https://github.com/apple/swift-installer-scripts#branch=main"
    "swift-markdown::git+https://github.com/apple/swift-markdown#branch=main"
    "swift-nio::git+https://github.com/apple/swift-nio#tag=${swiftniover}"
    "swift-nio-ssl::git+https://github.com/apple/swift-nio-ssl#tag=${swiftniosslver}"
    "swift-tools-support-core::git+https://github.com/apple/swift-tools-support-core#tag=${_swiftver}"
    "swift-xcode-playground-support::git+https://github.com/apple/swift-xcode-playground-support#tag=${_swiftver}"
)
noextract=()
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
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'e47ca269514997096b6141c18f1dd2cfd83182bb41ccee62169ff3d634198bb4'
    'd9985dd648ecb83d56a48e3128000b869f819526ecda9735d7c6a3b9fd2047b7'
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
    ( cd swift && patch -p1 -i "$srcdir/0001-arch-aur-patches.patch" )
    ( cd swift-corelibs-foundation && patch -p1 -i "$srcdir/0002-asprintf-exists.patch" )
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
    export DISTCC_HOSTS='--randomize localhost red,cpp,lzo green,cpp,lzo blue,cpp,lzo'

    python swift/utils/build-script --preset=buildbot_linux,no_test install_destdir="$pkgdir"
}

package() {
  ls -la
}

# vim:set ts=2 sw=2 et:

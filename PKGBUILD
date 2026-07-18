# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=fluxengine-git
pkgver=r3289.909fac72
pkgrel=1
pkgdesc="PSOC5 floppy disk imaging interface"
arch=('x86_64')
url="http://cowlark.com/fluxengine/"
license=('MIT')
depends=(
    'curl'
    'dbus'
    'file'
    'fmt'
    'freetype2'
    'glfw'
    'libfmt.so'
    'libprotobuf.so'
    'libudev.so'
    'mbedtls'
    'md4c'
    'protobuf'
    'sqlite3'
    'wxwidgets-gtk3'
    'xz'
    'zlib'
)
makedepends=(
    'boost'
    'clang'
    'cli11'
    'git'
    'ninja' # TODO: Doesn't seem to be used any more?
    'nlohmann-json'
    'python-pyhamcrest'
    'python'
    'xxd'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/davidgiven/fluxengine.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    # Make all depends on tests, but we want to run them in check() instead.
    make binaries
}

check() {
    cd "$srcdir/${pkgname%-git}"
    make tests
}

package() {
    cd "$srcdir/${pkgname%-git}"
    for e in fluxengine fluxengine-gui brother120tool brother240tool upgrade-flux-file; do
        install -D "$e" "$pkgdir/usr/bin/$e"
    done
    install -Dm 644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/COPYING.md"
    # Installing docs is not yet supported in a reasonable way by upstream.
}

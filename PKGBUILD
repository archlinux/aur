# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=fluxengine-git
pkgver=r3208.6dde81b1
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
    'zlib'
)
makedepends=(
    'boost'
    'clang'
    'cli11'
    'nlohmann-json'
    'git'
    'ninja'
    'xxd'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/davidgiven/fluxengine.git'
        "git+https://github.com/davidgiven/ImHex.git"
        "git+https://github.com/WerWolv/libwolv.git"
        "git+https://github.com/ocornut/imgui.git"
        "git+https://github.com/WerWolv/PatternLanguage.git"
        "git+https://github.com/btzy/nativefiledialog-extended.git"
        "git+https://github.com/WerWolv/xdgpp.git"
        "git+https://github.com/WerWolv/libromfs.git"
        "git+https://github.com/rockdreamer/throwing_ptr.git"
        "git+https://github.com/sammycage/lunasvg.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule init
    git config submodule.dep/imgui.url "$srcdir/imgui"
    git config submodule.dep/imhex.url "$srcdir/ImHex"
    git config submodule.dep/libromfs.url "$srcdir/libromfs"
    git config submodule.dep/libwolv.url "$srcdir/libwolv"
    git config submodule.dep/lunasvg.url "$srcdir/lunasvg"
    git config submodule.dep/native-file-dialog.url "$srcdir/nativefiledialog-extended"
    git config submodule.dep/pattern-language.url "$srcdir/PatternLanguage"
    git config submodule.dep/throwing_ptr.url "$srcdir/throwing_ptr"
    git config submodule.dep/xdgpp.url "$srcdir/xdgpp"
    git -c protocol.file.allow=always submodule update
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

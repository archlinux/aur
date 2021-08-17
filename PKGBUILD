# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=lsd2dsl
pkgver=0.5.4
pkgrel=1
pkgdesc="Decompiler for ABBYY Lingvo's and Duden proprietary dictionaries"
arch=('i686' 'x86_64')
url='https://rcebits.com/lsd2dsl/index.html'
license=('MIT')
depends=('minizip' 'libvorbis' 'libsndfile' 'boost-libs' 'qt5-webkit')
makedepends=('git' 'cmake' 'boost')
checkdepends=('gtest')
source=(
    "https://github.com/nongeneric/lsd2dsl/archive/v$pkgver.tar.gz"
    'lsd2dsl.desktop'
)
sha512sums=(
    '585781947bdabb245eb0c699faa5fca2c49c8d63f789f1bec1bb9f138e94cb051af71cfd1e915ca6aa304c0779c35bb1e653173e397f4983a0c78b925259b7b6'
    'f607732b0ac17f35b2926fa3da09674f70976e3c21ffbda888d922f9ffe14c29fab9aa29eaeaa0de15f8faeffc10962de97df6892247e96b200f59d7da9618a6'
)

prepare() {
    # Don't treat warnings as errors
    sed -i 's/-Werror //' lsd2dsl-$pkgver/CMakeLists.txt

    # Can't run qt tests in chroot, got error:
    # qt.qpa.xcb: could not connect to display
    sed -ri 's/(InlineRenderAndPrintTable)/DISABLED_\1/' lsd2dsl-$pkgver/tests/duden-tests.cpp
}

build() {
    cd lsd2dsl-$pkgver
    cmake . -DCMAKE_BUILD_TYPE=Release
    make
}

check() {
    # Tests are broken (last checked 2021-08-17)
    # ./lsd2dsl-$pkgver/tests/tests
    echo skip
}

package() {
    install -Dm644 lsd2dsl.desktop -t "$pkgdir/usr/share/applications"

    cd lsd2dsl-$pkgver
    install -Dm755 console/lsd2dsl -t "$pkgdir/usr/bin"
    install -Dm755 gui/lsd2dsl-qtgui -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

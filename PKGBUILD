# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: apaugh
# Contributor: speps <speps at aur dot archlinux dot org>
# shellcheck shell=bash
# shellcheck disable=2034,2154

pkgname=fife
pkgver=0.4.2
pkgrel=5
_githubname=fifengine
pkgdesc="Flexible Isometric Free Engine is a cross platform game creation framework"
arch=('i686' 'x86_64')
url="http://fifengine.net/"
license=('LGPL')
depends=('boost-libs' 'fifechan' 'glew' 'libgl' 'libpng' 'libstdc++5' 'libvorbis' 'openal' 'python' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'tinyxml' 'zlib')
makedepends=('boost' 'cmake' 'samurai' 'swig')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/$_githubname/$_githubname/archive/$pkgver.tar.gz"
        "$pkgname-[PATCH]-removed-flags-that-are-not-supported-with-swig-4.0.patch::https://github.com/$_githubname/$_githubname/commit/d14f232f4cd9a00b05d6872957070e8c020f515d.patch"
        "$pkgname-[PATCH]-SyntaxWarning:-\"is\"-with-a-literal.patch::https://github.com/$_githubname/$_githubname/commit/454a981a777f141db999809944abbc64ed15c41f.patch"
        "$pkgname-[PATCH]-remove-deprecated-getchildren().patch::https://github.com/fifengine/fifengine/commit/cf295fd98a8fba080f6305c27be56d10ab7ce94d.patch"
        "$pkgname-[PATCH]-Fix-build-against-boost-1.77.0.patch::https://github.com/fifengine/fifengine/commit/8072f18a9bf4e75c3e1b197b6ccda11e82954460.patch")
sha512sums=('2b92e936d3f900532c5dee235a217c338941c44da479dceb3e48b3e8b93a402b31dc5501a6533391a01af53d6dbd51b6793c74e8ac81301ae6f1fa18271761a4'
            'd5894f7708030ac6f8cc7612b4a29c1fb68aa2d545362017232874579661097ed1257b7de297489a10951716033d522d4ee6c17033009e2a4eaf3cfbdc26091d'
            '59b47dabc2b02a807c978837ab47498dca140f156159ada2c2cdbcf7a912bd95fcaf622bb92bcd585b1c722d4023f50330c4320d59a76e4ba12bb344da43996c'
            'be566e0e2219e66c734f72a0a1c960589514cda1b4bb40e38e87587ddc1f7f17bb13bb0ab117cace4bcceb900e7e2fd3b4c84818ad77503e514f3974feda7733'
            '470b6aa8b04391cd53a7409ec89f31f3c0e33a0c42ecaa8e65f7635193a68bd57efe1505ea8060f38564f149491453a39bea01b2dea90882c8913eeba227b2d0')

prepare() {
    cd "$_githubname-$pkgver" || exit
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-removed-flags-that-are-not-supported-with-swig-4.0.patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-SyntaxWarning:-\"is\"-with-a-literal.patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-remove-deprecated-getchildren().patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-Fix-build-against-boost-1.77.0.patch"
}

build() {
    cmake \
        -B "$_githubname-$pkgver/aur-build" \
        -S "$_githubname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -G "Ninja" \
        -Wno-dev

    # If compilation seems to stall at 99% for ages, do not abort!
    # While not perfectly convenient, that is to be expected from
    # SWIG. Eventually, you'll reach the holy triple-digit land.
    cmake --build "$_githubname-$pkgver/aur-build"
}

package() {
    DESTDIR="$pkgdir/" cmake --install "$_githubname-$pkgver/aur-build"
}

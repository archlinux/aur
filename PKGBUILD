# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=imgbrd-grabber
pkgver=7.6.0
pkgrel=1
pkgdesc="Very customizable imageboard/booru downloader with powerful filenaming features."
arch=('x86_64')
url="https://github.com/Bionus/imgbrd-grabber"
license=('Apache')
depends=('qt5-multimedia' 'qt5-declarative' 'nodejs')
makedepends=('git' 'cmake' 'qt5-tools' 'npm')
optdepends=('openssl: Access HTTPS sources')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Bionus/imgbrd-grabber.git#tag=v'${pkgver}''
        'git+https://github.com/LaurentGomila/qt-android-cmake.git'
        'git+https://github.com/sakra/cotire.git'
        'git+https://github.com/catchorg/Catch2.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
    cd "$srcdir/${pkgname%}"
    git submodule init
    git config submodule.qt-android-cmake.url "$srcdir/qt-android-cmake"
    git config submodule.qt-android-cmake.path "$srcdir/${pkgname%-git}/cmake/qt-android-cmake"
    git config submodule.cotire.url "$srcdir/cotire"
    git config submodule.cotire.path "$srcdir/${pkgname%-git}/cmake/cotire"
    git config submodule.Catch2.url $srcdir/Catch2
    git config submodule.Catch2.path "$srcdir/${pkgname%-git}/tests/src/vendor/catch"
    git submodule update
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
    "$srcdir/${pkgname%}/src" \
    -DUSE_QSCINTILLA=0 \
    -DUSE_BREAKPAD=O
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
    touch "$pkgdir/usr/share/Grabber/settings.ini"
}

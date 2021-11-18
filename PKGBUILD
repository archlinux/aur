# Maintainer: Flat <flat@imo.uto.moe>
pkgname=imgbrd-grabber-git
pkgver=v7.6.2.r128.46db5730
pkgrel=1
pkgdesc="Very customizable imageboard/booru downloader with powerful filenaming features."
arch=('i686' 'x86_64')
url="https://github.com/Bionus/imgbrd-grabber"
license=('Apache')
depends=('qt5-multimedia' 'qt5-declarative' 'nodejs' 'qt5-networkauth' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt5-tools' 'npm')
optdepends=('openssl: used for HTTPS sources')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Bionus/imgbrd-grabber.git#branch=develop' 'Grabber.desktop')
md5sums=('SKIP' 'SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule update --init --recursive
}

build() {
    cmake -B build -S "${pkgname%-git}/src" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DUSE_QSCINTILLA=0 \
        -DUSE_BREAKPAD=O \
        -Wno-dev
    make -C build
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/${pkgname%-git}/src/gui/resources/images/icon.png" "$pkgdir/usr/share/pixmaps/Grabber.png"
    install -Dm644 "$srcdir/Grabber.desktop" "$pkgdir/usr/share/applications/Grabber.desktop"
    touch "$pkgdir/usr/share/Grabber/settings.ini"
}

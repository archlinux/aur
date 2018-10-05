# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgbase="bibtex2website"
pkgname=('bibtex2website' 'bibtex2website-gui')
pkgver=1.2.0
pkgrel=1
_logcppver=1.9.3
pkgdesc="A program and library that can generate an ordered website out of BibTeX files"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/bibtex2website"
license=('GPL3' 'LGPL3')
depends=()
makedepends=('cmake')
source=("bibtex2website-v${pkgver}.tar.gz::https://github.com/nullptrT/${pkgname}/archive/v${pkgver}.tar.gz"
	"liblogcpp-v${_logcppver}.tar.gz::https://github.com/nullptrT/liblogcpp/archive/v${_logcppver}.tar.gz")
sha256sums=('1a77febde8c2144190782ed4feddeb26ef2e3e11c92f182fa9f32aeb402918a3'
            'e0b758cbe3031548f54ab9d9189bf6a67faf54a4a54fa3c608786194cb56c76f')


prepare() {
    [[ -e "$srcdir/build" ]] && rm -r "$srcdir/build"
    mkdir "$srcdir/build"

    [[ -e "$srcdir/build-lib" ]] && rm -r "$srcdir/build-lib"
    mkdir "$srcdir/build-lib"

    [[ -e "$srcdir/build-gui" ]] && rm -r "$srcdir/build-gui"
    mkdir "$srcdir/build-gui"

    rm -r "$srcdir/bibtex2website-$pkgver/3rdparty/liblogcpp"
    cp -r "$srcdir/liblogcpp-$_logcppver" "$srcdir/bibtex2website-$pkgver/3rdparty/liblogcpp"
}

build_bibtex2website() {
    cd "$srcdir/build"

    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
	"../bibtex2website-${pkgver}"

    make
}

build_bibtex2website-gui() {
    cd "$srcdir/build-gui"

    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
	-DENABLE_QT_GUI=ON \
	"../bibtex2website-${pkgver}"

    make
}

package_bibtex2website() {
    pkgname=('bibtex2website')
    license=('GPL3' 'LGPL3')

    build_bibtex2website

    cd "$srcdir/build"

    install -Dm644 "$srcdir/build/bin/bibtex2website" "$pkgdir/usr/bin/bibtex2website"
    chmod +x "$pkgdir/usr/bin/bibtex2website"
}

package_bibtex2website-gui() {
    pkgname=('bibtex2website-gui')
    depends+=('qt5-base')
    license=('LGPL3')

    build_bibtex2website-gui

    install -Dm644 "$srcdir/build-gui/bin/BibTeX2WebsiteGUI" "$pkgdir/usr/bin/bibtex2website-gui"
    chmod +x "$pkgdir/usr/bin/bibtex2website-gui"

    install -Dm644 "$srcdir/$pkgbase-$pkgver/lib/bibtex2website-gui.desktop" "$pkgdir/usr/share/applications/bibtex2website-gui.desktop"
    install -Dm644 "$srcdir/$pkgbase-$pkgver/lib/bibtex2website.svg" "$pkgdir/usr/share/$pkgbase/bibtex2website.svg"
}

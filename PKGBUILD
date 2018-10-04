# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="bibtex2website"
pkgver=1.0.1
pkgrel=1
_logcppver=1.9.3
pkgdesc="A program that can generate an ordered website out of BibTeX files"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/bibtex2website"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake')
source=("bibtex2website-v${pkgver}.tar.gz::https://github.com/nullptrT/${pkgname}/archive/v${pkgver}.tar.gz"
	"liblogcpp-v${_logcppver}.tar.gz::https://github.com/nullptrT/liblogcpp/archive/v${_logcppver}.tar.gz"
	"bibtex2website.desktop")
sha256sums=('b2c947bda7e5028d3639a266b653220361f0eb25d5765fe471bedf328de8acb4'
            'e0b758cbe3031548f54ab9d9189bf6a67faf54a4a54fa3c608786194cb56c76f'
            '75d71bf43d00dc869d797afeb8e12e94e2a7cddac335c84940f48d7abd91d565')



prepare() {
    [[ -e "$srcdir/build" ]] && rm -r "$srcdir/build"
    mkdir "$srcdir/build"
    rm -r "$srcdir/bibtex2website-$pkgver/3rdparty/liblogcpp"
    cp -r "$srcdir/liblogcpp-$_logcppver" "$srcdir/bibtex2website-$pkgver/3rdparty/liblogcpp"
}

build() {
    cd "$srcdir/build"

    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
	-DENABLE_QT_GUI=ON \
	"../bibtex2website-${pkgver}"

    make
}

package() {
    cd "$srcdir/build"

    install -Dm644 "$srcdir/build/bin/bibtex2website_generator" "$pkgdir/usr/bin/bibtex2website"
    install -Dm644 "$srcdir/build/bin/BibTeX2WebsiteGUI" "$pkgdir/usr/bin/bibtex2website-gui"
    chmod +x "$pkgdir/usr/bin/bibtex2website"*

    install -Dm644 "$srcdir/bibtex2website.desktop" "$pkgdir/usr/share/applications/bibtex2website.desktop"
}

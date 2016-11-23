# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=acquisition-plus
pkgver=0.5g
pkgrel=1
pkgdesc="Inventory management tool for Path of Exile"
url="https://github.com/Novynn/acquisitionplus"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-webkit' 'libxkbcommon-x11' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('boost')
install='acquisition.install'

source=("https://github.com/Novynn/acquisitionplus/archive/${pkgver}.tar.gz"
        "acquisition.desktop")

sha256sums=('506e90b17fe0bd99b7a985b5b3e18cce1ce4d60ba0992cc8368c5719f9c485e5'
            '556e8a764ecaf9ac4b9b7f6b6340c7bff7aae9c1b179fc0601d93886bc810e81')

prepare() {
    cd "$srcdir/acquisitionplus-${pkgver}"
    qmake
    sed -i Makefile \
        -e "s:CFLAGS .*=.*:CFLAGS = $CFLAGS -D_REENTRANT -fPIC -std=c11 \$(DEFINES):" \
        -e "s:CXXFLAGS .*=.*:CXXFLAGS = $CXXFLAGS -D_REENTRANT -fPIC -std=c++11 \$(DEFINES):" \
        -e "s:LFLAGS .*=.*:LFLAGS = $LDFLAGS:"
}

build() {
    cd "$srcdir/acquisitionplus-${pkgver}"
    make
}

package() {
    cd "$srcdir/acquisitionplus-${pkgver}"
    install -Dm755 acquisition            "$pkgdir/usr/bin/acquisitionplus"
    install -Dm644 assets/icon.svg        "$pkgdir/usr/share/icons/hicolor/scalable/apps/acquisitionplus.svg"
    install -Dm644 ../acquisition.desktop "$pkgdir/usr/share/applications/acquisitionplus.desktop"
    install -Dm644 COPYING                "$pkgdir/usr/share/licenses/$pkgname"
}

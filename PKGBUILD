# Maintainer: David Zmick <dpzmick@gmail.com>
pkgname=jack-keyboard
pkgver=2.7.2
pkgrel=1
epoch=0
pkgdesc="Virtual MIDI keyboard that uses JACK MIDI."
arch=('x86_64' 'i686')
url="http://jack-keyboard.sourceforge.net/"
license=('BSD')
depends=('jack' 'gtk2' 'pango')
makedepends=(cmake)
optdepends=('lash: integrate with lash session management') # TODO what?
options=(makeflags buildflags)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=("0d7f8a10592f242374ac028a6b1e8a15")
# validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    if pacman -Qi lash; then
        echo "Not using LASH, package not found"
        LASH_FLAG="True"
    else
        LASH_FLAG="False"
    fi
    # hack around: https://gitlab.kitware.com/cmake/cmake/issues/19531
    export CFLAGS="${CFLAGS} $(pkg-config --cflags gtk+-2.0)"
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DLashEnable=${LASH_FLAG}
}

build() {
	cd "$pkgname-$pkgver"
    make
}

package() {
	cd "$pkgname-$pkgver"
    make install DESTDIR=${pkgdir}
}

# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=atari800
pkgver=4.2.0
_pkgver=${pkgver//./_}
pkgrel=2
pkgdesc="An emulator of the Atari 800/800XL/130XE/5200 with various extensions"
arch=('i686' 'x86_64')
url="https://atari800.github.io"
license=('GPL2')
depends=('sdl')
optdepends=('libpng: PNG screenshot support')
source=("https://github.com/atari800/${pkgname}/archive/ATARI800_${_pkgver}.tar.gz"
	"atari800.desktop")
sha256sums=('0bad99575293742e9e062e9fe9d104fe57228b1a32fec7a033b889edc819d7a4'
	    '95e03020358a0855e12ee19b62abebb336e472fcf525f7eb42dcc28419588df9')

build() {
    cd "${pkgname}-ATARI800_${_pkgver}"

    ./autogen.sh

    # configure default - neccessary
    COPTS="--prefix=/usr"

    # The R: Network device
    #COPTS="${COPTS} --enable-riodevice"

    # SIO Sound for true retro feeling
    #COPTS="${COPTS} --enable-seriosound"

    # OnScreen Keyboard
    #COPTS="${COPTS} --enable-onscreenkeyboard"

    ./configure ${COPTS}
    make
}

package() {
    cd "${pkgname}-ATARI800_${_pkgver}"/src
    make DESTDIR="${pkgdir}/" install
    install -Dm755 "${srcdir}/atari800.desktop" "${pkgdir}/usr/share/applications/atari800.desktop"
    install -Dm755 "../data/atari2.png" "${pkgdir}/usr/share/pixmaps/atari800.png"
    msg2 "\e[1;32mThis package has some options you might interested in. Have a look to COPTS at PKGBUILD. \e[0m"
}

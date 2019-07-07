# Maintainer: beest <gnubeest@zoho.com>
# Contributor: c0mmando <c0mmand0_88 at yahoo dot com dot ar>
# Contributor: Farhan Yousasf <farhany at gmail dot com>
# Contributor: Vinzenz Vietzke <vinz at archlinux dot us>

pkgname=atari800
pkgver=4.1.0
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="An emulator of the Atari 800/800XL/130XE/5200 with various extensions"
arch=('i686' 'x86_64')
url="https://atari800.github.io"
license=('GPL2')
depends=('sdl')
optdepends=('libpng: PNG screenshot support')
source=("https://github.com/atari800/${pkgname}/archive/ATARI800_${_pkgver}.tar.gz"
	"onscreenkeyboard.patch")
sha256sums=('4b77c876db0c2eb2de2a82301e0cd8855d588db5ceec9594c32a9294c5d9de7c'
	'ac52bcea73a20b2bbf8c060eafca96d4697a7dc96961e1ab28836b8a09808ff1')

build() {
    cd "${pkgname}-ATARI800_${_pkgver}"

    # https://github.com/atari800/atari800/issues/58
    patch -p0 < ${srcdir}/onscreenkeyboard.patch

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
    msg2 "\e[1;32mThis package has some options you might interested in. Have a look to COPTS at PKGBUILD. \e[0m"
}

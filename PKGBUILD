# Maintainer: Frederic Bezies
# based on Oliver Jaksch <arch-aur@com-in.de> PKGBUILD for Atari800

pkgname=atari800-git
_pkgname=atari800
pkgver=r2794.4ef57600
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="An emulator of the Atari 800/800XL/130XE/5200 with various extensions - git"
arch=('i686' 'x86_64')
url="https://atari800.github.io"
license=('GPL2')
depends=('sdl')
conflicts=('atari800')
optdepends=('libpng: PNG screenshot support')
source=("git+https://github.com/atari800/atari800.git"
	"atari800.desktop")
sha256sums=('SKIP'
	    '95e03020358a0855e12ee19b62abebb336e472fcf525f7eb42dcc28419588df9')
	    
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
	    

build() {
    cd "${_pkgname}"

    ./autogen.sh

    # configure default - neccessary
    COPTS="--prefix=/usr"

    # The R: Network device
    COPTS="${COPTS} --enable-riodevice"

    # SIO Sound for true retro feeling
    COPTS="${COPTS} --enable-seriosound"

    # OnScreen Keyboard
    COPTS="${COPTS} --enable-onscreenkeyboard"

    ./configure ${COPTS}
    make
}

package() {
    cd "${_pkgname}"
    make DESTDIR="${pkgdir}/" install
    install -Dm755 "${srcdir}/atari800.desktop" "${pkgdir}/usr/share/applications/atari800.desktop"
    install -Dm755 "${srcdir}/atari800/data/atari2.png" "${pkgdir}/usr/share/pixmaps/atari800.png"
}

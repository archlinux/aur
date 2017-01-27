# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

# TODO:
#       * is this x86_64 and i386 (should be but go to test)?
#               QXcbConnection: Could not connect to display + core dump + segfault (only i686
#       * Why my udev rules + udev controll--reload + udevadm trigger change my X keymap to US ?
#       * make a git version ?
pkgname=moolticute
pkgver=0.5.2
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64' 'i686')
url="https://github.com/raoulh/${pkgname}"
license=('GPL3')

depends=('libusb'
         'qt5-base'
         'qt5-websockets')

makedepends=('make'
             'qt5-base')
checkdepends=()
optdepends=()
install="${pkgname}.install"

# https://github.com/raoulh/moolticute/archive/v0.5.2-beta.tar.gz
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}-beta.tar.gz"
        '69-mooltipass.rules'
        'moolticute.service')
sha256sums=('a22d4078870da77affb67c7eae2d2cc426ec799a0928f494df32ab995431fe8a'
           'e8e8da3f29d27e34a9f41b23ba04b74dbf25bcc7d586e5b6d2ee72bade889503'
           '135d7dda3698872745bec79fa2ee7a964fa2fbc90f90d1d57e034bc0104ce13a')

build() {
	cd "${pkgname}-${pkgver}-beta"

        mkdir build
        cd build/

        qmake-qt5 ../Moolticute.pro                     \
                  PREFIX=/usr                           \
                  QMAKE_CFLAGS_RELEASE="${CFLAGS}"      \
                  QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"

        make
}

package() {
	cd "${pkgname}-${pkgver}-beta/build/"

	make INSTALL_ROOT="${pkgdir}/" install
        install -Dm644 "${srcdir}/69-mooltipass.rules" \
                "${pkgdir}/usr/lib/udev/rules.d/69-mooltipass.rules"
        install -Dm644 "${srcdir}/moolticute.service" \
                "${pkgdir}/usr/lib/systemd/user/moolticute.service"
}

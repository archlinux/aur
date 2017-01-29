# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute-git
_pkgname="${pkgname%-git}"
pkgver=0.5.2.r0.g9486816
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64' 'i686')
url="https://github.com/raoulh/${_pkgname}"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libusb'
         'qt5-base'
         'qt5-websockets')

makedepends=('git'
             'make')
checkdepends=()
optdepends=()
install="${_pkgname}.install"

source=("git+${url}.git"
        '69-mooltipass.rules'
        'moolticute.service')
sha256sums=('SKIP'
            'e8e8da3f29d27e34a9f41b23ba04b74dbf25bcc7d586e5b6d2ee72bade889503'
            '135d7dda3698872745bec79fa2ee7a964fa2fbc90f90d1d57e034bc0104ce13a')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/beta.//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

        mkdir build
        cd build/

        qmake-qt5 ../Moolticute.pro                     \
                  PREFIX=/usr                           \
                  QMAKE_CFLAGS_RELEASE="${CFLAGS}"      \
                  QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}"

        make
}

package() {
	cd "${srcdir}/${_pkgname}/build/"

	make INSTALL_ROOT="${pkgdir}/" install
        install -Dm644 "${srcdir}/69-mooltipass.rules" \
                "${pkgdir}/usr/lib/udev/rules.d/69-mooltipass.rules"
        install -Dm644 "${srcdir}/moolticute.service" \
                "${pkgdir}/usr/lib/systemd/user/moolticute.service"
}

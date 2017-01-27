# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

# TODO:
#       * why keymap change ?
#       * systemd file
#       * upload rules (+ check signature) + update udev rules
#       * beta make  quiet hard to pkg
#       * is this x86_64 and i386 (should be but go to test)?
#       * add UDEV rules in /usr/lib
#       * ask for gpg signature
#       * test ?!
#       * https://wiki.archlinux.org/index.php/Makepkg#CFLAGS.2FCXXFLAGS.2FCPPFLAGS_in_makepkg.conf_do_not_work_for_QMAKE_based_packages
#       * make a git version ?
#       * Why my udev rules + udev controll--reload + udevadm trigger change my X keymap to US
pkgname=moolticute
pkgver=0.5.2
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64')
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
        '69-mooltipass.rules')
sha256sums=('a22d4078870da77affb67c7eae2d2cc426ec799a0928f494df32ab995431fe8a'
           'e8e8da3f29d27e34a9f41b23ba04b74dbf25bcc7d586e5b6d2ee72bade889503')

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
}

# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=moolticute-git
_pkgname="${pkgname%-git}"
pkgver=0.9.8.r2.g2d985db
pkgrel=1
pkgdesc="Easy companion for Mooltipass device"
arch=('x86_64' 'i686')
url="https://github.com/raoulh/${_pkgname}"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libusb'
         'mooltipass-udev'
         'qt5-base'
         'qt5-websockets'
         'hicolor-icon-theme')
makedepends=('git'
             'make'
             'qt5-tools')
source=("git+${url}.git"
        'moolticute.sysusers')
sha256sums=('SKIP'
           'a0cb3d71b107359efc6807b0b728a1abc4c9c3a2d908db63cf9d59f0c659022c')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags | sed 's/beta.//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    sed -i "s/#define APP_VERSION \"git\"/#define APP_VERSION \"git-${pkgver}\"/" ./src/version.h
    # sed -i 's/#User=nobody/User=moolticute/' ./systemd/moolticuted.service
    # sed -i 's/#Group=plugdev/Group=moolticute/' ./systemd/moolticuted.service
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

    # install -Dm644 ../../moolticute.sysusers "${pkgdir}/usr/lib/sysusers.d/moolticute.conf"
}

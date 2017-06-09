# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=screencloud
pkgver=1.3.1
pkgrel=7
pkgdesc="Easy to use screenshot sharing application."
arch=('i686' 'x86_64')
url="https://github.com/olav-st/screencloud"
license=('GPL2')
makedepends=('cmake' 'qt5-tools')
depends=('quazip' 'pythonqt' 'qt5-x11extras' 'xdg-utils' 'hicolor-icon-theme')
optdepends=('python-crypto: required for SFTP support')
options=('strip' 'docs' 'libtool' '!staticlibs' 'emptydirs' 'zipman' 'purge' '!optipng' '!upx' '!debug' '!emptydirs')
install="${pkgname}".install
conflicts=('screencloud-git')
#source=(${pkgname}-${pkgver}.tar.gz::https://github.com/olav-st/${pkgname}/archive/v${pkgver}.tar.gz)
# fix CMake Error PYTHONQT_LIBRARY (ADVANCED) before release
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/olav-st/screencloud/archive/22ff74bd2835b66e030fd31601e62d15f3b6a634.zip)
sha256sums=('2ffe2703519edcb627451e2a1f8833b49f039bbfcd81111f09f8a3d3d827db99')

prepare() {
    # hack, fix CMake Error PYTHONQT_LIBRARY (ADVANCED)
    mv "${srcdir}/screencloud-22ff74bd2835b66e030fd31601e62d15f3b6a634/" "${srcdir}/${pkgname}-${pkgver}"
    # Create build directory
    mkdir -p "${srcdir}/${pkgname}-${pkgver}"/build
}

build() {
    # Needed for the self-compiled version
    local _consumer_key='ef5d77317892721a0acebbbc8157272b055da8074'
    local _consumer_secret='2d745141473f640b566aba29147fd672'

    cd "${srcdir}/${pkgname}-${pkgver}"/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DCONSUMER_KEY_SCREENCLOUD="${_consumer_key}" \
        -DCONSUMER_SECRET_SCREENCLOUD="${_consumer_secret}" \
        -DQT_USE_QT5=ON \
        -DPYTHON_USE_PYTHON3=ON \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    # Installing package
    cd "${srcdir}/${pkgname}-${pkgver}"/build

    # Install files
    make DESTDIR="${pkgdir}" install
}

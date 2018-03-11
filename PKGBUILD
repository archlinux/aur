# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=screencloud
pkgver=1.3.1.1
pkgrel=1
_pkgcommit=ad3727e1d5391899c783c94ffc2d537083f56309
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
source=(${pkgname}-${pkgver}-master.tar.gz::https://github.com/olav-st/screencloud/archive/${_pkgcommit}.zip)
sha256sums=('5734d7af31b7ebc8eafbaf02668449e2fa5b05bea9545371df89a1bc24896333')

prepare() {
    # Create build directory
    #mkdir -p "${srcdir}/${pkgname}-${pkgver}"/build
    mkdir -p "${srcdir}/${pkgname}-${_pkgcommit}"/build
}

build() {
    # Needed for the self-compiled version
    local _consumer_key='ef5d77317892721a0acebbbc8157272b055da8074'
    local _consumer_secret='2d745141473f640b566aba29147fd672'

    #cd "${srcdir}/${pkgname}-${pkgver}"/build
    cd "${srcdir}/${pkgname}-${_pkgcommit}"/build

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
    #cd "${srcdir}/${pkgname}-${pkgver}"/build
    cd "${srcdir}/${pkgname}-${_pkgcommit}"/build

    # Install files
    make DESTDIR="${pkgdir}" install
}

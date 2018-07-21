# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=screencloud
pkgver=1.3.1
pkgrel=1
pkgdesc='An easy to use screenshot sharing application'
arch=('i686' 'x86_64')
url='https://github.com/olav-st/screencloud/'
license=('GPL2')
makedepends=('cmake')
depends=(
    # official repositories:
        'quazip' 'zlib' 'python' 'openssl' 'libx11' 'libxext' 'qt5-base'
        'qt5-svg' 'qt5-x11extras' 'qt5-multimedia' 'hicolor-icon-theme'
    # AUR:
        'pythonqt'
)
optdepends=('python-crypto: for SFTP support')
conflicts=('screencloud-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/olav-st/${pkgname}/archive/v${pkgver}.tar.gz"
        'screencloud-1.3.1-fix-pythonqt-detection.patch')
sha256sums=('c23d8efb955ea861920c548f7fd3255726e86409d7a2022952225c765cc3da52'
            '9ec7c818fe5db23e72199946c25bd528b302e7b12ee29f9791c50ffc6dba2c1e')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    mkdir -p build
    
    patch -Np1 -i "${srcdir}/screencloud-1.3.1-fix-pythonqt-detection.patch"
}

build() {
    # needed for the self-compiled version
    local _consumer_key='ef5d77317892721a0acebbbc8157272b055da8074'
    local _consumer_secret='2d745141473f640b566aba29147fd672'

    cd "${pkgname}-${pkgver}/build"

    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCOLOR_OUTPUT:BOOL='ON' \
        -DCONSUMER_KEY_SCREENCLOUD:STRING="$_consumer_key" \
        -DCONSUMER_SECRET_SCREENCLOUD:STRING="$_consumer_secret" \
        -DPYTHON_USE_PYTHON3:BOOL='ON' \
        -DQT_USE_QT5:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}-${pkgver}/build"

    make DESTDIR="$pkgdir" install
}

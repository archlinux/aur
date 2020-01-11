# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=screencloud
pkgver=1.5.1
pkgrel=1
pkgdesc='An easy to use screenshot sharing application'
arch=('x86_64')
url='https://github.com/olav-st/screencloud/'
license=('GPL')
depends=(
    # official repositories:
        'quazip' 'python' 'libx11' 'qt5-base' 'qt5-x11extras' 'qt5-multimedia'
        'hicolor-icon-theme'
    # AUR:
        'pythonqt'
)
makedepends=('cmake' 'zlib' 'openssl' 'qt5-svg' 'qt5-tools')
optdepends=('python-pycryptodome: for SFTP support')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/olav-st/${pkgname}/archive/v${pkgver}.tar.gz"
        '010-screencloud-fix-python-link-libraries.patch')
sha256sums=('2a22ca06fc217574aee2204fdae4ba9c01cf6d5d78a63334ae95207bfbf0fc72'
            '5526080cd195127cc94f4c8d69ae3e55e6d3b24b6feeb23c1d5f8f885c87d7f4')

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-screencloud-fix-python-link-libraries.patch"
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCOLOR_OUTPUT:BOOL='ON' \
        -DPYTHON_USE_PYTHON3:BOOL='ON' \
        -DQT_USE_QT5:BOOL='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}

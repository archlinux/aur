# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=screencloud
pkgver=1.5.3
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
optdepends=('python-ssh2: for SFTP support')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/olav-st/${pkgname}/archive/v${pkgver}.tar.gz"
        '010-screencloud-fix-python-link-libraries.patch')
sha256sums=('cff8cf5f5afa5c7aee2d7dd3a8ce28a9808f703042e03dd635b255c5b5a12c27'
            'bf9327568513852f02b87c7a72474b50ed323ed525098e790e190472f9b1fa8e')

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-screencloud-fix-python-link-libraries.patch"
}

build() {
    local _quazip_include
    _quazip_include="$(find /usr/include -type d -name 'QuaZip-Qt5*')/quazip"
    
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DPYTHON_USE_PYTHON3:BOOL='ON' \
        -DQUAZIP_INCLUDE_DIR:PATH="${_quazip_include}" \
        -DQUAZIP_LIBRARY:FILEPATH='/usr/lib/libquazip1-qt5.so' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}

# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=screencloud
pkgver=1.6.2
pkgrel=1
pkgdesc='An easy to use screenshot sharing application'
arch=('x86_64')
url='https://github.com/olav-st/screencloud/'
license=('GPL-2.0-or-later')
depends=(
    'bash'
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libstdc++'
    'libx11'
    'python'
    'pythonqt>=4.1.0'
    'qt6-base'
    'qt6-multimedia'
    'quazip-qt6'
    'xdg-utils')
makedepends=(
    'cmake')
optdepends=(
    'python-ssh2: for SFTP plugin support')
source=("https://github.com/olav-st/screencloud/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('076b01ceca0797051b0075fb6e9c5cc826392f765599145ce5a04dfb5ffe30a8')

build() {
    local _qtver
    _qtver="$(LC_ALL='C' pacman -Qi 'qt6-base' | awk '/^Version/ { print $3 }' | sed 's/-[0-9]\+$//')"
    
    export CXXFLAGS+=" -isystem/usr/include/qt6/QtGui/${_qtver}"
    
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}

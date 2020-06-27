# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=ksystemlog
pkgname=${_pkgname}-git
pkgver=.r475.0e1ad31
pkgrel=1
pkgdesc='KDE SystemLog Application. (GIT version)'
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kde/kdeadmin/${_pkgname}"
license=(GPL)
depends=('kio')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('kdeadmin-ksystemlog' 'ksystemlog' 'ksystemlog-frameworks-git')
provides=("${_pkgname}")
source=('git+https://github.com/KDE/ksystemlog.git')
sha1sums=('SKIP')
install=${pkgname}.install

pkgver() {
    cd ${_pkgname}
    _ver="$(cat src/main.cpp | grep -m2 QStringLiteral | tail -n1 | cut -d '"' -f6)"
    echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    if [ -d build ] ; then
        rm build -rf
    fi
}

build() {
    mkdir build && cd build
    cmake ../${_pkgname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DBUILD_TESTING=OFF
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}

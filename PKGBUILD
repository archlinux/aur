# Maintainer: taotieren <admin@taotieren.com>

pkgname=serial-studio
_pkgname=Serial-Studio
pkgver=2.0.0
pkgrel=0
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=('x86_64'
    'aarch64'
    'riscv64')
url="https://github.com/Serial-Studio/Serial-Studio"
license=('MIT')
groups=()
_qt=qt6
depends=(gcc-libs
    glibc
    $_qt-5compat
    $_qt-base
    $_qt-connectivity
    $_qt-declarative
    $_qt-serialport)
makedepends=(git
    $_qt-charts
    $_qt-quickcontrols2
    $_qt-svg
    $_qt-tools)
provides=(${_pkgname} ${pkgname} ${pkgname}-git)
conflicts=(${_pkgname} ${pkgname} ${pkgname}-git)
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git"
    "git+https://github.com/alex-spataru/QSimpleUpdater.git"
    "git+https://github.com/iamantony/qtcsv.git"
    "git+https://github.com/jothepro/doxygen-awesome-css.git"
    "git+https://github.com/alex-spataru/qmqtt.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
noextract=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "$srcdir/${pkgname}"
    git checkout -b v$pkgver v$pkgver
    git submodule init
    git config submodule.libs/QSimpleUpdater.url "$srcdir/QSimpleUpdater"
    git config submodule.libs/qtcsv.url "$srcdir/qtcsv"
    git config submodule.doc/doxygen/doxygen-awesome-css.url "$srcdir/doxygen-awesome-css"
    git config submodule.libs/qmqtt.url "$srcdir/qmqtt"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/${pkgname}"
    qmake6 ./${_pkgname}.pro CONFIG+=[release]
    make -j$(nproc)
}

package() {
    cd "$srcdir/${pkgname}"
    make INSTALL_ROOT="$pkgdir/" install
}

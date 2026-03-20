# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-lotus-git
pkgver=1.5.2.r490.gbebfc23
pkgrel=1
pkgdesc="Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/LotusInputMethod/fcitx5-lotus"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'libstdc++' 'libgcc' 'pyside6' 'python-dbus' 'libudev.so=1-64')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'gcc' 'git' 'libx11' 'python')
provides=('fcitx5-lotus')
conflicts=('fcitx5-lotus')
source=(
    'git+https://github.com/LotusInputMethod/fcitx5-lotus.git#branch=dev'
    'git+https://github.com/LotusInputMethod/bamboo-core.git'
)
sha256sums=('SKIP' 'SKIP')
install='fcitx5-lotus.install'

pkgver() {
    cd "$srcdir/fcitx5-lotus"
    local version=$(grep "^project(fcitx5-lotus VERSION" CMakeLists.txt | \
    sed 's/.*VERSION \([0-9.]*\).*/\1/')
    
    local count=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    
    echo "${version}.r${count}.g${hash}"
}

prepare() {
    cd "$srcdir/fcitx5-lotus"
    git submodule init
    git config submodule.bamboo/bamboo-core.url "$srcdir"/bamboo-core
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/fcitx5-lotus"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
    make
}

package() {
    cd "$srcdir/fcitx5-lotus"
    make install DESTDIR="$pkgdir"
}

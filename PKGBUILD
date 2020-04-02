# Maintainer: Kristóf Marussy <kris7topher at gmail dot com>
# Contributor: Afnan Enayet <afnan@afnan.io>

pkgname=logiops-git
_pkgname="logiops"
_gitpkgname="logiops"
pkgver=r37.00298c0
pkgrel=1
pkgdesc="An unofficial driver for Logitech HID++>2.0 mice and keyboard"
arch=('x86_64')
url="https://github.com/PixlOne/$_gitpkgname"
license=('GPL3')
depends=('libevdev' 'systemd-libs' 'libconfig')
makedepends=('git' 'cmake')
conflicts=("${_pkgname-*}")
provides=("${_pkgname-*}")
source=("git+https://github.com/PixlOne/$_gitpkgname")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitpkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_gitpkgname"
    git submodule init
    git submodule update --recursive
}

build() {
    cd "$_gitpkgname"
    mkdir -p build
    cd build
    rm -rf *
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$_gitpkgname/build"
    make install DESTDIR="$pkgdir"
}

# Maintainer: Morozyuk Daniil <morozyuk.d.p@gmail.com>

pkgname=linux-devmgmt-git
pkgver=r7.0ef905b
pkgrel=1
pkgdesc="Linux device management tool"
arch=('x86_64')
url="https://github.com/actuallyaridan/linux-devmgmt"
license=('GPL-3.0-or-later')
depends=('qt6-base')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname}::git+https://github.com/actuallyaridan/linux-devmgmt.git"
    "device-manager.desktop"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    cp "${srcdir}/device-manager.desktop" "${srcdir}/${pkgname}/device-manager.desktop"
}

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${pkgname}"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${pkgname}"
    install -Dm755 build/devmgmt "${pkgdir}/usr/bin/devmgmt"
    install -Dm644 device-manager.desktop "${pkgdir}/usr/share/applications/device-manager.desktop"
}
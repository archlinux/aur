# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Maxime Dirksen <aur@emixam.be>
# Contributor: Supdrewin <supdrewin at outlook dot com>
# Contributor: Andrey Kolchenko <andrey@kolchenko.me>
# Contributor: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>
pkgname=linux-enable-ir-emitter
pkgver=5.2.4
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
arch=('x86_64')
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
depends=(
    'fmt'
    'gtk3'
    'opencv'
    'python'
)
makedepends=(
    'meson'
    'qt6-base'
    'zlib'
)
conflicts=(
    'chicony-ir-toggle'
    'linux-enable-ir-emitter-git'
)
install=linux-enable-ir-emitter.install
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/EmixamPP/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=('572df51f2e16d56cf27fd3d89b0cd2b12531dd0527810ad6908a5317714a074442e0bb256d6b890c76ca7dfba2bb0917bf14984b2bd60598436c8f2cbf33e7df')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Fix issue linking static zlib
    sed -i -e 's/dependency('\''zlib'\'', static: true)/dependency('\''zlib'\'', static: false)/g' meson.build
}

build() {
    cd "${srcdir}"
    mkdir -p build
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson install -C ../build --destdir "$pkgdir"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Maxime Dirksen <aur@emixam.be>
# Contributor: Supdrewin <supdrewin at outlook dot com>
# Contributor: Andrey Kolchenko <andrey@kolchenko.me>
# Contributor: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>
pkgname=linux-enable-ir-emitter
pkgver=5.2.0
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
arch=('x86_64')
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
depends=(
    'fmt'
    'gtk3'
    'python'
    'opencv'
)
makedepends=(
    'meson'
    'qt6-base'
)
conflicts=(
    'chicony-ir-toggle'
    'linux-enable-ir-emitter-git'
)
install=linux-enable-ir-emitter.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/EmixamPP/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('552fd97a26264a86fb1a5d30adf57df27f95a28b9014451f6f4977b16366dc54d2fe21d7554739ca57e5af6154902882546e572e8914b1802330b7a0eeb0fc94')

prepare() {
    # https://github.com/EmixamPP/linux-enable-ir-emitter/pull/145
    sed -i -e 's/default_library=static/default_library=shared/g' "${srcdir}/${pkgname}-${pkgver}/meson.build"
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

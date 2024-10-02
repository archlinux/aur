# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Maxime Dirksen <aur@emixam.be>
# Contributor: Supdrewin <supdrewin at outlook dot com>
# Contributor: Andrey Kolchenko <andrey@kolchenko.me>
# Contributor: Rui ZHAO <renyuneyun@gmail.com>
# Contributor: Antoine Bertin <ant.bertin@gmail.com>
pkgname=linux-enable-ir-emitter
pkgver=6.0.4
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
arch=(x86_64)
url=https://github.com/EmixamPP/linux-enable-ir-emitter
license=(MIT)
depends=(
    fmt
    gtk3
    opencv
    spdlog
    yaml-cpp
)
makedepends=(
    argparse
    meson
    qt6-base
    zlib
)
conflicts=(
    chicony-ir-toggle
    linux-enable-ir-emitter-git
)
install=linux-enable-ir-emitter.install
source=(
    $pkgname-$pkgver.tar.gz::https://github.com/EmixamPP/$pkgname/archive/refs/tags/$pkgver.tar.gz
    fix-build.patch::https://patch-diff.githubusercontent.com/raw/EmixamPP/linux-enable-ir-emitter/pull/197.patch
)
b2sums=('9ef00fd0c8048631ef8108f5a25a47758fb320a2de8723ad8609db75dec74851649170087cc68cd5d3d7bdf3280d68897274dcf9c925475225efcc527a2ee2e2'
        '91f72aba0cd32af62ff0f5cc38d04627c4977a33f0a724bda06b7127c39df58c471919e9a3010b30da612463f8f9ca9f90c6352f274e3309f50c08eb60a0da7f')

prepare() {
    # https://github.com/EmixamPP/linux-enable-ir-emitter/issues/193
    patch -Np1 -d $pkgname-$pkgver -i ../fix-build.patch
}

build() {
    mkdir -p build
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

package() {
    cd $pkgname-$pkgver
    meson install -C ../build --destdir "$pkgdir"
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD
# shellcheck disable=SC2148,SC2034,SC2154,SC2164
# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
pkgname=obs-vertical-canvas
pkgver=1.6.7
pkgrel=1
pkgdesc='Add vertical canvas to OBS'
arch=('x86_64' 'x86_64_v3')
url='https://aitum.tv/products/vertical'
license=('GPL-2.0-or-later')
depends=('obs-studio>=31.1')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aitum/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('627e1bc4e1b67d9c2627c3a60fd86fcffa80813b95f07f3baa38ae7506266b238633548ca4f7cefeead434e864018f518a74fbf93e52f9b66a65a91bcd5dfe3d')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Plugin upstream has trouble dealing with Qt Private shenaningans
  sed -i 's/Widgets Core/Widgets Core GuiPrivate/g' CMakeLists.txt
}

build() {
    cd "${pkgname}-${pkgver}"
    cmake -S . -B build \
        -DBUILD_OUT_OF_TREE=On \
        --install-prefix "${pkgdir}/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations"
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"
    cmake --install build
    rm -rf "${pkgdir}"/usr/{data,obs-plugins}
}

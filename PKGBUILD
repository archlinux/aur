# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qimgv-light
pkgver=1.0.2
pkgrel=2
pkgdesc='Qt6 image viewer (without any optional features)'
arch=(x86_64 i686 armv6h armv7h aarch64)
url=https://github.com/easymodo/qimgv
license=(GPL3)
depends=(qt6-base qt6-imageformats qt6-svg qt6-5compat)
makedepends=(cmake qt6-tools)
provides=("${pkgname%-light}")
conflicts=("${pkgname%-light}")
optdepends=('kimageformats: support for more image formats'
            'qtraw: raw images support')
source=("${pkgname%-light}"-"${pkgver}".tar.gz::"${url}"/archive/refs/tags/v"${pkgver}".tar.gz
        https://github.com/easymodo/qimgv/commit/b8d3a5f56af71a928465223ac0d99085b029c59d.patch)
sha256sums=('ace75077c5b6f3cb2b0d40b24482b3778728d98dce75ed8186c7ae4282e57634'
            'e8bba9dd1e0b62298ce4831a2ebfa6a63cf6784877e853ece78255af7b42c653')

prepare() {
    patch --directory="${pkgname%-light}"-"${pkgver}" --forward --strip=1 --input="${srcdir}/b8d3a5f56af71a928465223ac0d99085b029c59d.patch"
}

build() {
    cmake -B build -S "${pkgname%-light}"-"${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DEXIV2=OFF \
        -DVIDEO_SUPPORT=OFF \
        -DOPENCV_SUPPORT=OFF \
        -Wno-dev
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

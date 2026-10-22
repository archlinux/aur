# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=cyanrip
pkgver=0.9.3.1
pkgrel=2
pkgdesc='Fully featured CD ripping program'
arch=('x86_64')
url='https://github.com/cyanreg/cyanrip'
license=('GPL3')
depends=('curl' 'ffmpeg' 'libcdio-paranoia' 'libmusicbrainz5')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cyanreg/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}-ffmpeg9.patch::https://github.com/cyanreg/${pkgname}/commit/7dbbe1122248e91510351900af84a6f7c0464271.patch?full_index=1")
sha512sums=('f5c9ee1920aa930e6a096a550e19ed9602f1709384d3d76766ae7d60ff7625c88960e84459b4179a80b5b7a939698198a5b3d9e37a4aa472dccd71c5201a9727'
            '699c6a7bc4e20b1db6d96f21a3d4de0c774b7dfd3aba13aafe86dd25096a590d4187122449f875c064f61a317efe3db4e651196e2e6e056a77ad87a93a37e4b2')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Fix build with FFmpeg 9: https://github.com/cyanreg/cyanrip/issues/142
    patch -Np1 -i "../${pkgname}-ffmpeg9.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    meson --prefix=/usr build
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}

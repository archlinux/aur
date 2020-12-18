# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=astc-encoder
pkgver=2.1
pkgrel=1
pkgdesc='A tool for compressing and decompressing images using the ASTC texture compression standard'
arch=('x86_64')
url='https://github.com/ARM-software/astc-encoder/'
license=('Apache')
depends=('gcc-libs')
source=("https://github.com/ARM-software/astc-encoder/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-astc-encoder-use-arch-flags.patch')
sha256sums=('655bf72ff09d6337e6e9cbce217c5cdf53437acdcfacc2b6005db774433f64a8'
            '578e63355d8455312561d5667f714ab8f97491ae0327b9756de02b83546b01d1')

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-astc-encoder-use-arch-flags.patch"
}

build() {
    make -C "${pkgname}-${pkgver}/Source" APP='astcenc' VEC='sse2'
    make -C "${pkgname}-${pkgver}/Source" APP='astcenc' VEC='sse4.2'
    make -C "${pkgname}-${pkgver}/Source" APP='astcenc' VEC='avx2'
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/Source"/astcenc-{sse2,sse4.2,avx2} -t "${pkgdir}/usr/bin"
    ln -s astcenc-sse2 "${pkgdir}/usr/bin/astcenc"
}

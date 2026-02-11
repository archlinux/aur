# Maintainer: Popolon <Popolon aL popolon.org>

pkgbase=thorvg
pkgname=thorvg
pkgver=1.0.0
pkgrel=1
pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
arch=("$CARCH")
url="https://www.thorvg.org/"
license=('MIT')
depends=('libpng' 'libjpeg' 'libwebp' 'mesa' 'libx11')
makedepends=('meson' 'ninja')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('134a24aeb84988c36d188d6cabb62521b5186ae09d7f26a0bb807a1bab51439b')

prepare() {
    cd ${pkgname}-${pkgver}
    meson setup builddir --prefix=/usr \
      -Dsimd=true \
      -Dloaders=svg,png,jpg,ttf,webp \
      -Dsavers=all \
      -Dbindings="capi" \
      -Dtools=all \
      -Dengines=sw,gl \
      --reconfigure
}

build() {
    cd ${pkgname}-${pkgver}
    ninja -C builddir
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
    DESTDIR="$pkgdir/" ninja -C builddir install
}

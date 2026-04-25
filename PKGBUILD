# Maintainer: Popolon <Popolon aL popolon.org>

pkgbase=thorvg
pkgname=thorvg
pkgver=1.0.4
pkgrel=1
pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
arch=("$CARCH")
url="https://www.thorvg.org/"
license=('MIT')
depends=('libpng' 'libjpeg' 'libwebp' 'mesa' 'libx11')
makedepends=('meson' 'ninja')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1a60b794eaac5717ad79d0c7e3d189f46e21d469b3a0013d7804f348fbacdf17')

prepare() {
    cd ${pkgname}-${pkgver}
    meson setup builddir --prefix=/usr \
      -Dsimd=true \
      -Dloaders=svg,png,jpg,ttf,webp \
      -Dsavers=all \
      -Dbindings="capi" \
      -Dtools=all \
      -Dengines=cpu,gl \
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

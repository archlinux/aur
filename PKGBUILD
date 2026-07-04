# Maintainer: Popolon <Popolon aL popolon.org>

pkgbase=thorvg
pkgname=thorvg
pkgver=1.0.7
pkgrel=1
pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
arch=("$CARCH")
url="https://www.thorvg.org/"
license=('MIT')
depends=('libpng' 'libjpeg-turbo' 'libwebp' 'mesa' 'libx11')
makedepends=('meson' 'ninja')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e541af1fc7e18e4fbf5eba098c638d28eb3562c2285b33985606ca2c7005ee4e')

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

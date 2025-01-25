# Maintainer: Popolon <Popolon aL popolon.org>

pkgbase=thorvg
pkgname=thorvg
pkgver=0.15.9
pkgrel=2
pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
arch=('x86_64' 'aarch64' 'riscv32' 'riscv64' 'i386' 'i686' 'armv7h' 'armv6h' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
url="https://www.thorvg.org/"
license=('MIT')
depends=('libpng' 'libjpeg' 'libwebp' 'mesa' 'libx11')
makedepends=('meson' 'ninja')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('05c5424d5065f38db832c87785e3cc0e135443797a4431bdcda6807abf75d8cc')

prepare() {
    cd ${pkgname}-${pkgver}
    meson setup builddir --prefix=/usr \
      -Dengines=all \
      -Dloaders=all \
      -Dsavers=all \
      -Dtools=all
}

build() {
    cd ${pkgname}-${pkgver}
    ninja -C builddir
}

_package() {
    pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
    cd ${pkgname}-${pkgver}
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
    DESTDIR="$pkgdir/" ninja -C builddir install
}

_package-examples() {
depends=('sdl2')

    pkgdesc="Examples for ${pkgbase} ${pkgdesc}"
    cd ${pkgbase}-${pkgver}
    meson setup builddir --prefix=/usr \
      -Dexamples=true \
      -Dengines=all \
      -Dloaders=all \
      -Dsavers=all \
      -Dtools=all
    ninja -C builddir

    mkdir -p ${pkgdir}/usr/share/doc/${pkgbase}
    cp -a builddir/examples ${pkgdir}/usr/share/doc/${pkgbase}/
    cp -a examples ${pkgdir}/usr/share/doc/${pkgbase}/
}

pkgname=(
 "${pkgbase}"
 "${pkgbase}-examples"
)
for _p in "${pkgname[@]}"; do
   eval "package_$_p() {
     $(declare -f "_package${_p#$pkgbase}")
     _package${_p#$pkgbase}
   }"
done

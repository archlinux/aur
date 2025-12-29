# Maintainer: Popolon <Popolon aL popolon.org>

pkgbase=thorvg
pkgname=thorvg
pkgver=0.15.16
pkgrel=3
pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
arch=('x86_64' 'aarch64' 'riscv32' 'riscv64' 'i386' 'i686' 'armv7h' 'armv6h' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
url="https://www.thorvg.org/"
license=('MIT')
depends=('libpng' 'libjpeg' 'libwebp' 'mesa' 'libx11')
makedepends=('meson' 'ninja')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'example_stdio_h.patch')
sha256sums=('a7fc0aaf9e1aa5c1bc8f4f2035571ce87136a3c65fd9b3019eb25f9c58fba83c'
            '5eaf0991514b272c1da7f7f696643306b5d501a06733c36c01f5c972cc8394c7')

prepare() {
    cd ${pkgname}-${pkgver}
    sed -i 's|DEXAMPLE_DIR="@0@|DEXAMPLE_DIR="/usr/share/doc/thorvg|' meson.build
    patch -p1 -i ../example_stdio_h.patch
    meson setup builddir --prefix=/usr \
      -Dsimd=true \
      -Dengines=all \
      -Dloaders=all \
      -Dsavers=all \
      -Dbindings="capi,wasm_beta" \
      -Dtools=all \
      -Dexamples=true \
      --reconfigure
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
#    mv $pkgdir/usr/bin/svg2png $pkgdir/usr/bin/tvg-svg2png
#    mv $pkgdir/usr/bin/svg2tvg $pkgdir/usr/bin/tvg-svg2tvg
#    mv $pkgdir/usr/bin/lottie2gif $pkgdir/usr/bin/tvg-lottie2gif
}

_package-examples() {
depends=('sdl2')

    pkgdesc="Examples for ${pkgbase} ${pkgdesc}"
    cd ${pkgbase}-${pkgver}

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

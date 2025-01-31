# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=thorvg-git
pkgbase=thorvg-git
_pkgname=thorvg
pkgver=r3504.746ca7f5
pkgrel=4
pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
arch=('x86_64' 'aarch64' 'riscv32' 'riscv64' 'i386' 'i686' 'armv7h' 'armv6h' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
url="https://www.thorvg.org/"
license=('MIT')
depends=('libpng' 'libjpeg' 'libwebp' 'mesa' 'libx11')
makedepends=('meson' 'ninja')
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git"
        'example_stdio_h.patch'*)
sha256sums=(SKIP
            '5eaf0991514b272c1da7f7f696643306b5d501a06733c36c01f5c972cc8394c7')

pkgver() {
    cd "${_pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
    sed -i 's|DEXAMPLE_DIR="@0@|DEXAMPLE_DIR="/usr/share/doc/thorvg-git|' meson.build
    patch -p1 -i ../example_stdio_h.patch
    meson setup builddir --prefix=/usr \
      -Dengines=sw,gl \
      -Dsimd=true \
      -Dloaders=all \
      -Dsavers=all \
      -Dbindings="capi" \
      -Dtools=all \
      -Dexamples=true \
      --reconfigure
}

build() {
    cd ${_pkgname}
    ninja -C builddir
}

_package() {
conflicts=('thorvg')
provides=('thorvg')
    pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
    cd ${_pkgname}
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgbase}/
    DESTDIR="$pkgdir/" ninja -C builddir install
}

_package-examples() {
depends=('sdl2' 'thorvg-git')
conflicts=('thorvg-examples')
provides=('thorvg-examples')

    pkgdesc="Examples for ${pkgbase} ${pkgdesc}"
    cd ${_pkgname}

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

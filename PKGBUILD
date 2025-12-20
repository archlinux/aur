# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=thorvg-git
pkgbase=thorvg-git
_pkgname=thorvg
pkgver=r4245.c498989b7
pkgrel=1
pkgdesc="lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
url="https://www.thorvg.org/"
arch=('x86_64' 'aarch64' 'riscv32' 'riscv64' 'i386' 'i686' 'armv7h' 'armv6h' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
license=('MIT')
depends=('libpng' 'libjpeg' 'libwebp' 'mesa' 'libx11') # doesn"t work with it either: 'wgpu-native-git')
makedepends=('meson' 'ninja')
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git"
	"${_pkgname}.examples::git+https://github.com/${_pkgname}/${_pkgname}.example.git"
)
sha256sums=(SKIP
            SKIP)

pkgver() {
    cd "${_pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
    sed -i 's|DEXAMPLE_DIR="@0@|DEXAMPLE_DIR="/usr/share/doc/thorvg-git|' meson.build
    meson setup builddir --prefix=/usr \
      -Dsimd=true \
      -Dloaders=svg,png,jpg,ttf,webp \
      -Dsavers=all \
      -Dbindings="capi,wasm_beta" \
      -Dtools=all \
      --reconfigure
#      -Dengines=all \ autodetected even if meson_build write default:sw???

}

build() {
    cd ${_pkgname}
    ninja -C builddir

    # examples
    cd ../${_pkgname}.examples
    meson setup builddir
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

    mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}-examples
    rm -R ${_pkgname}.examples/builddir/src/*.p
    cp -a ${_pkgname}.examples/builddir/src/* ${pkgdir}/usr/share/doc/${_pkgname}-examples/
    cp -a ${_pkgname}.examples/res ${pkgdir}/usr/share/doc/${_pkgname}-examples/
    cp -a ${_pkgname}.examples/src/*.cpp ${pkgdir}/usr/share/doc/${_pkgname}-examples/
    cp -a ${_pkgname}.examples/src/all.sh ${pkgdir}/usr/share/doc/${_pkgname}-examples/
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

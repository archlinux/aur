# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=thorvg-examples-git
_pkgname=thorvg-examples
pkgver=r22.7174d46
pkgrel=1
pkgdesc="examples for lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
url="https://www.thorvg.org/"
arch=('x86_64' 'aarch64' 'riscv32' 'riscv64' 'i386' 'i686' 'armv7h' 'armv6h' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
license=('MIT')
depends=('libpng' 'libjpeg' 'libwebp' 'mesa' 'libx11' 'thorvg-git') # doesn"t work with it either: 'wgpu-native-git')
makedepends=('meson' 'ninja')
conflicts=('thorvg-examples')
provides=('thorvg-examples')
source=("${_pkgname}::git+https://github.com/thorvg/thorvg.example.git")
sha256sums=(SKIP)

pkgver() {
    cd "${_pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
    sed -i 's|DEXAMPLE_DIR="@0@|DEXAMPLE_DIR="/usr/share/doc/thorvg-examples|' meson.build
    meson setup builddir --prefix=/usr \
      --reconfigure
#      -Dengines=all \ autodetected even if meson_build write default:sw???

}

build() {
    cd ${_pkgname}
    meson setup builddir
    ninja -C builddir
}

package() {
    mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}
    rm -R ${_pkgname}/builddir/src/*.p
    cp -a ${_pkgname}/builddir/src/* ${pkgdir}/usr/share/doc/${_pkgname}/
    cp -a ${_pkgname}/res ${pkgdir}/usr/share/doc/${_pkgname}/
    cp -a ${_pkgname}/src/*.cpp ${pkgdir}/usr/share/doc/${_pkgname}/
    cp -a ${_pkgname}/src/all.sh ${pkgdir}/usr/share/doc/${_pkgname}/
}

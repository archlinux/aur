# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=thorvg-git
pkgbase=thorvg-git
_pkgname=thorvg
pkgver=r4556.e753da99b
pkgrel=1
pkgdesc="lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
url="https://www.thorvg.org/"
arch=($CARCH)
license=('MIT')
depends=('libpng' 'libjpeg-turbo' 'libwebp' 'mesa' 'libx11') # doesn"t work with it either: 'wgpu-native-git')
makedepends=('meson' 'ninja')
conflicts=('thorvg')
provides=('thorvg')
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git"
)
sha256sums=(SKIP)

pkgver() {
    cd "${_pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
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
    cd ${_pkgname}
    ninja -C builddir
}

package() {
    pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
    cd ${_pkgname}
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgbase}/
    DESTDIR="$pkgdir/" ninja -C builddir install
}

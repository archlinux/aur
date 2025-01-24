# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=thorvg-git
_pkgname=thorvg
pkgver=r3496.83eb89c5
pkgrel=1
pkgdesc="An open-source, lightweight, and portable library designed for rendering vector-based scenes and animations, including SVG and Lottie formats"
arch=('x86_64' 'aarch64' 'riscv32' 'riscv64' 'i386' 'i686' 'armv7h' 'armv6h' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
url="https://www.thorvg.org/"
license=('MIT')
depends=('libpng' 'libjpeg' 'libwebp' 'mesa' 'libx11')
makedepends=('meson' 'ninja')
conflicts=('thorvg')
provides=('thorvg')
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git")
sha256sums=(SKIP)

pkgver() {
    cd "${_pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname}
    meson setup builddir --prefix=/usr \
      -Dengines=sw,gl \
      -Dloaders=all \
      -Dsavers=all \
      -Dtools=all
}

build() {
    cd ${_pkgname}
    ninja -C builddir
}

package() {
    cd ${_pkgname}
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
    DESTDIR="$pkgdir/" ninja -C builddir install
}

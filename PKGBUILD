# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=quake2rtx
pkgver=1.5.0
pkgrel=3
pkgdesc="Ray-traced version of Quake II."
arch=(x86_64 aarch64)
url="https://github.com/NVIDIA/Q2RTX"
license=('GPL')
groups=()
depends=(zlib curl sdl2 vulkan-headers vulkan-driver)
makedepends=(git cmake)
checkdepends=()
optdepends=()
provides=('quake2rtx')
conflicts=('quake2rtx-bin')
replaces=()
source=("git+https://github.com/NVIDIA/Q2RTX.git"
        "https://github.com/NVIDIA/Q2RTX/releases/download/v${pkgver}/q2rtx-${pkgver}-linux.tar.gz")
sha256sums=('SKIP'
            '7ecf2798fbacce7efde0c6e02f6b08f850328a391a1cb5cb90719833b7c591c8')

prepare() {
  cd $srcdir/Q2RTX
  git checkout tags/v1.5.0
  git submodule update --init --recursive
  mkdir -p $srcdir/Q2RTX/{build,baseq2}
  cp -rf $srcdir/q2rtx/baseq2/* $srcdir/Q2RTX/baseq2/
}

build() {
  cd $srcdir/Q2RTX/build
  cmake ..
  cmake --build .
}

package() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}/bin"
  cp "${srcdir}/q2rtx"/{changelog.md,license.txt,notice.txt,readme.md} "${pkgdir}/usr/share/${pkgname}/"
  cp "${srcdir}/q2rtx"/find-retail-paks.sh "${pkgdir}/usr/share/${pkgname}/bin/"
  cp "${srcdir}/Q2RTX"/q2rtx{,ded} "${pkgdir}/usr/share/${pkgname}/bin/"
  cp -r "${srcdir}/Q2RTX/baseq2" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm755 "${srcdir}/q2rtx/q2rtx.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/q2rtx/q2rtx.sh" "${pkgdir}/usr/bin/q2rtx"
  install -Dm755 "${srcdir}/q2rtx/find-retail-paks.sh" "${pkgdir}/usr/bin/${pkgname}-find-retail-paks"
  install -Dm644 \
    "${srcdir}/q2rtx/q2rtx.png" \
    "${pkgdir}/usr/share/pixmaps/q2rtx.png"
  install -Dm644 \
    "${srcdir}/q2rtx/q2rtx.desktop" \
    "${pkgdir}/usr/share/applications/q2rtx.desktop"
}

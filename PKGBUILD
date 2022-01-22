# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=quake2rtx
pkgver=1.6.0
pkgrel=1
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
            'd2c8218b8d0e232a23f05b4b4a83097d28d53291584ef850bb79de8b888aa3b4')

prepare() {
  cd $srcdir/Q2RTX
  git checkout tags/v${pkgver}
  sed -i 's/spurious\/SDL-mirror/libsdl-org\/SDL/' .gitmodules .git/config
  git submodule update --init --recursive
  rm -rf extern/SDL2
  git submodule update --init --recursive --remote --merge extern/SDL2
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

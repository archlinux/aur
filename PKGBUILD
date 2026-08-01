# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: flovo <flovo-git-commit@f-voegele.de>

pkgname=katago-cuda
_pkgname=katago
pkgver=1.17.2
pkgrel=1
pkgdesc='Baduk engine with no human-provided knowledge'
arch=(x86_64)
provides=($_pkgname)
conflicts=($_pkgname)
url='https://github.com/lightvector/KataGo'
license=(MIT)
depends=(libzip)
makedepends=(cmake cuda cudnn ninja)
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
        # Strongest confidently-rated network
        "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-zhizi-b40c768nbt-s11272M-d5935M.bin.gz"
)
b2sums=('1e6a000f4b79bc8896af090e2b8209ca3037e9e7cb6b9842b848c779800e066fe0835cbfe37c6012df23c7e65d3fbf4a44d7146c1afd05fed17949357367f832'
        '47d4f059434fdd3a85fe590186513e24999d6ed23ad7d5d073ecd73f44672b15e0ff10d475b17950b1673b7f49137be9573f059e182afd389c4b8e20ff2db0b2'
)
_model_source=("${source[@]:1}")
_model=("${_model_source[@]##*/}")
noextract=("${_model[@]}")

build() {
  cmake \
    -S "KataGo-${pkgver}/cpp" \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D USE_BACKEND=CUDA \
    -D NO_GIT_REVISION=1 \
    -G Ninja
  cmake --build build
}

package() {
  install -Dm755 build/katago "${pkgdir}/usr/bin/katago"
  install -Dm644 "KataGo-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  # install models
  for mi in "${_model[@]}"; do
      install -Dm644 "${mi}" "${pkgdir}/usr/share/${_pkgname}/${mi}"
  done
}

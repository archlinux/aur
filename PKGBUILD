# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: flovo <flovo-git-commit@f-voegele.de>

pkgname=katago-cuda
_pkgname=katago
pkgver=1.16.3
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
        "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b28c512nbt-s9584861952-d4960414494.bin.gz"
)
b2sums=('8ccf2f3d9c0a7d70679daf3694fed7a082825af3e28b75a9d47c8b7659a1989edab4e131ee1b7655701ced74971bbae6b794cb4e07fce8fc9be3c164de5dd4db'
        '835ff9f0ccf0566123b4a00c43beaeee79bc280fba983da34426fab52b45ee6b2dfd5873c4b824cdd31b4addc71f4671429e49fd9400659d4e98e9f6ce2bb2af'
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

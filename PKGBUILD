# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: flovo <flovo-git-commit@f-voegele.de>

pkgname=katago-cuda
_pkgname=katago
pkgver=1.16.2
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
        "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b28c512nbt-s9104401152-d4834640479.bin.gz"
)
b2sums=('43d2b05a008eed1a16c1a593381b42237a4d48c339e2f8dc3970713f25375e99fc4ef3d5e88cef85e27f6a57585d5908a566e44c7958e3e47abbad7276e9ac33'
        '18c60f1e60372663d8c56e95258ec4bfb85f3771c98f09eed3e8e7f285b4351bba8c03895d9d236a77910a48c87eb96e6532680f86e07eb0a59950286c18f00f'
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

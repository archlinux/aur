# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: flovo <flovo-git-commit@f-voegele.de>

pkgname=katago-cuda
_pkgname=katago
pkgver=1.15.3
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
        "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b28c512nbt-s7332806912-d4357057652.bin.gz"
        # Latest network
        "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b28c512nbt-s7503868160-d4406856118.bin.gz"
)
b2sums=('4d93899bb1f6084788971591d4c4200eacd754e0fb47da6407afb47c23a9d358c14ab261d064c0c8d8f31343cb0ce2f983afd38ab850a08950d65ef2b814f8cf'
        '5c21ee85b74c661fdaefd5e6d5bfb86f6d0c23b4b26474052b72d7901e6944b0626a751d7ccc2b90eed6255c500980b9512892965f2bf265049b00618f693f68'
        '34db5b039ffa00953cf9fd0ad36f608f71ccaf0a3b29128a53bc10117dfa6a923bf2a7a24886d5a0f18444f9cfa86dedecf27862bc3c7949d18c6ece802c8802'
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

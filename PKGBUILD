# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: flovo <flovo-git-commit@f-voegele.de>

pkgname=katago-cuda
_pkgname=katago
pkgver=1.15.1
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
        "cpp.patch"
        # Strongest confidently-rated network
        "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b28c512nbt-s7168446720-d4316919285.bin.gz"
        # Latest network
        "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b28c512nbt-s7415360768-d4383183533.bin.gz"
)
b2sums=('129856dfce328a574d7fd8aff2d71ab88dcdc21984c035de1c3f69af9343601e8a2573b7a5c9151e23b52da59dfb42d72af50634dc7ced57b684f8e62d0774b7'
        'a1a9c21121460d43c5d94a292b35bf2e032a09e31371685eb5b27d58283140930e9ea63b202059258d9f89bbdb711238398f4f33c7de52bf1c55d3ed0d80daab'
        'fea3ed0d0feb548940c1b2b8c9a4538113d4483f58dd119d591f466c71cc2b65757e52867e68170df5da29bf2ca0a41c933d4e96b55daae0324881b71e6d2e70'
        'c79a5aea46e666b85e3003b225094825296d694f48f818f3006196c684d4da24032a500c86b7b4df479ffebb86de612335a3658c226e1983a193e98b4824bed6'
)
_model_source=("${source[@]:2}")
_model=("${_model_source[@]##*/}")
noextract=("${_model[@]}")

prepare() {
  cd "KataGo-${pkgver}"
  patch -p0 -i "${srcdir}/cpp.patch"
}

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

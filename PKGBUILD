# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: flovo <flovo-git-commit@f-voegele.de>

pkgname=katago-cuda
_pkgname=katago
pkgver=1.16.4
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
        "https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b28c512nbt-adam-s11165M-d5387M.bin.gz"
)
b2sums=('7356e1c71c4f9a6c3cfbb9e4bccc07b21ce1d84265fd4ade11be65e0eb3dbadb50e9e52bd64f1266023cc084bf52aadbd15d76495cab29eed61d398473d8e82f'
        '4aa7a435dc5a9bcd1abc3d30baa17530382138d4975cfcedd43aa44e7273c1ae558627ba70e0c9ffe34159d00372c70566fc56a05538781d447fed4d0b7d2eef'
)
_model_source=("${source[@]:1}")
_model=("${_model_source[@]##*/}")
noextract=("${_model[@]}")

prepare() {
  cd "KataGo-${pkgver}/cpp"
  sed -i '/if(CMAKE_CUDA_COMPILER_VERSION VERSION_GREATER_EQUAL 12\.8)/c\
if(CMAKE_CUDA_COMPILER_VERSION VERSION_GREATER_EQUAL 13.0)\
  set(CMAKE_CUDA_ARCHITECTURES 75 80 86 87 90 120)\
elseif(CMAKE_CUDA_COMPILER_VERSION VERSION_GREATER_EQUAL 12.8)' CMakeLists.txt
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
